resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id

  ingress {
    protocol  = "-1"
    self      = true
    from_port = 0
    to_port   = 0
  }

  ingress {
    protocol    = "TCP"
    from_port   = var.kafka_outside_port
    to_port     = var.kafka_outside_port
    cidr_blocks = [data.aws_vpc.main.cidr_block, var.EKS_VPC_CIDR]
    description = "Bootstrap servers TLS inside VPC"
  }
  ingress {
    protocol    = "TCP"
    from_port   = var.kafka_internal_port
    to_port     = var.kafka_internal_port
    cidr_blocks = [data.aws_vpc.main.cidr_block, var.EKS_VPC_CIDR]
    description = "Bootstrap servers - Inside VPC"
  }
  ingress {
    protocol    = "TCP"
    from_port   = var.zookeeper_client_port
    to_port     = var.zookeeper_client_port
    cidr_blocks = [var.steady_VPC_CIDR]
    description = "ZooKeeper connect - Jenkins - Server"
  }
  ingress {
    protocol    = "TCP"
    from_port   = var.kafka_outside_port
    to_port     = var.kafka_outside_port
    cidr_blocks = [var.steady_VPC_CIDR]
    description = "Bootstrap servers TLS Jenkins - Server"
  }
  ingress {
    protocol    = "TCP"
    from_port   = var.kafka_internal_port
    to_port     = var.kafka_internal_port
    cidr_blocks = [var.steady_VPC_CIDR]
    description = "Bootstrap servers - Jenkins - Server"
  }
  ingress {
    protocol    = "TCP"
    from_port   = var.zookeeper_client_port
    to_port     = var.zookeeper_client_port
    cidr_blocks = [data.aws_vpc.main.cidr_block, var.EKS_VPC_CIDR]
    description = "ZooKeeper connect - Inside VPC"
  }
  ingress {
    protocol    = "TCP"
    from_port   = 11001
    to_port     = 11001
    cidr_blocks = [var.steady_VPC_CIDR]
    description = "Jenkins - Server / NewRelic metric"
  }
  ingress {
    protocol    = "TCP"
    from_port   = 11002
    to_port     = 11002
    cidr_blocks = [var.steady_VPC_CIDR]
    description = "Jenkins - Server / NewRelic metric"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name        = "msk-${var.environment}"
    Environment = var.environment
  }
}
