
# resource "aws_sns_topic" "test_alerts_topic" {
#   name = var.sns_topic_name
# }


# data "aws_sns_topic" "sns" {
#   name = var.sns_topic_name
# }




# resource "aws_cloudwatch_metric_alarm" "alarms" {
#   for_each = var.alarms  
#   alarm_name          = each.value.alarm_name
#   comparison_operator = each.value.comparison_operator
#   evaluation_periods  = each.value.evaluation_periods
#   metric_name         = each.value.metric_name
#   namespace           = each.value.namespace
#   period              = each.value.period
#   statistic           = each.value.statistic
#   threshold           = each.value.threshold
#   alarm_description   = each.value.alarm_description
#   actions_enabled     = each.value.actions_enabled
#   alarm_actions       = [data.aws_sns_topic.sns.arn]
#   ok_actions          = [data.aws_sns_topic.sns.arn]
#   #alarm_actions       = each.value.alarm_actions
#   #ok_actions          = each.value.ok_actions
#   treat_missing_data = each.value.treat_missing_data
#   dimensions = each.value.dimensions
# }  

resource "aws_cloudwatch_metric_alarm" "alarms" {
  #for_each = var.alarms  
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  alarm_description   = var.alarm_description
  actions_enabled     = var.actions_enabled
  alarm_actions       = var.alarm_actions
  ok_actions          = var.ok_actions
  #alarm_actions       = var.alarm_actions
  #ok_actions          = var.ok_actions
  treat_missing_data  = var.treat_missing_data
  dimensions          = var.dimensions
  datapoints_to_alarm = 1
}


resource "aws_iam_role" "role" {
  name = var.iam_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "policy" {
  name        = var.iam_policy_name
  description = var.iam_policy_description

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}