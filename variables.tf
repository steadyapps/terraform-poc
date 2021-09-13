variable "msk_kafka_version" {
  type    = string
  default = "2.7.0"
}

variable "msk_cluster_name" {
  type = string
}

variable "msk_instance_type" {
  type = string
}

variable "msk_ebs_volume_size" {
  type = number
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type = string
}

variable "msk_vpc_id" {
  type = string
}

variable "msk_zookeeper_client_port" {
  type    = number
  default = 2181
}

variable "msk_kafka_internal_port" {
  type    = number
  default = 9092
}

variable "msk_kafka_outside_port" {
  type    = number
  default = 9094
}

variable "msk_steady_VPC_CIDR" {
  type    = string
  default = "172.29.0.0/16"
}

variable "msk_EKS_VPC_CIDR" {
  type = string
}

variable "msk_net_offset" {
  type = number
}