resource "aws_eip" "bastion_eip" {
  depends_on = [module.vpc]
  instance   = module.ec2_bastion.id
  domain     = "vpc"
}

output "bastion_eip" {
  value = aws_eip.bastion_eip.public_ip
}
