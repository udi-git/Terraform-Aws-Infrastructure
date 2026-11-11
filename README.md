# Terraform & AWS Infrastructure Lab

A comprehensive, hands-on repository demonstrating Infrastructure as Code (IaC) principles using Terraform and AWS. The project progresses from foundational EC2 provisioning to production-ready, modular, high-availability architectures running containerized applications.

## Project Structure & Roadmap

| Module / Folder | Topics Covered | Key Components |
|---|---|---|
| **[01-basic-ec2](./01-basic-ec2)** | Single EC2 Provisioning | Provider block, `aws_instance`, basic tags |
| **[02-vpc](./02-vpc)** | Network Isolation | Custom VPC creation, CIDR allocation |
| **[03-subnet](./03-subnet)** | Cross-Stack Dependencies | `terraform_remote_state`, Subnet provisioning, AZ placement |
| **[04-vpc-subnet-same-folder](./04-vpc-subnet-same-folder)** | Resource Dependencies | Subnet association, implicit dependency mapping |
| **[05-data-sources](./05-data-sources)** | Dynamic Infrastructure | `data` blocks for dynamic AMI and default VPC lookup |
| **[06-docker](./06-docker)** | Automated Application Deployment | EC2 `user_data`, Docker container startup, Security Groups |
| **[part1-ec2-module](./part1-ec2-module)** | Infrastructure Modularization | Local modules, `variables.tf`, `outputs.tf`, DRY principles |
| **[part2-asg-alb](./part2-asg-alb)** | High Availability Architecture | Application Load Balancer, Auto Scaling Group, Health Checks |

## Key Technologies & Skills
- **Infrastructure as Code:** Terraform (v1.x+)
- **Cloud Provider:** Amazon Web Services (AWS)
- **Compute & Scaling:** EC2, Auto Scaling Groups (ASG), Launch Templates
- **Networking & Security:** VPC, Subnets, ALB, Stateful Security Groups
- **Containerization:** Docker, Nginx
- **Automation & Workflow:** Dynamic Data Sources, Local Modules, CI/CD Readiness (`terraform plan -out`)

## Prerequisites
- AWS CLI configured with appropriate credentials
- Terraform CLI installed (`>= 1.5.0`)
- Git

## Usage Instructions
Navigate to any project directory and execute the standard Terraform workflow:
```bash
cd <directory_name>
terraform init
terraform plan
terraform apply
