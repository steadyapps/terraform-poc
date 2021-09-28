#!/usr/bin/env bash


# cluster

terraform-1.0.3 import -var-file=./vars/parameters-dev.tfvars \
'module.rds["steady_opportunities_dev"].aws_rds_cluster.this' steady-opportunities-dev

#remove
#terraform-1.0.3 state rm 'module.rds["steady_opportunities_dev"].aws_rds_cluster.this'


#instance

terraform-1.0.3 import -var-file=./vars/parameters-dev.tfvars \
'module.rds["steady_opportunities_dev"].aws_rds_cluster_instance.this[0]' steady-opportunities-dev-writer

#remove
#terraform-1.0.3 state rm 'module.rds["steady_opportunities_dev"].aws_rds_cluster_instance.this[0]'

