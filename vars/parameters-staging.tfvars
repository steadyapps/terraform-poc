environment = "staging"
region      = "us-east-1"


rds_clusters = {
  steady_opportunities_dev = {
    snapshot_identifier  = null
    create_cname         = false
    custom_cname         = false
    cname_reader         = "custom-rds-reader"
    cname_writer         = "custom-rds-writer"
    db_subnet_group_name = "main"
    name                 = "steady-opportunities-dev"
    engine               = "aurora-mysql"
    engine_version       = "5.7.mysql_aurora.2.07.2"
    instance_type        = "db.t3.medium"
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
    monitoring_role_arn             = "arn:aws:iam::133638536280:role/rds-monitoring-role"
    create_monitoring_role          = false
    db_parameter_group_name         = "default.aurora-mysql5.7"
    db_cluster_parameter_group_name = "default.aurora-mysql5.7"
    enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
    performance_insights_enabled    = false
    backup_retention_period         = 30
    preferred_backup_window         = "05:00-05:30"
    preferred_maintenance_window    = "wed:09:58-wed:10:28"
    skip_final_snapshot             = true
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
vpc_id = "vpc-0a655d3511e10849d"
domain = "steadyappdev.com"

msk_configurations = {
  msk_config = {
    name                   = "mskconfig"
    kafka_versions         = ["2.2.1"]
    server_properties_file = "mskconfig.cfg"
  }
  msk_config_dev = {
    name                   = "msk-config-dev"
    kafka_versions         = ["2.2.1"]
    server_properties_file = "msk-config-dev.cfg"
  }
}

msk_old_clusters = {
  main = {
    cluster_name           = "kafka-cluster"
    kafka_version          = "2.8.0"
    configuration_name     = "mskconfig"
    configuration_revision = 1
    number_of_broker_nodes = 3
    ebs_volume_size        = 200
    instance_type          = "kafka.m5.large"
    create_cname           = false
    cname_prefix           = "kafka"
    subnets                = ["subnet-01312c5632983f1e0", "subnet-0ca0e3548af75a253", "subnet-0753033c61743149d"]
    security_groups        = ["sg-0e93fca7f916b7263"]
  }
}

msk_clusters = {
  mirror = {
    cluster_name           = "kafka-cluster-mirror"
    kafka_version          = "2.8"
    configuration_name     = "mskconfig"
    configuration_revision = "latest"
    number_of_broker_nodes = 3
    ebs_volume_size        = 200
    instance_type          = "kafka.m5.large"
    net_offset             = 120
    net_offset             = 35
    create_cname           = true
    cname_prefix           = "kafka-mirror"
  }
}

elasticache_clusters = {

  redis-newstaging = {

    redis_vpc                 = "vpc-0f395c18a1fb58eef"
    redis_ingress_cidr_blocks = ["172.42.0.0/16", "10.17.0.0/16"]
    # create_redis_security_group = false
    create_redis_subnet_group = true
    #redis_sg_name             = "terraform-20210427091825288600000001"
    redis_sg_name             = "terraform-redis-newstaging"
    redis_subnet_group_name   = "staging-cache-subnet"
    redis_subnet_ids = [
      "subnet-0d51b68616ece619d",
      "subnet-04786b40b4a210c72",
      "subnet-0aa4da9b6ae57f16a",
      "subnet-0fd1c4d295f041dd2",
      "subnet-09c0f4eecbbae52de",
      "subnet-06a84f34b3a25c8fe"
    ]
    redis_cluster_name                  = "redisClusterNewStaging"
    redis_replication_group_id          = "redis-newstaging"
    redis_replication_group_description = "Redis NewStaging Cluster"
    redis_number_cache_clusters         = 3
    redis_node_type                     = "cache.t2.medium"
    redis_engine_version                = "5.0.5"
    redis_parameter_group_name          = "default.redis5.0.cluster.on"
    redis_multi_az_enabled              = false
    create_redis_notification_topic     = false
    redis_notification_topic_name       = ""
    #redis_notification_topic_name = "steady-data-redis-test-tf-topic"
    redis_notification_topic_arn = "arn:aws:sns:us-east-1:133638536280:steady-newstaging-topic"

  },

  
  # redis-hangfire-staging = {

  #   redis_vpc                 = "vpc-0f395c18a1fb58eef"
  #   redis_ingress_cidr_blocks = ["172.42.0.0/16", "10.17.0.0/16"]
  #   # create_redis_security_group = true
  #   redis_sg_name             = "terraform-redis-hangfire-staging"
  #   create_redis_subnet_group = true
  #   redis_subnet_group_name   = "staging-redis-hangfire-subnet"
  #   redis_subnet_ids = [
  #     "subnet-0d51b68616ece619d",
  #     "subnet-04786b40b4a210c72",
  #     "subnet-0aa4da9b6ae57f16a",
  #     "subnet-0fd1c4d295f041dd2",
  #     "subnet-09c0f4eecbbae52de",
  #     "subnet-06a84f34b3a25c8fe"
  #   ]
  #   redis_cluster_name                  = "redisClusterHangfireStaging"
  #   redis_replication_group_id          = "redis-hangfire-staging"
  #   redis_replication_group_description = "Redis Hangfire-Staging Cluster"
  #   redis_number_cache_clusters         = 3
  #   redis_node_type                     = "cache.t2.medium"
  #   redis_engine_version                = "6.x"
  #   redis_parameter_group_name          = "default.redis6.x.cluster.on"
  #   redis_multi_az_enabled              = true
  #   create_redis_notification_topic     = true
  #   redis_notification_topic_name       = "steady-hangfire-staging-topic"
  #   #redis_notification_topic_name = "steady-data-redis-test-tf-topic"
  #   redis_notification_topic_arn = ""

  # },

}