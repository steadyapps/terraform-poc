# output "zookeeper_connect_string" {
#   description = "Plaintext zookeeper host:port pairs"
#   value = module.msk-main.zookeeper_connect_string
# }

# output "bootstrap_brokers" {
#   description = "Plaintext connection host:port pairs"
#   value       = module.msk-main.bootstrap_brokers
# }

# output "bootstrap_brokers_tls" {
#   description = "TLS connection host:port pairs"
#   value       = module.msk-main.bootstrap_brokers_tls
# }

output "alarm_sns_topic_arns" {
  description = "TLS connection host:port pairs"
  value       = aws_sns_topic.kafka_alerts_topic.arn
}

output "chatbot_slack_arns" {
  value       = module.chatbot.slack_arns
}

output "chatbot_role_arn" {
  value       = module.chatbot.role_arn
}

output "chatbot_role_name" {
  value       = module.chatbot.role_name
}


