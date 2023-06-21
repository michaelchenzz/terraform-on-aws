module "sg_ec2bastion" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name   = "${local.name}-sg-ec2-bastion"
  vpc_id = module.vpc.vpc_id

  # Ingress - Allow HTTP and SSH to all
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"] // List of IPv4 CIDR ranges to use on ALL ingress rules
  # Egress -  Allow all
  egress_rules = ["all-all"]
}
