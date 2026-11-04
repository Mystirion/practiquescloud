provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux_23" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  count = 2

  ami           = data.aws_ami.amazon_linux_23.id
  instance_type = "t3.micro"

  tags = {
    Name = "ServerDylan${count.index + 1}"
  }
}