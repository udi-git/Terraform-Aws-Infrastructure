terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Fetch the latest Amazon Linux 2 AMI ID dynamically
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Instantiate the custom Docker ASG + ALB module
module "docker_asg_alb" {
  source           = "./modules/docker-asg-alb"
  ami_id           = data.aws_ami.latest_amazon_linux.id
  instance_type    = "t3.micro"
  min_size         = 1
  max_size         = 3
  desired_capacity = 2
}
