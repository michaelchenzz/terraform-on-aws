module "sg_db" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name   = "${local.name}-sg-db"
  vpc_id = module.vpc.vpc_id

  # Ingress - Allow MySQL 3306 from Bastion Host and all EC2 Private Instances
  ingress_with_source_security_group_id = [
    {
      rule                     = "mysql-tcp"
      source_security_group_id = module.sg_ec2bastion.security_group_id
    },
    {
      rule                     = "mysql-tcp"
      source_security_group_id = module.sg_ec2private.security_group_id
    },
  ]

  # Egress - Allow all
  egress_rules = ["all-all"]
}
