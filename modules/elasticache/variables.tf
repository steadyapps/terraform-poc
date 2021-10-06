variable "environment" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "redis_vpc" {
  type = string
}

variable "redis_ingress_cidr_blocks" {
  type = list(any)
}

variable "redis_sg_name" {
  type = string
}

variable "redis_sg_tag_name" {
  type = string
}


variable "redis_subnet_group_name" {
  type = string
}


variable "redis_subnet_ids" {
  type = list(any)
}


variable "redis_cluster_name" {
  type = string
}

variable "redis_replication_group_id" {
  type = string
}

variable "redis_replication_group_description" {
  type = string
}

variable "redis_number_cache_clusters" {
  type = number
}

variable "redis_node_type" {
  type = string
}

variable "redis_engine_version" {
  type = string
}

variable "redis_parameter_group_name" {
  type = string
}

variable "redis_notification_topic_name" {
  type = string
}

variable "create_redis_notification_topic" {
  type = bool
}

variable "redis_multi_az_enabled" {
  type = bool
}

variable "redis_notification_topic_arn" {
  type = string
}

# variable "redis_desired_clusters" {
#   type = string
# }
# variable "redis_alarm_cpu_threshold" {
#   type = string
# }

# variable "redis_alarm_memory_threshold" {
#   type = string
# }

# variable "redis_cpu_alarm_name" {
#   type = string
# }

# variable "redis_cpu_alarm_description" {
#   type = string
# }

# variable "redis_memory_alarm_name" {
#   type = string
# }

# variable "redis_memory_alarm_description" {
#   type = string
# }
