module "sg_alb" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name   = "${local.name}-sg-alb"
  vpc_id = module.vpc.vpc_id

  # Ingress - Allow HTTP, HTTPS to all
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"] // List of IPv4 CIDR ranges to use on ALL ingress rules

  # Egress - Allow all
  egress_rules = ["all-all"]
}
