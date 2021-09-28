# data "aws_db_snapshot" "latest_snapshot" {
#   #count = var.restore_from_snapshot ? 1 : 0  
#    db_instance_identifier = var.snapshot_instance_identifier
#    most_recent            = true
# }


module "rds" {
  #   source  = "terraform-aws-modules/rds-aurora/aws"
  #   version = "~> 3.0"
  source = "./modules/terraform-aws-rds-aurora"

  for_each            = var.rds_clusters
  environment         = var.environment
  domain              = var.domain
  snapshot_identifier = each.value.snapshot_identifier
  create_cname        = each.value.create_cname
  custom_cname        = each.value.custom_cname
  cname_reader        = each.value.cname_reader
  cname_writer        = each.value.cname_writer
  db_subnet_group_name = each.value.db_subnet_group_name
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
  create_monitoring_role    = each.value.create_monitoring_role
  monitoring_role_arn    = each.value.monitoring_role_arn

  db_parameter_group_name         = each.value.db_parameter_group_name
  db_cluster_parameter_group_name = each.value.db_cluster_parameter_group_name

  enabled_cloudwatch_logs_exports = each.value.enabled_cloudwatch_logs_exports
  performance_insights_enabled    = each.value.performance_insights_enabled
  backup_retention_period         = each.value.backup_retention_period
  preferred_backup_window = each.value.preferred_backup_window
  preferred_maintenance_window = each.value.preferred_maintenance_window
  skip_final_snapshot = each.value.skip_final_snapshot
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






output "rds_clusters" {
  value = tomap({
    for k, v in module.rds : k => v.rds_cluster_arn
  })
}

output "rds_cluster_instance_ids" {
  value = tomap({
    for k, v in module.rds : k => v.rds_cluster_instance_ids
  })
}

output "rds_cname_reader" {
  value = tomap({
    for k, v in module.rds : k => v.cname_reader
  })
}

output "rds_cname_writer" {
  value = tomap({
    for k, v in module.rds : k => v.cname_writer
  })
}