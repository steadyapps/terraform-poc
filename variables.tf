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
variable "msk_old_clusters" {
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
    subnets                = list(string)
    security_groups        = list(string)
  }))
  description = "MSK clusters"
}

variable "rds_clusters" {
  type = map(object({
    name                 = string
    snapshot_identifier  = string
    create_cname         = bool
    custom_cname         = bool
    cname_reader         = string
    cname_writer         = string
    db_subnet_group_name = string
    engine               = string
    engine_version       = string
    instance_type        = string
    # storage_encrypted = bool
    vpc_id                 = string
    subnets                = list(string)
    replica_count          = string
    create_security_group  = bool
    database_name          = string
    vpc_security_group_ids = list(string)
    #alarm_actions       = any
    #ok_actions          = any
    monitoring_interval             = number
    monitoring_role_arn             = string
    create_monitoring_role          = bool
    db_parameter_group_name         = string
    db_cluster_parameter_group_name = string
    enabled_cloudwatch_logs_exports = list(string)
    performance_insights_enabled    = bool
    backup_retention_period         = number
    preferred_backup_window         = string
    preferred_maintenance_window    = string
    skip_final_snapshot             = bool
    copy_tags_to_snapshot           = bool
    create_random_password          = bool
    username                        = string
    password                        = string
    instances_parameters            = list(map(string))
    # dimensions = any
    # iam_role_name = string
    # iam_policy_name = string
    # iam_policy_description = string

  }))
}

variable "domain" {
  type    = string
  default = null
}

/* variable "create_cname" {
  type = bool
  default = null
} */
variable "msk_clusters" {
  type = map(object({
    cluster_name           = string
    configuration_name     = string
    configuration_revision = any
    kafka_version          = string
    number_of_broker_nodes = number
    kafka_version          = string
    ebs_volume_size        = number
    instance_type          = string
    net_offset             = number
    create_cname           = bool
    cname_prefix           = string
  }))
  description = "MSK clusters"
}

# variable "redis_vpc" {
#   type=string
# }



variable "elasticache_clusters" {
  type = map(object({
    redis_vpc                           = string
    redis_ingress_cidr_blocks           = list(any)
    redis_sg_name                       = string
    redis_subnet_group_name             = string
    redis_subnet_ids                    = list(any)
    redis_cluster_name                  = string
    redis_replication_group_id          = string
    redis_replication_group_description = string
    redis_number_cache_clusters         = number
    redis_node_type                     = string
    redis_engine_version                = string
    redis_parameter_group_name          = string
    redis_multi_az_enabled              = bool
    redis_notification_topic_name       = string
    create_redis_notification_topic     = bool
    redis_notification_topic_arn        = string
    #redis_desired_clusters = string
    # redis_alarm_cpu_threshold = string
    # redis_alarm_memory_threshold = string
    # redis_cpu_alarm_name = string
    # redis_cpu_alarm_description = string
    # redis_memory_alarm_name = string
    # redis_memory_alarm_description = string
  }))
}

/* variable "elasticache_cloudwatch_alarms" {
  type = map(object({
    alarm_name          = string
    comparison_operator = string
    evaluation_periods  = string
    metric_name         = string
    namespace           = string
    period              = string
    statistic           = string
    threshold           = string
    alarm_description   = string
    actions_enabled     = bool
    alarm_actions       = string
    ok_actions          = string
    treat_missing_data  = string
    dimensions          = any
  }))
} */


variable "elasticsearch" {
  type = map(object({
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


  }))
}