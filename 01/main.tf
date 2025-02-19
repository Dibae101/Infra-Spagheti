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

resource "aws_instance" "app_server" {
  ami           = var.ami 
  instance_type = var.instance_type

  tags = {
    Name = "Test01"
  }
}