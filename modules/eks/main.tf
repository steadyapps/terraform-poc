resource "aws_iam_role" "main" {
  name = "eks-${var.cluster_name}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "main-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.main.name
}

# Optionally, enable Security Groups for Pods
# Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
resource "aws_iam_role_policy_attachment" "main-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.main.name
}

resource "aws_eks_cluster" "main" {
  name     = "example"
  role_arn = aws_iam_role.main.arn

  vpc_config {
    subnet_ids = [aws_subnet.subnet_az1.id, aws_subnet.subnet_az2.id, aws_subnet.subnet_az3.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.main-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.main-AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}