# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  # VPC Basic Details
  name = local.name // This will be the prefix in the name of subnets, route tables, internet gateways, nat gateways
  cidr = var.vpc_cidr_block

  azs             = var.vpc_availability_zones
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  # Database Subnets
  database_subnets                   = var.vpc_database_subnets
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Tags
  vpc_tags = {
    Name = "${local.name}-vpc"
  }
  igw_tags = {
    Name = "${local.name}-igw"
  }
  nat_gateway_tags = {
    Name = "${local.name}-nat"
  }
}
