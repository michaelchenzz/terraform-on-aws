# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  # VPC Basic Details
  name = "myvpc" # In a real project, this should be: <project_name>-<environment>
  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  public_subnets  = ["10.0.1.0/24", "10.0.4.0/24", "10.0.7.0/24"]
  private_subnets = ["10.0.2.0/24", "10.0.5.0/24", "10.0.8.0/24"]

  # Database Subnets
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.3.0/24", "10.0.6.0/24", "10.0.9.0/24"]

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Tags
  private_subnet_tags = {
    Type = "private-subnets"
  }
  public_subnet_tags = {
    Type = "public-subnets"
  }
  database_subnet_tags = {
    Type = "database-subnets"
  }
  vpc_tags = {
    Name = "dattt-dev-vpc" # In a real project, this should be: <project_name>-<environment>-vpc
  }
  tags = {
    Owner       = "michael"
    Environment = "dev"
  }
}
