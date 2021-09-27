data "aws_msk_configuration" "config" {
  name = var.configuration_name
}

resource "aws_kms_key" "kms" {
  description = "msk kms key for cluster ${local.cluster_name}"
  tags = {
    Name        = "msk-key-${local.cluster_name}"
    Environment = var.environment
  }
}

resource "aws_msk_cluster" "kafka" {
  cluster_name           = local.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes
  enhanced_monitoring    = "PER_TOPIC_PER_BROKER"

  broker_node_group_info {
    instance_type   = var.instance_type
    client_subnets  = var.subnets
    security_groups = var.security_groups
    ebs_volume_size = var.ebs_volume_size
  }

  configuration_info {
    arn      = data.aws_msk_configuration.config.arn
    revision = var.configuration_revision == "latest" ? data.aws_msk_configuration.config.latest_revision : tonumber(var.configuration_revision)
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.kms.arn

    encryption_in_transit {
      client_broker = "TLS_PLAINTEXT" # or TLS or PLAINTEXT
    }
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = true
      }
      node_exporter {
        enabled_in_broker = true
      }
    }
  }

  tags = {
    Name        = local.cluster_name
    Environment = var.environment
  }
}