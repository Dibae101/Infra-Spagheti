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

resource "aws_instance" "app_server" {
  ami           = "ami-053a45fff0a704a47"
  instance_type = "t3.nano"

  tags = {
    Name = "Test01"
  }
}