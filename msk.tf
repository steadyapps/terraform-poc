module "msk" {
  source   = "./modules/msk"
  for_each = var.msk

  environment     = var.environment
  domain          = var.domain
  vpc_id          = var.vpc_id
  EKS_VPC_CIDR    = var.EKS_VPC_CIDR
  steady_VPC_CIDR = var.steady_VPC_CIDR

  kafka_version   = each.value.kafka_version
  cluster_name    = each.value.cluster_name
  ebs_volume_size = each.value.ebs_volume_size
  net_offset      = each.value.net_offset
  instance_type   = each.value.instance_type
  create_cname    = each.value.create_cname
  cname_prefix    = each.value.cname_prefix

}

output "msk_subnets" {
  value = tomap({
    for k, v in module.msk : k => v.subnets
  })
}

output "msk_zookeeper_connect_string" {
  value = tomap({
    for k, v in module.msk : k => v.zookeeper_connect_string
  })
}

output "msk_bootstrap_brokers" {
  value = tomap({
    for k, v in module.msk : k => v.bootstrap_brokers
  })
}

output "msk_bootstrap_brokers_tls" {
  value = tomap({
    for k, v in module.msk : k => v.bootstrap_brokers_tls
  })
}