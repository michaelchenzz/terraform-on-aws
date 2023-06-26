variable "vpc_cidr_block" {
  description = "AWS Profile for this specific project"
  type        = string
}

variable "vpc_availability_zones" {
  description = "List of Availability Zones that this VPC spreads"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "List of VPC Public Subnets"
  type        = list(string)
}

variable "vpc_private_subnets" {
  description = "List of VPC Private Subnets"
  type        = list(string)
}

variable "vpc_database_subnets" {
  description = "List of VPC Database Subnets"
  type        = list(string)
}

variable "vpc_create_database_subnet_route_table" {
  description = "Whether or not to create VPC Database Subnet Route Table"
  type        = bool
}
