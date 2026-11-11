provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "ec2_ebs" {
  source = "./modules/ec2-module"

  ami_id           = data.aws_ami.latest_amazon_linux.id
  instance_type    = "t3.micro"
  root_volume_size = 8
  ebs_volume_size  = 10
  ebs_volume_type  = "gp3"
}

output "server_public_ip" {
  value = module.ec2_ebs.public_ip
}

output "server_id" {
  value = module.ec2_ebs.instance_id
}
