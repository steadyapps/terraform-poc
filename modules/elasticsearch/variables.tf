variable "domain" {}
variable "instance_count" {}
variable "instance_type" {}
variable "subnet_ids" {
  type = list
}
variable "ebs_volume_size" {}
variable "volume_type" {}
variable "tag_domain" {}
variable "env" {}