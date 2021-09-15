# Global variables

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type = string
}

# Steady Networks

variable "vpc_id" {
  description = "vpc_id"
  default     = "vpc-0a655d3511e10849d"
}

variable "steady_VPC_CIDR" {
  type    = string
  default = "172.29.0.0/16"
}

variable "EKS_VPC_CIDR" {
  type    = string
  default = "10.17.0.0/16"
}

# Services

variable "msk" {
  type = map(object({
    cluster_name    = string
    kafka_version   = string
    ebs_volume_size = number
    instance_type   = string
    net_offset      = number
  }))
  description = "MSK clusters"
}