domain      = "steadyappdev.com"
environment = "dev"
region      = "us-east-1"
cluster_name = "kafka-cluster-dev-mirror"

kafka_version   = "2.2.1"
instance_type   = "kafka.m5.large"
ebs_volume_size = 100

vpc_id       = "vpc-0a655d3511e10849d"
EKS_VPC_CIDR = "10.17.0.0/16"

net_offset = 20
