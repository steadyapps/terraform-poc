resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id

  tags = {
    name        = "EKS-${var.environment}"
    Environment = var.environment
  }
}
