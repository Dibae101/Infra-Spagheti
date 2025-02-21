terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }
  }
}

locals {
  tag_name = "test-var-ec2"
}

# AWS Data Source to Fetch Latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true  

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]  
}

# Reference AWS Data Source to Get AMI ID
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = local.tag_name
  }
}