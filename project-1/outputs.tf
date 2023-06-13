# EC2 Instance Public IP
output "instance_publicip" {
  value = aws_instance.ec2-bastion.public_ip
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  value = aws_instance.ec2-bastion.public_dns
}
