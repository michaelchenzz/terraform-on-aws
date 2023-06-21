output "ec2_bastion_id" {
  description = "ID of Bastion Host"
  value       = module.ec2_bastion.id
}

output "ec2_bastion_public_ip" {
  description = "Public IP of Bastion Host"
  value       = module.ec2_bastion.public_ip
}

output "ec2_private_ids" {
  description = "List of IDs of intances"
  value       = module.ec2_private.id
}

output "ec2_private_ips" {
  description = "List of Private IPs assigned to the private intances"
  value       = module.ec2_private.private_ip
}
