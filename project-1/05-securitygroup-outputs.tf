output "sg_ec2bastion_id" {
  description = "The ID of the security group EC2 Bastion"
  value       = module.sg_ec2bastion.security_group_id
}

output "sg_ec2private_id" {
  description = "The ID of the security group EC2 Private"
  value       = module.sg_ec2private.security_group_id
}
