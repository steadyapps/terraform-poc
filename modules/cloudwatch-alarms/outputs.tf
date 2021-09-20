# output "alarms" {
#     value = [for a in aws_cloudwatch_metric_alarm.alarms: a.arn]
# }

output "alarm" {
  value = aws_cloudwatch_metric_alarm.alarms.arn
}

output "role_arn" {
  value = aws_iam_role.role.arn
}
output "role_name" {
  value = aws_iam_role.role.name
}