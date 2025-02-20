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