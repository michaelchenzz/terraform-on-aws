locals {
  multiple_instances = {
    one = {
      availability_zone = element(module.vpc.azs, 0)
      subnet_id         = element(module.vpc.private_subnets, 0)
    }
    two = {
      availability_zone = element(module.vpc.azs, 1)
      subnet_id         = element(module.vpc.private_subnets, 1)
    }
    three = {
      availability_zone = element(module.vpc.azs, 2)
      subnet_id         = element(module.vpc.private_subnets, 2)
    }
  }
}


module "ec2_private" {
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "5.1.0"
  depends_on = [module.vpc]

  for_each = local.multiple_instances

  name          = "${local.name}-ec2-private-${each.key}"
  ami           = data.aws_ami.al2023.id
  instance_type = var.private_instance_type
  key_name      = var.instance_keypair
  #subnet_id     = module.vpc.private_subnets[0]
  #subnet_ids             = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  vpc_security_group_ids = [module.sg_ec2private.security_group_id]
  root_block_device = [
    {
      volume_size = var.private_ebs_root_size
      throughput  = var.private_ebs_root_throughput
      iops        = var.private_ebs_root_iops
    }
  ]
  user_data = file("${path.module}/app1.sh")
}
