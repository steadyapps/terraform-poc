module "msk" {
  source          = "./modules/msk"
  for_each = var.msk

  environment = var.environment
  vpc_id = var.vpc_id
  EKS_VPC_CIDR = var.EKS_VPC_CIDR
  steady_VPC_CIDR = var.steady_VPC_CIDR

  cluster_name = each.value.cluster_name
  ebs_volume_size = each.value.ebs_volume_size
  net_offset = each.value.net_offset
  instance_type = each.value.instance_type
}