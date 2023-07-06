output "sg_ec2bastion_id" {
  description = "The ID of the security group EC2 Bastion"
  value       = module.sg_ec2bastion.security_group_id
}
