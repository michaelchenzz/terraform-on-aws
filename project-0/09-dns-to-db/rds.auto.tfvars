db_username       = "root"
db_engine         = "mysql"
db_engine_version = "8.0.33"
db_multi_az       = true
db_instance_class = "db.t3.micro"

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
