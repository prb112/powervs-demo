Demonstrates how to install Quay in a Power Virtual Instance on PowerVS

# Steps to Initialize with Terraform and PowerVS

0. Create a var.tfvars file

1. Initialize

$ terraform init -var-file=data/var.tfvars

2. Plan

$ terraform plan -var-file=data/var.tfvars

3. Apply

$ terraform plan -var-file=data/var.tfvars

To destroy

$ terraform destroy -var-file=data/var.tfvars