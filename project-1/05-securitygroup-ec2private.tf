module "sg_ec2private" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name   = "${local.name}-sg-ec2-private"
  vpc_id = module.vpc.vpc_id

  # Ingress - Allow HTTP and SSH to all
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block] // List of IPv4 CIDR ranges to use on ALL ingress rules
  #   ingress_with_cidr_blocks = [
  #     {
  #       rule        = "ssh-tcp"
  #       cidr_blocks = module.sg_ec2bastion.security_group_id
  #     },
  #     {
  #       rule        = "postgresql-tcp"
  #       cidr_blocks = "30.30.30.30/32"
  #     },
  #   ]

  # Egress -  Allow all
  egress_rules = ["all-all"]
}
