resource "aws_elasticsearch_domain" "es" {
  domain_name           = var.domain
  elasticsearch_version = "7.10"

  cluster_config {
    dedicated_master_enabled = true
    instance_count           = var.instance_count
    instance_type            = var.instance_type
    # zone_awareness_enabled   = true
    # zone_awareness_config {
    #   availability_zone_count  = var.availability_zone_count
    # }
  }



  vpc_options {
    subnet_ids = var.subnet_ids
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.ebs_volume_size
    volume_type = var.volume_type
  }

  encrypt_at_rest {
    enabled = true
  }



  #  node_to_node_encryption_enabled                = true


  tags = {
    Domain = var.tag_domain
    env    = var.env
  }
}


resource "aws_elasticsearch_domain_policy" "main" {
  domain_name     = aws_elasticsearch_domain.es.domain_name
  access_policies = <<POLICIES
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Resource": "${aws_elasticsearch_domain.es.arn}/*"
        }
    ]
}
POLICIES
}