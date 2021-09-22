environment = "dev"
vpc_id      = "vpc-0a655d3511e10849d"
domain      = "steadyappdev.com"

msk_configurations = {
  msk_config = {
    name                   = "mskconfig"
    kafka_versions         = []
    server_properties_file = "mskconfig.cfg"
  }
  msk_config_dev = {
    name                   = "msk-config-dev"
    kafka_versions         = []
    server_properties_file = "msk-config-dev.cfg"
  }
}

msk_clusters = {
  main = {
    cluster_name           = "kafka-cluster"
    kafka_version          = "2.8.0"
    configuration_name     = "mskconfig"
    configuration_revision = "latest"
    number_of_broker_nodes = 3
    ebs_volume_size        = 200
    instance_type          = "kafka.m5.large"
    create_cname           = true
    cname_prefix           = "kafka"
    subnets = {
      az1 = {
        availability_zone = "use1-az6"
        cidr              = "10.18.160.0/19"
      },
      az2 = {
        availability_zone = "use1-az1"
        cidr              = "10.18.128.0/19"
      },
      az3 = {
        availability_zone = "use1-az2"
        cidr              = "10.18.96.0/19"
      }
    }
  }
}