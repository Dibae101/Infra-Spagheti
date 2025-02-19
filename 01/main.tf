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


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "tf-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

output "instance_ip_addr" {
  value = aws_instance.app_server.private_ip
}
