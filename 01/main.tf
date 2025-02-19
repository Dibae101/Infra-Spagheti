terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
  
}

locals {
  tag_name = "test-ec2-02"
}

resource "aws_instance" "app_server" {
  ami           = var.ami 
  instance_type = var.instance_type

  tags = {
    Name = "${local.tag_name}"
  }
}


output "instance_ip_addr" {
  value = aws_instance.app_server.private_ip
}
