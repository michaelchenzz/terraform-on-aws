resource "aws_eip" "bastion_eip" {
  depends_on = [module.vpc, module.ec2_bastion]
  instance   = module.ec2_bastion.id
  domain     = "vpc"
}
