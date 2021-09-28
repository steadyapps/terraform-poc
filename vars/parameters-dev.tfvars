
environment = "dev"
region      = "us-east-1"


rds_clusters = {
 steady_opportunities_dev = {
    snapshot_identifier = null
    create_cname        = false
    custom_cname        = false
    cname_reader = "custom-rds-reader"
    cname_writer = "custom-rds-writer"
    db_subnet_group_name = "main"
    name                = "steady-opportunities-dev"
    engine              = "aurora-mysql"
    engine_version      = "5.7.mysql_aurora.2.07.2"
    instance_type       = "db.t3.medium"
    # storage_encrypted = true
    vpc_id                 = "vpc-085a636410c11ee6b"
    subnets                = ["subnet-0892788a06eaafa43", "subnet-05ce5547fbc4f81dc"]
    replica_count          = 1
    create_security_group  = false
    database_name          = ""
    vpc_security_group_ids = ["sg-0caca911b51f2458b", "sg-0940aea55b49b4698"]
    #alarm_actions       = any
    #ok_actions          = any
    monitoring_interval             = 60
    monitoring_role_arn = "arn:aws:iam::133638536280:role/rds-monitoring-role"
    create_monitoring_role = false
    db_parameter_group_name         = "default.aurora-mysql5.7"
    db_cluster_parameter_group_name = "default.aurora-mysql5.7"
    enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
    performance_insights_enabled    = false
    backup_retention_period         = 30
    preferred_backup_window = "05:00-05:30"
    preferred_maintenance_window = "wed:09:58-wed:10:28"
    skip_final_snapshot = true
    copy_tags_to_snapshot           = true
    create_random_password          = false
    username                        = "steady"
    password                        = ""
    instances_parameters = [
      {
        instance_name = "steady-opportunities-dev-writer"
      },
    ]
  },

  # cluster2 = {
  #   name                = "rds-test-from-snapshot"
  #   snapshot_identifier = "arn:aws:rds:us-east-1:133638536280:cluster-snapshot:rds:steady-opportunities-staging-2021-09-17-04-29"
  #   create_cname        = false
  #   engine              = "aurora-mysql"
  #   engine_version      = "5.7.mysql_aurora.2.07.2"
  #   instance_type       = "db.t3.small"
  #   # storage_encrypted = true
  #   vpc_id                 = "vpc-085a636410c11ee6b"
  #   subnets                = ["subnet-0892788a06eaafa43", "subnet-05ce5547fbc4f81dc"]
  #   replica_count          = 1
  #   create_security_group  = false
  #   database_name          = ""
  #   vpc_security_group_ids = ["sg-0caca911b51f2458b", "sg-0940aea55b49b4698"]
  #   #alarm_actions       = any
  #   #ok_actions          = any
  #   monitoring_interval             = 0
  #   db_parameter_group_name         = "default.aurora-mysql5.7"
  #   db_cluster_parameter_group_name = "default.aurora-mysql5.7"
  #   enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  #   performance_insights_enabled    = false
  #   backup_retention_period         = 1
  #   copy_tags_to_snapshot           = true
  #   create_random_password          = false
  #   username                        = null
  #   password                        = null
  #   instances_parameters = [
  #     {
  #       instance_name = "custom-1",
  #     },
  #   ]
  # },
}