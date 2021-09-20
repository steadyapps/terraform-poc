
# ###DATA###

data "aws_db_snapshot" "latest_snapshot" {
  count                  = var.restore_from_snapshot ? 1 : 0
  db_instance_identifier = var.snapshot_name
  most_recent            = true
}



# ###KMS-KEY############################

# resource "aws_kms_key" "key" {
#    description             = "KMS key for new rds"
#    deletion_window_in_days = 7
# }

# ####PASSWORD###############

resource "random_password" "password" {
  count            = var.restore_from_snapshot ? 0 : 1
  length           = 16
  special          = true
  number           = true
  lower            = true
  upper            = true
  override_special = "{}_!&?*"
}

resource "aws_secretsmanager_secret" "secret" {
  count                   = var.restore_from_snapshot ? 0 : 1
  name                    = "${var.cluster_name}-${var.environment}-credentials-secret"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "example" {
  count         = var.restore_from_snapshot ? 0 : 1
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = random_password.password.result
}





# ####################SECURITY-GROUP#################################

resource "aws_security_group" "rds" {
  name   = var.rds_sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port = var.rds_sg_ingress_from_port
    to_port   = var.rds_sg_ingress_to_port
    protocol  = var.rds_sg_ingress_protocol
    #security_groups = ["${data.terraform_remote_state.bastion.outputs.bastion_host_security_group}"]
    description = var.rds_sg_description

  }
}

# ##############SUBNET-GROUP##############################

resource "aws_db_subnet_group" "default" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = "RDS ${var.cluster_name}-${var.environment} subnet group"
  }
}

# ##########################RDS##################


resource "aws_rds_cluster" "cluster_from_scratch" {
  count              = var.restore_from_snapshot ? 0 : 1
  cluster_identifier = "${var.cluster_name}-${var.environment}"
  #engine                  = "aurora-mysql"
  engine         = var.engine
  engine_version = var.engine_version
  #availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name                   = var.database_name
  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name
  db_subnet_group_name            = var.db_subnet_group_name
  master_username                 = var.master_username
  master_password                 = random_password.password.result
  backup_retention_period         = var.backup_retention_period
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  vpc_security_group_ids          = var.vpc_security_group_ids
}


resource "aws_rds_cluster_instance" "cluster_instances_from_scratch" {
  count = var.restore_from_snapshot ? 0 : 1
  #count              = 2
  identifier                   = var.rds_instance_name
  cluster_identifier           = aws_rds_cluster.cluster_from_scratch.id
  instance_class               = var.db_instance_class
  engine                       = aws_rds_cluster.cluster_from_scratch.engine
  engine_version               = aws_rds_cluster.cluster_from_scratch.engine_version
  db_subnet_group_name         = var.db_subnet_group_name
  performance_insights_enabled = var.performance_insights_enabled
  copy_tags_to_snapshot        = var.copy_tags_to_snapshot

}


resource "aws_rds_cluster" "cluster_from_snapshot" {
  count               = var.restore_from_snapshot ? 1 : 0
  snapshot_identifier = data.aws_db_snapshot.latest_snapshot.id
  cluster_identifier  = "${var.cluster_name}-${var.environment}"
  #engine                  = "aurora-mysql"
  engine         = var.engine
  engine_version = var.engine_version
  #availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name                   = var.database_name
  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name
  db_subnet_group_name            = var.db_subnet_group_name
  #master_username         = var.master_username
  #master_password         = random_password.password.result
  backup_retention_period         = var.backup_retention_period
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  vpc_security_group_ids          = var.vpc_security_group_ids
}


resource "aws_rds_cluster_instance" "cluster_instances_from_snapshot" {
  count = var.restore_from_snapshot ? 1 : 0
  #count              = 2
  identifier                   = var.rds_instance_name
  cluster_identifier           = aws_rds_cluster.cluster_from_snapshot.id
  instance_class               = var.db_instance_class
  engine                       = aws_rds_cluster.cluster_from_snapshot.engine
  engine_version               = aws_rds_cluster.cluster_from_snapshot.engine_version
  db_subnet_group_name         = var.db_subnet_group_name
  performance_insights_enabled = var.performance_insights_enabled
  copy_tags_to_snapshot        = var.copy_tags_to_snapshot

}




# l