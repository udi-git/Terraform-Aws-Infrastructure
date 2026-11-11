# Part 2 - High Availability Architecture (ASG + ALB + Docker)

## Overview
A production-ready, fault-tolerant infrastructure containing an Application Load Balancer (ALB) and an Auto Scaling Group (ASG) executing Dockerized EC2 instances across multiple Availability Zones.

## Architecture
- **Application Load Balancer (ALB):** Public entry point distributing incoming web traffic.
- **Auto Scaling Group (ASG):** Dynamic pool of EC2 instances managed via Launch Template.
- **Stateful Security Groups:** Strict security bounds restricting EC2 ingress solely to the Load Balancer SG.
- **Health Checks & Target Group:** Automated instance health evaluation before routing traffic.

## Verification
Upon running `terraform apply`, access the printed `alb_dns_name` output in your browser to verify the Nginx application response.

## How to Run
```bash
terraform init
terraform plan
terraform apply
terraform destroy
