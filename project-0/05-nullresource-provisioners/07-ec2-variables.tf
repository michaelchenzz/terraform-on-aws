variable "instance_keypair" {
  description = "EC2 Key pair that need to be associated"
  type        = string
}

variable "bastion_instance_type" {
  description = "EC2 Bastion Instance Type"
  type        = string
}

variable "bastion_ebs_root_size" {
  description = "Bastion EBS root volume size"
  type        = number
}

variable "bastion_ebs_root_throughput" {
  description = "Bastion EBS root volume throughput"
  type        = number
}

variable "bastion_ebs_root_iops" {
  description = "Bastion EBS root volume iops"
  type        = number
}
