locals {
  tag_name = "test-ec2-02"
}

resource "aws_instance" "app_server" {
  ami           = var.ami 
  instance_type = var.instance_type

    provisioner "local-exec" {
        command = "echo ${self.private_ip} >> private_ips.txt"
    }
 
  tags = {
    Name = "${local.tag_name}"
  }
}