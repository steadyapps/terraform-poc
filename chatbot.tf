resource "aws_sns_topic" "kafka_alerts_topic" {
  name = var.sns_topic_name
}



module "chatbot" {
  source = "./modules/terraform-aws-chatbot"
  #version = "2.0.0"
  # insert the 3 required variables here
  alarm_sns_topic_arns = aws_sns_topic.kafka_alerts_topic.arn
  org_name = var.org_name
  workspace_name = var.workspace_name
  enabled = var.enabled
  #logging_level =
  slack_channel_id = var.slack_channel_id
  #slack_ids = 
  slack_workspace_id = var.slack_workspace_id
  #tags =
}