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

sns_topic_name = "terraform-poc"
org_name = "Steady"
workspace_name = "KafkaConsumerLags"
enabled = true
#logging_level =
slack_channel_id = "C01F9GW420L"
#slack_ids = 
slack_workspace_id = "T5V4PF198"

#CLOUDWATCH

alarms = {
    alarm1 = {
        alarm_name          = "Terraform-POC-Alarm1"
        comparison_operator = "GreaterThanThreshold"
        evaluation_periods  = "1"
        metric_name         = "SumOffsetLag"
        namespace           = "AWS/Kafka"
        period              = "60"
        statistic           = "Sum"
        threshold           = "50000"
        alarm_description   = "test"
        actions_enabled     = "true"
        treat_missing_data = "ignore"
        dimensions = {
            "Consumer Group" = "Steady.Plaid.Transaction.Importer"
            "Cluster Name" = "prod-kafka-cluster"
            "Topic" = "Steady.Plaid.Webhook"
        }
    },
    alarm2 = {
        alarm_name          = "Terraform-POC-Import-Alarm"
        comparison_operator = "GreaterThanThreshold"
        evaluation_periods  = "1"
        metric_name         = "SumOffsetLag"
        namespace           = "AWS/Kafka"
        period              = "60"
        statistic           = "Sum"
        threshold           = "666"
        alarm_description   = "test"
        actions_enabled     = "true"
        treat_missing_data = "ignore"
        dimensions = {
            "Consumer Group" = "Steady.Payments.Response.Consumer"
            "Cluster Name" = "prod-kafka-cluster"
            "Topic" = "Steady.Payments.WebhookReceived"
        }
    },
}