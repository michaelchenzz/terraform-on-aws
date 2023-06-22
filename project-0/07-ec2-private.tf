module "ec2_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"

  depends_on    = [module.vpc]
  name          = "${local.name}-ec2-private"
  ami           = data.aws_ami.al2023.id
  instance_type = var.private_instance_type
  key_name      = var.instance_keypair
  subnet_id     = module.vpc.private_subnets[0]
  #subnet_ids             = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  vpc_security_group_ids = [module.sg_ec2private.security_group_id]
  user_data              = file("${path.module}/app1.sh")
}
