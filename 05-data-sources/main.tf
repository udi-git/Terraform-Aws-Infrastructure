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

data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_subnet" "example_subnet" {
  vpc_id                  = data.aws_vpc.default_vpc.id 
  cidr_block              = "172.31.96.0/20"                  
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "My_Subnet"
  }
}

resource "aws_instance" "example_instance" {
  ami           = data.aws_ami.latest_amazon_linux.id 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.example_subnet.id        

  tags = {
    Name = "My_Instance"
  }
}

output "instance_id" {
  value = aws_instance.example_instance.id
}
