# Engine options
variable "db_engine" {
  description = "The database engine to use"
  type        = string
}

variable "db_engine_version" {
  description = "The engine version to use"
  type        = string
}

# Availability and durability
variable "db_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
}

# Settings
variable "db_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "db_password" {
  description = "Password for the master DB user"
  type        = string
  sensitive   = true
}

# Instance configuration
variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

# Storage
variable "db_storage_type" {
  description = "Can be: 'standard' (magnetic), 'gp2', 'gp3', 'io1'"
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "db_max_allocated_storage" {
  description = "Specifies the value for Storage Autoscaling"
  type        = number
}

# Connectivity
variable "db_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
  type        = number
}

# Monitoring
/*
variable "db_performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled"
  type        = bool
}

variable "db_performance_insights_retention_period" {
  description = "The amount of time in days to retain Performance Insights data"
  type        = number
}

variable "db_monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs"
  type        = string
}

variable "db_monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance"
  type        = number
}
*/

# Additional configuration
variable "db_family" {
  description = "The family of the DB parameter group"
  type        = string
}

variable "db_major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
}

variable "db_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
}

variable "db_deletion_protection" {
  description = "The database can't be deleted when this value is set to true"
  type        = bool
}

/*
variable "db_enabled_cloudwatch_logs_exports" {
  description = "List of log types to enable for exporting to CloudWatch logs"
  type        = list(string)
}
*/

