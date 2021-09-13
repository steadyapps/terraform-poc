# Usage


# Dev

terraform init -backend-config=./vars/terraform-backend-dev.tfvars <br>
terraform plan -var-file=./vars/parameters-dev.tfvars


# Prod

terraform init -backend-config=./vars/terraform-backend-prod.tfvars <br>
terraform plan -var-file=./vars/parameters-prod.tfvars