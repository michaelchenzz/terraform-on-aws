# Terraform Output Values

# EC2 Instance Public IP with TOSET
output "instance_publicip" {
  #value = aws_instance.myec2vm.*.public_ip # Legacy Splat
  #value = aws_instance.myec2vm[*].public_ip # Latest Splat
  value = toset([for instance in aws_instance.myec2vm : instance.public_ip])
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  #value = aws_instance.myec2vm.*.public_dns # Legacy Splat
  #value = aws_instance.myec2vm[*].public_dns # Latest Splat
  value = toset([for instance in aws_instance.myec2vm : instance.public_dns])
}

# EC2 Instance Public DNS with TOMAP
output "instance_publicdns2" {
  value = tomap({ for az, instance in aws_instance.myec2vm : az => instance.public_dns })
}
