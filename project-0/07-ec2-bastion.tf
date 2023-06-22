module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"

  name                   = "${local.name}-ec2-bastion"
  ami                    = data.aws_ami.al2023.id
  instance_type          = var.bastion_instance_type
  key_name               = var.instance_keypair
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.sg_ec2bastion.security_group_id]
}
