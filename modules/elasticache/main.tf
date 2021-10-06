# Security group resources
resource "aws_security_group" "security-group" {
  #count                  = var.create_redis_sg ? 1 : 0
  vpc_id = var.redis_vpc
  name   = var.redis_sg_name
  ingress {
    from_port = 6379
    to_port   = 6379
    protocol  = "tcp"

    cidr_blocks = var.redis_ingress_cidr_blocks
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = var.redis_sg_tag_name
    Environment = var.environment
  }
}

# elasticache subnet group
resource "aws_elasticache_subnet_group" "subnet-group" {
  name       = var.redis_subnet_group_name
  subnet_ids = var.redis_subnet_ids
}

#notification topic

resource "aws_sns_topic" "topic" {
  count = var.create_redis_notification_topic ? 1 : 0
  name  = var.redis_notification_topic_name
}

locals {
  created_sns_topic_arn = join(" ", [for topic in aws_sns_topic.topic : topic.arn])
}

/* resource "null_resource" "notification_topic_arn" {
  count  = var.create_redis_notification_topic ? 1 : 0
} */


# Redis cluster
resource "aws_elasticache_replication_group" "replication-group" {
  #count                  = var.create_redis_notification_topic ? 1 : 0
  #count                  = length(aws_sns_topic.topic)
  replication_group_id          = var.redis_replication_group_id
  replication_group_description = var.redis_replication_group_description
  automatic_failover_enabled    = true
  multi_az_enabled              = var.redis_multi_az_enabled
  number_cache_clusters         = var.redis_number_cache_clusters
  node_type                     = var.redis_node_type
  engine_version                = var.redis_engine_version
  parameter_group_name          = var.redis_parameter_group_name
  subnet_group_name             = aws_elasticache_subnet_group.subnet-group.id
  security_group_ids            = [aws_security_group.security-group.id]
  maintenance_window            = "tue:03:30-tue:04:30"
  port                          = "6379"
  at_rest_encryption_enabled    = true
  #notification_topic_arn        =  var.create_redis_notification_topic ? aws_sns_topic.topic[*].arn : var.redis_notification_topic_arn
  #notification_topic_arn        =  var.create_redis_notification_topic ? aws_sns_topic.topic[count.index].arn : var.redis_notification_topic_arn
  notification_topic_arn = var.create_redis_notification_topic ? local.created_sns_topic_arn : var.redis_notification_topic_arn
  tags = {

    Name        = var.redis_cluster_name
    Environment = var.environment
  }
}


# CloudWatch resources
# resource "aws_cloudwatch_metric_alarm" "cache_cpu" {
#   count               = var.redis_desired_clusters
#   alarm_name          = var.redis_cpu_alarm_name
#   alarm_description   = var.redis_cpu_alarm_description
#   comparison_operator = "GreaterThanThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/ElastiCache"
#   period              = "300"
#   statistic           = "Average"
#   threshold           = var.redis_alarm_cpu_threshold
#   dimensions = {
#     CacheClusterId = "${aws_elasticache_replication_group.replication-group.id}-00${count.index + 1}"
#   }


# }

# resource "aws_cloudwatch_metric_alarm" "cache_memory" {
#   count               = var.redis_desired_clusters
#   alarm_name          = var.redis_memory_alarm_name
#   alarm_description   = var.redis_memory_alarm_description
#   comparison_operator = "LessThanThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "FreeableMemory"
#   namespace           = "AWS/ElastiCache"
#   period              = "60"
#   statistic           = "Average"
#   threshold           = var.redis_alarm_memory_threshold
#   dimensions = {
#     CacheClusterId = "${aws_elasticache_replication_group.replication-group.id}-00${count.index + 1}"
#   }


# }
