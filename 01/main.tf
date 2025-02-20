terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }
  }
}


terraform { 
  /*
  backend  "remote" {
    hostname = "app.terraform.io"
    organization = "darshan-org"
    workspaces { 
      name = "terraform-wspc"  
    } 
  }
  */
}