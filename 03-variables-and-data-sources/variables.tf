variable "instance_type" {
  type        = string
  description = "instance type in ec2 like, t2.micro, t2.medium"
}

variable "ami" {
  type = string

}

variable "aws_access_key_id" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}