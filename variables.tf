# variable "msk_kafka_version" {
#   type    = string
#   default = "2.7.0"
# }

# variable "msk_cluster_name" {
#   type = string
# }

# variable "msk_instance_type" {
#   type = string
# }

# variable "msk_ebs_volume_size" {
#   type = number
# }

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type = string
}

# variable "msk_vpc_id" {
#   type = string
# }

# variable "msk_zookeeper_client_port" {
#   type    = number
#   default = 2181
# }

# variable "msk_kafka_internal_port" {
#   type    = number
#   default = 9092
# }

# variable "msk_kafka_outside_port" {
#   type    = number
#   default = 9094
# }

# variable "msk_steady_VPC_CIDR" {
#   type    = string
#   default = "172.29.0.0/16"
# }

# variable "msk_EKS_VPC_CIDR" {
#   type = string
# }

# variable "msk_net_offset" {
#   type = number
# }

# variable "sns_topic_name" {
#   type = string
# }



# variable "org_name" {
#   description = "Name for this organization"
# }
# variable "workspace_name" {
#   description = "Description for the chat integration"
# }
# variable "enabled" {
#   description = "If true, will create aws chatboot and integrate to slack"
#   default     = "false"
# }
# variable "slack_channel_id" {
#   description = "Slack channel id to send budget notfication using AWS Chatbot"
#   default     = ""
# }
# variable "slack_workspace_id" {
#   description = "Slack workspace id to send budget notfication using AWS Chatbot"
#   default     = ""
# }

# variable "slack_ids" {
#   description = "Use to define additional slack channels. Format: [ { channel = xxx, workspace=xxx }"
#   default     = {}
#   type        = any
# }

# variable "alarm_sns_topic_arns" {
#   description = "ARN of SNS Topic(s) to connect to AWS Chatbot"
#   # list of string (accept string for backwards compatibility)
#   type = any
# }


# variable "tags" {
#   description = "Specifies object tags key and value. This applies to all resources created by this module."
#   type        = map(string)
#   default = {
#     "Terraform" = true
#   }
# }

# variable "logging_level" {
#   description = "Specifies the logging level for this configuration. This property affects the log entries pushed to Amazon CloudWatch Logs. Logging levels include ERROR, INFO, or NONE."
#   default     = "ERROR"
# }


# #CLOUDWATCH

# variable "alarms" {
#   type = map (object({
#     alarm_name          = string
#     comparison_operator = string
#     evaluation_periods  = string
#     metric_name         = string
#     namespace           = string
#     period              = string
#     statistic           = string
#     threshold           = string
#     alarm_description   = string
#     actions_enabled     = string
#     #alarm_actions       = any
#     #ok_actions          = any
#     treat_missing_data = string
#     dimensions = any
#     iam_role_name = string
#     iam_policy_name = string
#     iam_policy_description = string

#   }))
# }



# variable "restore_from_snapshot" {
#   type = bool
# }

# variable "snapshot_instance_identifier" {
#   type = string
# }

variable "rds_clusters" {
  type = map(object({
    name                = string
    snapshot_identifier = string
    create_cname        = bool
    custom_cname        = bool
    cname_reader        = string
    cname_writer        = string
    db_subnet_group_name = string
    engine              = string
    engine_version      = string
    instance_type       = string
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
    monitoring_role_arn = string
    create_monitoring_role = bool
    db_parameter_group_name         = string
    db_cluster_parameter_group_name = string
    enabled_cloudwatch_logs_exports = list(string)
    performance_insights_enabled    = bool
    backup_retention_period         = number
    preferred_backup_window = string
    preferred_maintenance_window = string
    skip_final_snapshot = bool
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
