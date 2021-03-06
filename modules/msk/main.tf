data "aws_msk_configuration" "config" {
  name = var.configuration_name
}

resource "aws_kms_key" "kms" {
  description = "msk kms key for ${var.environment}"
}

resource "aws_kms_alias" "a" {
  name          = "alias/msk-key-${var.environment}"
  target_key_id = aws_kms_key.kms.key_id
}

resource "aws_msk_cluster" "kafka" {
  cluster_name           = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = 3

  broker_node_group_info {
    instance_type = var.instance_type
    client_subnets = [
      aws_subnet.subnet_az1.id,
      aws_subnet.subnet_az2.id,
      aws_subnet.subnet_az3.id,
    ]
    security_groups = [aws_security_group.sg.id]
    ebs_volume_size = 100
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
  tags = {
    Name        = local.cluster_name
    Environment = var.environment
  }
}