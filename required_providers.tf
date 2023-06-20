terraform {
  # backend "remote" {
  #   hostname = "app.terraform.io"
  #   organization = "shashi-terraform"

  #   workspaces {
  #     name = "terraform-bootcamps"
  #   }
  # }
  cloud {
    organization = "shashi-terraform"

    workspaces {
      name = "terraform-bootcamps"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}