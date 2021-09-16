resource "aws_msk_configuration" "config" {
  kafka_versions    = [var.kafka_version]
  name              = "msk-config-${var.cluster_name}-${var.environment}"
  server_properties = var.server_properties
}

resource "aws_kms_key" "kms" {
  description = "msk kms key for cluster ${var.cluster_name}-${var.environment}"
  tags = {
    Name        = "msk-key-${var.cluster_name}-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_kms_alias" "a" {
  name          = "alias/msk-key-${var.cluster_name}-${var.environment}"
  target_key_id = aws_kms_key.kms.key_id
}

resource "aws_msk_cluster" "kafka" {
  depends_on             = [aws_msk_configuration.config]
  cluster_name           = "${var.cluster_name}-${var.environment}"
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes

  broker_node_group_info {
    instance_type = var.instance_type
    client_subnets = [
      aws_subnet.subnet_az1.id,
      aws_subnet.subnet_az2.id,
      aws_subnet.subnet_az3.id,
    ]
    security_groups = [aws_security_group.sg.id]
    ebs_volume_size = var.ebs_volume_size
  }

  configuration_info {
    arn      = aws_msk_configuration.config.arn
    revision = aws_msk_configuration.config.latest_revision
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.kms.arn

    encryption_in_transit {
      client_broker = "TLS_PLAINTEXT" # or TLS or PLAINTEXT
    }
  }
  tags = {
    Name        = "${var.cluster_name}-${var.environment}"
    Environment = var.environment
  }
}