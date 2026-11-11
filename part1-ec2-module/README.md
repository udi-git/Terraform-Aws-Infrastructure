# Part 1 - EC2 Infrastructure Modularization

## Overview
Refactoring flat Terraform files into reusable, parameterized local modules following DRY (Don't Repeat Yourself) principles.

## Concepts Covered
- Local module architecture (`./modules/ec2-instance`)
- Module input parameters via `variables.tf`
- Exposing computed attributes via `outputs.tf`

## How to Run
```bash
terraform init
terraform plan
terraform apply
