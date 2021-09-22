# Global variables

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type = string
}

variable "domain" {
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
# MSK
# Configuration
variable "msk_configurations" {
  type = map(object({
    name                   = string
    kafka_versions         = list(string)
    server_properties_file = string
  }))
}
# clusters
variable "msk_clusters" {
  type = map(object({
    cluster_name           = string
    configuration_name     = string
    configuration_revision = any
    kafka_version          = string
    number_of_broker_nodes = number
    ebs_volume_size        = number
    instance_type          = string
    create_cname           = bool
    cname_prefix           = string
    subnets = map(object({
      availability_zone = string
      cidr              = string
    }))
  }))
  description = "MSK clusters"
}