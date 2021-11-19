module "elasticache" {
  source                    = "./modules/elasticache"
  for_each                  = var.elasticache_clusters
  environment               = var.environment
  redis_vpc                 = each.value.redis_vpc
  redis_ingress_cidr_blocks = each.value.redis_ingress_cidr_blocks
  redis_sg_name             = each.value.redis_sg_name
  redis_sg_tag_name         = "${each.key}-sg"
  redis_subnet_group_name   = each.value.redis_subnet_group_name #recreates cluster if changed
  #environment = string
  redis_subnet_ids   = each.value.redis_subnet_ids
  redis_cluster_name = each.value.redis_cluster_name
  #redis_cluster_name = each.key
  redis_replication_group_id = each.value.redis_replication_group_id #recreates cluster if changed
  #redis_replication_group_id = each.key
  redis_replication_group_description = each.value.redis_replication_group_description
  redis_number_cache_clusters         = each.value.redis_number_cache_clusters
  redis_node_type                     = each.value.redis_node_type
  redis_engine_version                = each.value.redis_engine_version
  redis_parameter_group_name          = each.value.redis_parameter_group_name
  redis_multi_az_enabled              = each.value.redis_multi_az_enabled
  create_redis_notification_topic     = each.value.create_redis_notification_topic
  create_redis_subnet_group     = each.value.create_redis_subnet_group
  redis_notification_topic_name       = each.value.redis_notification_topic_name
  redis_notification_topic_arn        = each.value.redis_notification_topic_arn

}

/* data "aws_elasticache_cluster" "cluster" {
    for_each            = var.elasticache_clusters
    cluster_id = each.value.redis_replication_group_id
}

module "elasticache_cloudwatch" {
  source              = "./modules/cloudwatch-alarms"
  for_each            = var.elasticache_cloudwatch_alarms
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
  alarm_actions       = data.aws_elasticache_cluster.cluster.notification_topic_arn
  ok_actions          = data.aws_elasticache_cluster.cluster.notification_topic_arn
  #alarm_actions       = each.value.alarm_actions
  #ok_actions          = each.value.ok_actions
  treat_missing_data     = each.value.treat_missing_data
  dimensions             = each.value.dimensions
 
} */







output "elasticache_clusters" {
  value = tomap({
    for k, v in module.elasticache :
    k => v
  })
}

