# 04 - VPC and Subnet Integration

## Overview
Combining VPC creation and Subnet provisioning within a single Terraform execution folder.

## Concepts Covered
- Resource relationships (`aws_subnet` referencing `aws_vpc.id`)
- Subnet CIDR partition (`10.0.1.0/24`)
- Dynamic parameter referencing between resources

## How to Run
```bash
terraform init
terraform plan
terraform apply
