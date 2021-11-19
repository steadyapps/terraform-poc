#!/usr/bin/env bash

                #redis-data-dev 

#sg

terraform-1.0.3 import -var-file=./vars/parameters-dev.tfvars \
'module.elasticache["redis-data-dev"].aws_security_group.security-group' \
sg-025acdf466e719bc4

#elasticache subnet group

terraform-1.0.3 import -var-file=./vars/parameters-dev.tfvars \
'module.elasticache["redis-data-dev"].aws_elasticache_subnet_group.subnet-group' \
data-dev-cache-subnet


#notification topic

# terraform-1.0.3 import -var-file=./vars/parameters-dev-roma.tfvars \
# 'module.elasticache["redis-data-dev"].aws_sns_topic.topic' \
# 'arn:aws:sns:us-east-1:133638536280:steady-dev-topic'

#cluster


terraform-1.0.3 import -var-file=./vars/parameters-dev.tfvars \
'module.elasticache["redis-data-dev"].aws_elasticache_replication_group.replication-group' \
redis-data-dev



                #redis-dev 

#sg

terraform-1.0.3 import -var-file=./vars/parameters-staging.tfvars \
'module.elasticache["redis-hangfire-staging"].aws_security_group.security-group' \
sg-0ef08ea2f3f9dbac1

#elasticache subnet group

terraform-1.0.3 import -var-file=./vars/parameters-staging.tfvars \
'module.elasticache["redis-newstaging"].aws_elasticache_subnet_group.subnet-group' \
staging-cache-subnet


#notification topic

# terraform-1.0.3 import -var-file=./vars/parameters-dev-roma.tfvars \
# 'module.elasticache["redis-data-dev"].aws_sns_topic.topic' \
# 'arn:aws:sns:us-east-1:133638536280:steady-dev-topic'

#cluster


terraform-1.0.3 import -var-file=./vars/parameters-staging.tfvars \
'module.elasticache["redis-newstaging"].aws_elasticache_replication_group.replication-group' \
redis-newstaging



#terraform-1.0.3 state rm 'module.elasticache["redis-data-dev"].aws_elasticache_subnet_group.subnet-group'




#redis-prod

terraform-1.0.3 import -var-file=./vars/parameters-prod.tfvars \
'module.elasticache["redis-prod"].aws_security_group.security-group' \
sg-0eb3b9dcc8cb437cb

#elasticache subnet group

terraform-1.0.3 import -var-file=./vars/parameters-prod.tfvars \
'module.elasticache["redis-prod"].aws_elasticache_subnet_group.subnet-group' \
steady-private-cache-sn




#cluster


terraform-1.0.3 import -var-file=./vars/parameters-prod.tfvars \
'module.elasticache["redis-prod"].aws_elasticache_replication_group.replication-group' \
redis-prod