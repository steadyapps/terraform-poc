# Usage

Use your own backend config file with separate terraform statefile.  <br>
Work on separate branch and the make pr to master. <br>
Terraform version = 1.0.3  <br>
# Dev

roma:
```terraform init -backend-config=./vars/terraform-backend-dev-roma.tfvars``` <br>
igor:
```terraform init -backend-config=./vars/terraform-backend-dev-igor.tfvars``` <br> 
anatoliy:
```terraform init -backend-config=./vars/terraform-backend-dev-anatoliy.tfvars``` <br>

terraform plan -var-file=./vars/parameters-dev-roma.tfvars


# Prod

roma:
```terraform init -backend-config=./vars/terraform-backend-prod-roma.tfvars```  <br> 
igor:
```terraform init -backend-config=./vars/terraform-backend-prod-igor.tfvars```  <br>
anatoliy:
```terraform init -backend-config=./vars/terraform-backend-prod-anatoliy.tfvars``` <br> 

terraform plan -var-file=./vars/parameters-prod.tfvars
