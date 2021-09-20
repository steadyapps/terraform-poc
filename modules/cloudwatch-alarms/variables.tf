
# variable "sns_topic_name" {
#   type = string
# }

variable "alarm_name" {
  type = string
}

variable "comparison_operator" {
  type = string
}

variable "evaluation_periods" {
  type = string
}

variable "metric_name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "period" {
  type = string
}

variable "statistic" {
  type = string
}

variable "threshold" {
  type = string
}

variable "alarm_description" {
  type = string
}

variable "actions_enabled" {
  type = string
}

variable "treat_missing_data" {
  type = string
}

variable "dimensions" {
  type = map(string)
}

variable "alarm_actions" {
  type = list(string)

}

variable "ok_actions" {
  type = list(string)
}


#IAM

variable "iam_role_name" {
  type = string
}
variable "iam_policy_name" {
  type = string
}
variable "iam_policy_description" {
  type = string
}




# variable "alarms" {
#   type = map (object({
#               = string
#       = string
#              = string
#                = string
#                   = string
#                = string
#                = string
#        = string
#          = string
#     #alarm_actions       = any
#     #ok_actions          = any
#      = string
#      = any
#   }))
# }
