module "elasticsearch" {
    source = "./modules/elasticsearch"
    domain = var.domain
    instance_count = var.instance_count
    instance_type = var.instance_type
    subnet_ids = var.subnet_ids
    ebs_volume_size = var.ebs_volume_size
    volume_type = var.volume_type
    tag_domain = var.tag_domain
    env = var.env

}






