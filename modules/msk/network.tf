# Subnets

data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_availability_zones" "main" {
  state = "available"
}

resource "aws_subnet" "msk" {
  for_each          = var.subnets
  availability_zone = each.value.availability_zone
  cidr_block        = each.value.cidr
  vpc_id            = data.aws_vpc.main.id
  tags = {
    Name        = "Subnet ${each.key} for ${var.cluster_name}-${var.environment}"
    Environment = var.environment
  }
}

# CNAME
data "aws_route53_zone" "main" {
  count = var.create_cname ? 1 : 0
  name  = var.domain
}

# count = length(split(",", aws_msk_cluster.kafka.zookeeper_connect_string))
resource "aws_route53_record" "brokers" {
  count   = var.create_cname == true ? 3 : 0
  zone_id = data.aws_route53_zone.main[0].zone_id
  name    = "${var.cname_prefix}-${var.environment}-b${count.index}"
  type    = "CNAME"
  ttl     = "60"
  records = [split(",", aws_msk_cluster.kafka.bootstrap_brokers)[count.index]]

  depends_on = [
    aws_msk_cluster.kafka
  ]
}

resource "aws_route53_record" "brokers_tls" {
  count   = var.create_cname ? 3 : 0
  zone_id = data.aws_route53_zone.main[0].zone_id
  name    = "${var.cname_prefix}-${var.environment}-bs${count.index}"
  type    = "CNAME"
  ttl     = "60"
  records = [split(",", aws_msk_cluster.kafka.bootstrap_brokers_tls)[count.index]]

  depends_on = [
    aws_msk_cluster.kafka
  ]
}

resource "aws_route53_record" "zookeeper" {
  count   = var.create_cname ? 3 : 0
  zone_id = data.aws_route53_zone.main[0].zone_id
  name    = "${var.cname_prefix}-${var.environment}-z${count.index}"
  type    = "CNAME"
  ttl     = "60"
  records = [split(",", aws_msk_cluster.kafka.zookeeper_connect_string)[count.index]]

  depends_on = [
    aws_msk_cluster.kafka
  ]
}
