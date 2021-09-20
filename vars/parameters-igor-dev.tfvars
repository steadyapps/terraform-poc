environment = "devops-igor"
vpc_id      = "vpc-0a655d3511e10849d"
domain      = "steadyappdev.com"

msk = {
  main = {
    cluster_name           = "kafka-cluster"
    kafka_version          = "2.8.0"
    number_of_broker_nodes = 3
    ebs_volume_size        = 100
    instance_type          = "kafka.m5.large"
    net_offset             = 30
    create_cname           = true
    cname_prefix           = "kafka"

  },
  mirror = {
    cluster_name           = "kafka-cluster-mirror"
    kafka_version          = "2.8.0"
    number_of_broker_nodes = 3
    ebs_volume_size        = 100
    instance_type          = "kafka.m5.large"
    net_offset             = 35
    create_cname           = true
    cname_prefix           = "kafka-mirror"
  }
}