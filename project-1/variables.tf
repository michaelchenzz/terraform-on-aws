# Project name
variable "project" {
  description = "Name of project that uses AWS"
  type = string
  default = "rwc"
}

# Environment name
variable "env" {
  description = "Environment of project"
  type = string
  default = "dev"
}

# AWS Profile
variable "aws_profile" {
  description = "Profile used to create AWS resources"
  type = string
  default = "default"
}

# AWS Region
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type = string
  default = "ap-northeast-1"
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

# EC2 instance key pair
variable "instance_keypair" {
    description = "EC2 key pair that need to be associated with EC2 instance"
    type = string
    default = "dattt-tokyo"
}

# EC2 number of instances
variable "number_of_instances" {
    description = "Number of EC2 instances"
    type = number
    default = 1
}