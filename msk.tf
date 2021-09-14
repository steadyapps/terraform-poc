# module "msk-main" {
#   source = "./modules/msk"
#   cluster_name = var.msk_cluster_name
#   ebs_volume_size = var.msk_ebs_volume_size
#   environment = var.environment
#   instance_type = var.msk_instance_type
#   vpc_id = var.msk_vpc_id
#   EKS_VPC_CIDR = var.msk_steady_VPC_CIDR
#   net_offset = var.msk_net_offset
# }