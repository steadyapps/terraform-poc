#MSK

# domain      = "steadyappdev.com"
environment = "prod"
region      = "us-east-1"
# cluster_name = "kafka-cluster-dev-mirror"

# kafka_version   = "2.2.1"
# instance_type   = "kafka.m5.large"
# ebs_volume_size = 100

# vpc_id       = "vpc-0a655d3511e10849d"
# EKS_VPC_CIDR = "10.17.0.0/16"

# net_offset = 20


#Chatbot

sns_topic_name = "cloudwatch-kafka-alerts"
org_name = "Steady"
workspace_name = "KafkaConsumerLags"
enabled = true
#logging_level =
slack_channel_id = "C01F9GW420L"
#slack_ids = 
slack_workspace_id = "T5V4PF198"