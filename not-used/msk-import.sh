#!/usr/bin/env bash

#terraform import -var-file=./vars/parameters-igor-dev.tfvars module.msk[\"main\"].aws_subnet.msk[\"az1\"] subnet-01312c5632983f1e0
#terraform import -var-file=./vars/parameters-igor-dev.tfvars module.msk[\"main\"].aws_subnet.msk[\"az2\"] subnet-0ca0e3548af75a253
#terraform import -var-file=./vars/parameters-igor-dev.tfvars module.msk[\"main\"].aws_subnet.msk[\"az3\"] subnet-0753033c61743149d

#terraform import -var-file=./vars/parameters-igor-dev.tfvars module.msk[\"main\"].aws_security_group.sg sg-0e93fca7f916b7263

terraform import -var-file=./vars/parameters-dev.tfvars module.msk_config[\"msk_config\"].aws_msk_configuration.config arn:aws:kafka:us-east-1:133638536280:configuration/mskconfig/0d5bff80-2847-4550-a4ce-2d9eef57e7a7-4
terraform import -var-file=./vars/parameters-dev.tfvars module.msk_config[\"msk_config_dev\"].aws_msk_configuration.config arn:aws:kafka:us-east-1:133638536280:configuration/msk-config-dev/0ff3fade-8b45-49c7-acb0-4cc5e46ed2cb-13

terraform import -var-file=./vars/parameters-dev.tfvars module.msk_old[\"main\"].aws_kms_key.kms 5b951064-4c52-49ea-8df3-50eede4fa39e

terraform import -var-file=./vars/parameters-dev.tfvars module.msk_old[\"main\"].aws_msk_cluster.kafka arn:aws:kafka:us-east-1:133638536280:cluster/dev-kafka-cluster/dfc23de6-3bae-43e4-a839-caee4e4b35e5-5