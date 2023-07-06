variable "aws_profile" {
  description = "AWS Profile for this specific project"
  type        = string
}

variable "aws_region" {
  description = "AWS Region in which you create resources for the project"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment Variable used as a prefix of resources' name"
  type        = string
}
