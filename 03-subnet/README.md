# 03 - Subnet with Remote State

## Overview
Provisioning an AWS Subnet in a separate directory and connecting it to an existing VPC managed by another Terraform configuration using `terraform_remote_state`.

## Concepts Covered
- Cross-directory state sharing via `data "terraform_remote_state"` (local backend)
- Referencing exported outputs (`vpc_id`) from an external state file
- Creating `aws_subnet` with public IP auto-assignment (`map_public_ip_on_launch = true`) in a specific Availability Zone

## Prerequisites
- Directory `02-vpc` must be applied first so its `terraform.tfstate` file exists and outputs `vpc_id`.

## How to Run
```bash
terraform init
terraform plan
terraform apply
