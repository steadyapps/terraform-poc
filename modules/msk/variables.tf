variable "kafka_version" {
  type    = string
  default = "2.7.0"
}

variable "number_of_broker_nodes" {
  type    = number
  default = 3
}

variable "create_cname" {
  type    = bool
  default = false
}

variable "domain" {
  type    = string
  default = ""
}

variable "cname_prefix" {
  type    = string
  default = ""
}


variable "cluster_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ebs_volume_size" {
  type = number
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "zookeeper_client_port" {
  type    = number
  default = 2181
}

variable "kafka_internal_port" {
  type    = number
  default = 9092
}

variable "kafka_outside_port" {
  type    = number
  default = 9094
}

variable "steady_VPC_CIDR" {
  type    = string
  default = "172.29.0.0/16"
}

variable "EKS_VPC_CIDR" {
  type = string
}

variable "subnets" {
  type = map(object({
      availability_zone = string
      cidr = string
  }))
}

variable "server_properties" {
  default = <<PROPERTIES
auto.create.topics.enable = true
delete.topic.enable = true
log.retention.ms = 259200000
PROPERTIES
}