provider "aws" {
  region = "ap-northeast-2"
}

terraform {
  backend "s3" {
    bucket  = "cinema-aws-terraform-tfstate"
    key     = "cinema-aws-terraform.tfstate"
    region  = "ap-northeast-2"
    encrypt = true
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManageBy    = "Terraform"
    Owner       = "Lawrence Lubwama"
  }
}