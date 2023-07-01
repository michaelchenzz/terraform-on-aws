module "sg_ec2private" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name   = "${local.name}-sg-ec2-private"
  vpc_id = module.vpc.vpc_id

  # Ingress - Allow HTTP from within VPC and SSH to Bastion Host only
  ingress_with_source_security_group_id = [
    {
      rule                     = "ssh-tcp"
      source_security_group_id = module.sg_ec2bastion.security_group_id
    }
  ]

  ingress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]

  # Egress - Allow all
  egress_rules = ["all-all"]
}
