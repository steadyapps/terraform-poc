resource "aws_sns_topic" "test_alerts_topic" {
  name = var.sns_topic_name
}



module "cloudwatch" {
  source              = "./modules/cloudwatch-alarms"
  for_each            = var.alarms
  alarm_name          = each.value.alarm_name
  comparison_operator = each.value.comparison_operator
  evaluation_periods  = each.value.evaluation_periods
  metric_name         = each.value.metric_name
  namespace           = each.value.namespace
  period              = each.value.period
  statistic           = each.value.statistic
  threshold           = each.value.threshold
  alarm_description   = each.value.alarm_description
  actions_enabled     = each.value.actions_enabled
  alarm_actions       = [aws_sns_topic.test_alerts_topic.arn]
  ok_actions          = [aws_sns_topic.test_alerts_topic.arn]
  #alarm_actions       = each.value.alarm_actions
  #ok_actions          = each.value.ok_actions
  treat_missing_data     = each.value.treat_missing_data
  dimensions             = each.value.dimensions
  iam_role_name          = each.value.iam_role_name
  iam_policy_name        = each.value.iam_policy_name
  iam_policy_description = each.value.iam_policy_description
}

