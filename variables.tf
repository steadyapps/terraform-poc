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

variable "sns_topic_name" {
  type = string
}



variable "org_name" {
  description = "Name for this organization"
}
variable "workspace_name" {
  description = "Description for the chat integration"
}
variable "enabled" {
  description = "If true, will create aws chatboot and integrate to slack"
  default     = "false"
}
variable "slack_channel_id" {
  description = "Slack channel id to send budget notfication using AWS Chatbot"
  default     = ""
}
variable "slack_workspace_id" {
  description = "Slack workspace id to send budget notfication using AWS Chatbot"
  default     = ""
}

variable "slack_ids" {
  description = "Use to define additional slack channels. Format: [ { channel = xxx, workspace=xxx }"
  default     = {}
  type        = any
}

# variable "alarm_sns_topic_arns" {
#   description = "ARN of SNS Topic(s) to connect to AWS Chatbot"
#   # list of string (accept string for backwards compatibility)
#   type = any
# }


variable "tags" {
  description = "Specifies object tags key and value. This applies to all resources created by this module."
  type        = map(string)
  default = {
    "Terraform" = true
  }
}

variable "logging_level" {
  description = "Specifies the logging level for this configuration. This property affects the log entries pushed to Amazon CloudWatch Logs. Logging levels include ERROR, INFO, or NONE."
  default     = "ERROR"
}
