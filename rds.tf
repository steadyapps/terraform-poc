# data "aws_db_snapshot" "latest_snapshot" {
#   #count = var.restore_from_snapshot ? 1 : 0  
#    db_instance_identifier = var.snapshot_instance_identifier
#    most_recent            = true
# }


module "rds" {
  #   source  = "terraform-aws-modules/rds-aurora/aws"
  #   version = "~> 3.0"
  source = "./modules/terraform-aws-rds-aurora"

  for_each            = var.rds
  environment         = var.environment
  domain              = var.domain
  snapshot_identifier = each.value.snapshot_identifier
  create_cname        = each.value.create_cname
  name                = each.value.name
  engine              = each.value.engine
  engine_version      = each.value.engine_version
  instance_type       = each.value.instance_type
  # storage_encrypted = each.value.storage_encrypted
  vpc_id  = each.value.vpc_id
  subnets = each.value.subnets

  replica_count = each.value.replica_count
  #   allowed_security_groups = each.value.allowed_security_groups
  #   allowed_cidr_blocks     = each.value.allowed_cidr_blocks
  create_security_group = each.value.create_security_group
  database_name         = each.value.database_name

  vpc_security_group_ids = each.value.vpc_security_group_ids
  storage_encrypted      = true
  apply_immediately      = true
  monitoring_interval    = each.value.monitoring_interval

  db_parameter_group_name         = each.value.db_parameter_group_name
  db_cluster_parameter_group_name = each.value.db_cluster_parameter_group_name

  enabled_cloudwatch_logs_exports = each.value.enabled_cloudwatch_logs_exports
  performance_insights_enabled    = each.value.performance_insights_enabled
  backup_retention_period         = each.value.backup_retention_period
  copy_tags_to_snapshot           = each.value.copy_tags_to_snapshot
  create_random_password          = each.value.create_random_password
  username                        = each.value.username
  password                        = each.value.password
  instances_parameters            = each.value.instances_parameters
  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}



# module "cloudwatch" {
#   source = "./modules/cloudwatch-alarms"  
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
#   alarm_actions       = [aws_sns_topic.test_alerts_topic.arn]
#   ok_actions          = [aws_sns_topic.test_alerts_topic.arn]
#   #alarm_actions       = each.value.alarm_actions
#   #ok_actions          = each.value.ok_actions
#   treat_missing_data = each.value.treat_missing_data
#   dimensions = each.value.dimensions
#   iam_role_name = each.value.iam_role_name
#   iam_policy_name = each.value.iam_policy_name
#   iam_policy_description = each.value.iam_policy_description
# }  