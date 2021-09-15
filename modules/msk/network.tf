data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_availability_zones" "main" {
  state = "available"
}

resource "aws_subnet" "subnet_az1" {
  availability_zone = data.aws_availability_zones.main.names[0]
  cidr_block        = cidrsubnet(data.aws_vpc.main.cidr_block, 8, var.net_offset + 0)
  vpc_id            = data.aws_vpc.main.id
  tags = {
    Name        = "Subnet az1 for ${var.cluster_name}-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_subnet" "subnet_az2" {
  availability_zone = data.aws_availability_zones.main.names[1]
  cidr_block        = cidrsubnet(data.aws_vpc.main.cidr_block, 8, var.net_offset + 1)
  vpc_id            = data.aws_vpc.main.id
  tags = {
    Name        = "Subnet az2 for ${var.cluster_name}-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_subnet" "subnet_az3" {
  availability_zone = data.aws_availability_zones.main.names[2]
  cidr_block        = cidrsubnet(data.aws_vpc.main.cidr_block, 8, var.net_offset + 2)
  vpc_id            = data.aws_vpc.main.id
  tags = {
    Name        = "Subnet az3 for ${var.cluster_name}-${var.environment}"
    Environment = var.environment
  }
}