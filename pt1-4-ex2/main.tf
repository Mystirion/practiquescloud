provider "aws" {
  region = "us-east-1"
}

#VPC

resource "aws_vpc" "vpc_terraform" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "VPC_Terraform"
  }
}

#Subredes

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.vpc_terraform.id
  cidr_block        = "10.0.32.0/25"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Subnet_A"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.vpc_terraform.id
  cidr_block        = "10.0.30.0/23"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Subnet_B"
  }
}

resource "aws_subnet" "subnet_c" {
  vpc_id            = aws_vpc.vpc_terraform.id
  cidr_block        = "10.0.33.0/28"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Subnet_C"
  }
}

#Instancias

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "admin_dylan" {
  count         = 2
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet_b.id

  tags = {
    Name = "AdminDylan${count.index + 1}"
  }
}

resource "aws_instance" "servers_dylan" {
  count         = 2
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet_a.id

  tags = {
    Name = "ServersDylan${count.index + 1}"
  }
}

resource "aws_instance" "web_dylan" {
  count         = 2
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet_c.id

  tags = {
    Name = "WebDylan${count.index + 1}"
  }
}