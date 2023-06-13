terraform {
  required_version = "~> 1.4.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.2"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
