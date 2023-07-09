module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.0.0"

  # Engine options
  engine         = "mysql"
  engine_version = "8.0.33"

  # Availability and durability
  multi_az = true

  # Settings
  identifier = "${local.name}-db"
  username   = var.db_username
  password   = var.db_password

  # Instance configuration
  instance_class = "db.t3.micro"

  # Storage
  storage_type          = "gp3"
  allocated_storage     = 20
  max_allocated_storage = 1000

  # Connectivity
  subnet_ids             = module.vpc.database_subnets
  vpc_security_group_ids = [module.sg_db.security_group_id]
  create_db_subnet_group = true
  db_subnet_group_name   = "${local.name}-subnet-group"
  publicly_accessible    = false
  port                   = 3306

  # Monitoring
  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  monitoring_role_arn                   = "arn:aws:iam::319656628632:role/rds-monitoring-role"
  monitoring_interval                   = 60

  # Additional configuration
  family                          = "mysql8.0" # DB parameter group
  major_engine_version            = "8.0"      # DB option group
  backup_retention_period         = 0
  skip_final_snapshot             = true
  deletion_protection             = false
  enabled_cloudwatch_logs_exports = ["general"]

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]
}
