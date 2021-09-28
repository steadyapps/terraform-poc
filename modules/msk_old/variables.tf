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

variable "subnets" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "configuration_name" {
  type = string
}

variable "configuration_revision" {
  type = any
}