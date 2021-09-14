# Usage

Use your own terraform statefile

# Dev

terraform init -backend-config=./vars/terraform-backend-dev-roma.tfvars 
# OR
terraform init -backend-config=./vars/terraform-backend-dev-igor.tfvars 
# OR
terraform init -backend-config=./vars/terraform-backend-dev-anatoliy.tfvars 
<br>
terraform plan -var-file=./vars/parameters-dev.tfvars


# Prod

terraform init -backend-config=./vars/terraform-backend-prod-roma.tfvars 
# OR
terraform init -backend-config=./vars/terraform-backend-prod-igor.tfvars 
# OR
terraform init -backend-config=./vars/terraform-backend-prod-anatoliy.tfvars 
<br>
terraform plan -var-file=./vars/parameters-prod.tfvars