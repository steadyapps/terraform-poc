# output "alarms" {
#     value = [for a in aws_cloudwatch_metric_alarm.alarms: a.arn]
# }

output "alarm" {
    value = aws_cloudwatch_metric_alarm.alarms.arn
}