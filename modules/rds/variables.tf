variable "snapshot_name" {
  type    = string
  default = ""
}

variable "restore_from_snapshot" {
  type = bool
  #description = "(optional) describe your variable"
}

variable "copy_tags_to_snapshot" {
  type    = bool
  default = false
  #description = "(optional) describe your variable"
}

variable "cluster_name" {
  type = string
  #description = "(optional) describe your variable"
}

variable "engine" {
  type = string
  #description = "(optional) describe your variable"
}

variable "engine_version" {
  type = string
  #description = "(optional) describe your variable"
}
variable "database_name" {
  type = string
  #description = "(optional) describe your variable"
}
variable "db_cluster_parameter_group_name" {
  type = string
  #description = "(optional) describe your variable"
}

variable "master_username" {
  type = string
  #description = "(optional) describe your variable"
}

variable "backup_retention_period" {
  type = string
  #description = "(optional) describe your variable"
}

variable "storage_encrypted" {
  type    = bool
  default = true
  #description = "(optional) describe your variable"
}

variable "enabled_cloudwatch_logs_exports" {
  type    = list(any)
  default = []
}

variable "vpc_security_group_ids" {
  type = list(any)
  #default = []
}

variable "subnet_ids" {
  type = list(any)

}
variable "db_subnet_group_name" {
  type = string
  #default = []
}

variable "db_instance_class" {
  type = string
  #default = []
}

variable "rds_instance_name" {
  type = string
  #default = []
}

variable "performance_insights_enabled " {
  type = bool
  #default = []
}




variable "rds_sg_name" {
  type = string
  #description = "(optional) describe your variable"
}

variable "vpc_id" {
  type = string
  #description = "(optional) describe your variable"
}

variable "rds_sg_description" {
  type = string
  #description = "(optional) describe your variable"
}

variable "rds_sg_ingress_from_port" {
  type = string
  #description = "(optional) describe your variable"
}
variable "rds_sg_ingress_to_port" {
  type = string
  #description = "(optional) describe your variable"
}
variable "rds_sg_ingress_protocol" {
  type = string
  #description = "(optional) describe your variable"
}