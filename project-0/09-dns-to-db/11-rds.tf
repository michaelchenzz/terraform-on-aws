module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.0.0"

  # Engine options
  engine         = var.db_engine
  engine_version = var.db_engine_version

  # Availability and durability
  multi_az = var.db_multi_az

  # Settings
  identifier = "${local.name}-db"
  username   = var.db_username
  password   = var.db_password

  # Instance configuration
  instance_class = var.db_instance_class

  # Storage
  storage_type          = var.db_storage_type
  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage

  # Connectivity
  subnet_ids             = module.vpc.database_subnets
  vpc_security_group_ids = [module.sg_db.security_group_id]
  create_db_subnet_group = true
  db_subnet_group_name   = "${local.name}-subnet-group"
  publicly_accessible    = var.db_publicly_accessible
  port                   = var.db_port

  # Monitoring
  /*
  performance_insights_enabled          = var.db_performance_insights_enabled
  performance_insights_retention_period = var.db_performance_insights_retention_period
  monitoring_role_arn                   = var.db_monitoring_role_arn
  monitoring_interval                   = var.db_monitoring_interval
  */

  # Additional configuration
  family               = var.db_family               # DB parameter group
  major_engine_version = var.db_major_engine_version # DB option group
  skip_final_snapshot  = var.db_skip_final_snapshot
  deletion_protection  = var.db_deletion_protection
  // enabled_cloudwatch_logs_exports = var.db_enabled_cloudwatch_logs_exports

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
