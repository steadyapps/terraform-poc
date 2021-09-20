variable "kubernetes_version" {
  type    = string
  default = "1.21"
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

variable "net_offset" {
  type = number
}