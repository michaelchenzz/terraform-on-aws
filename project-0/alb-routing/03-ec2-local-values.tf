locals {
  multiple_instances = {
    app1-1 = {
      subnet_id = element(module.vpc.private_subnets, 0)
      user_data = file("${path.module}/user-data/app1.sh")
    }
    app1-2 = {
      subnet_id = element(module.vpc.private_subnets, 1)
      user_data = file("${path.module}/user-data/app1.sh")
    }
    app1-3 = {
      subnet_id = element(module.vpc.private_subnets, 2)
      user_data = file("${path.module}/user-data/app1.sh")
    }
    app2-1 = {
      subnet_id = element(module.vpc.private_subnets, 0)
      user_data = file("${path.module}/user-data/app2.sh")
    }
    app2-2 = {
      subnet_id = element(module.vpc.private_subnets, 1)
      user_data = file("${path.module}/user-data/app2.sh")
    }
    app2-3 = {
      subnet_id = element(module.vpc.private_subnets, 2)
      user_data = file("${path.module}/user-data/app2.sh")
    }
  }
}
