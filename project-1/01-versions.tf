terraform {
  required_version = "~> 1.4.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.4"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }

  provider "aws" {
    region  = var.aws_region
    profile = var.aws_profile
  }
}
