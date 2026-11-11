# 05 - Terraform Data Sources

## Overview
Using Terraform `data` blocks to dynamically query existing AWS cloud resources instead of hardcoding IDs.

## Concepts Covered
- Dynamic lookup of default VPC (`data "aws_vpc"`) and subnets
- Querying latest Amazon Linux 2 AMI IDs dynamically (`data "aws_ami"`)
- Decoupling infrastructure code from region-specific static IDs

## How to Run
```bash
terraform init
terraform plan
terraform apply
