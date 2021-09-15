environment = "devops-igor"
vpc_id      = "vpc-0a655d3511e10849d"

msk = {
  main = {
    cluster_name    = "kafka-cluster"
    ebs_volume_size = 100
    instance_type   = "kafka.m5.large"
    net_offset      = 110
  },
  mirror = {
    cluster_name    = "kafka-cluster-mirror"
    ebs_volume_size = 100
    instance_type   = "kafka.m5.large"
    net_offset      = 120
  }
}