variable "bastion_instance_type" {
  description = "EC2 Bastion Instance Type"
  type        = string
}

variable "private_instance_type" {
  description = "EC2 Private Instance Type"
  type        = string
}

variable "instance_keypair" {
  description = "EC2 Key pair that need to be associated"
  type        = string
}

variable "private_instance_count" {
  description = "Number of private EC2 instances"
  type        = number
}
