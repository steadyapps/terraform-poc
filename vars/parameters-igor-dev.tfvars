environment = "dev"
vpc_id      = "vpc-0a655d3511e10849d"
domain      = "steadyappdev.com"

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
    configuration_revision = "latest"
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
