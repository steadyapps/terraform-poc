data "aws_sns_topic" "sns" {
  name = var.sns_topic_name
}


resource "aws_cloudwatch_metric_alarm" "test-kafka" {
  alarm_name          = "test-kafka-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "SumOffsetLag"
  namespace           = "AWS/Kafka"
  period              = "60"
  statistic           = "Sum"
  threshold           = "50000"
  alarm_description   = "Plaid Importer Consumer Lag is outside the acceptable threshold"
  actions_enabled     = "true"
  alarm_actions       = [data.aws_sns_topic.sns.arn]
  ok_actions          = [data.aws_sns_topic.sns.arn]
  treat_missing_data = "ignore"
  dimensions = {
    "Consumer Group" = "Steady.Plaid.Transaction.Importer"
    "Cluster Name" = "prod-kafka-cluster"
    "Topic" = "Steady.Plaid.Webhook"
  }
}  