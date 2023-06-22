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
