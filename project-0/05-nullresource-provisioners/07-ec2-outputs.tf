output "ec2_bastion_id" {
  description = "ID of Bastion Host"
  value       = module.ec2_bastion.id
}

output "ec2_bastion_public_ip" {
  description = "Public IP of Bastion Host"
  value       = module.ec2_bastion.public_ip
}
