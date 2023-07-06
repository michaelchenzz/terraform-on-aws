# Terraform Block
terraform {
  required_version = "~> 1.5.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.5"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
