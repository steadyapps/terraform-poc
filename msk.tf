module "msk_config" {
  source   = "./modules/msk_configuration"
  for_each = var.msk_configurations

  name              = each.value.name
  kafka_versions    = each.value.kafka_versions
  server_properties = file("${path.module}/files/msk/configuration/${each.value.server_properties_file}")
}

module "msk_old" {
  source   = "./modules/msk_old"
  for_each = var.msk_old_clusters

  environment = var.environment
  domain      = var.domain
  vpc_id      = var.vpc_id

  kafka_version          = each.value.kafka_version
  configuration_name     = each.value.configuration_name
  configuration_revision = each.value.configuration_revision
  cluster_name           = each.value.cluster_name
  ebs_volume_size        = each.value.ebs_volume_size
  instance_type          = each.value.instance_type
  create_cname           = each.value.create_cname
  cname_prefix           = each.value.cname_prefix
  subnets                = each.value.subnets
  security_groups        = each.value.security_groups
}

module "msk" {
  source   = "./modules/msk"
  for_each = var.msk_clusters

  environment     = var.environment
  domain          = var.domain
  vpc_id          = var.vpc_id
  EKS_VPC_CIDR    = var.EKS_VPC_CIDR
  steady_VPC_CIDR = var.steady_VPC_CIDR

  kafka_version          = each.value.kafka_version
  cluster_name           = each.value.cluster_name
  ebs_volume_size        = each.value.ebs_volume_size
  instance_type          = each.value.instance_type
  create_cname           = each.value.create_cname
  cname_prefix           = each.value.cname_prefix
  configuration_name     = each.value.configuration_name
  configuration_revision = each.value.configuration_revision
  net_offset             = each.value.net_offset
}

output "msk_old_zookeeper_connect_string" {
  value = tomap({
    for k, v in module.msk_old : k => v.zookeeper_connect_string
  })
}

output "msk_old_bootstrap_brokers" {
  value = tomap({
    for k, v in module.msk_old : k => v.bootstrap_brokers
  })
}

output "msk_old_bootstrap_brokers_tls" {
  value = tomap({
    for k, v in module.msk_old : k => v.bootstrap_brokers_tls
  })
}