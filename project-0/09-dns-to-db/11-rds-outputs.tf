output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.rds.db_instance_address
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.rds.db_instance_availability_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.rds.db_instance_endpoint
}

output "db_instance_engine" {
  description = "The database engine"
  value       = module.rds.db_instance_engine
}

output "db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = module.rds.db_instance_engine_version_actual
}

output "db_instance_identifier" {
  description = "The RDS instance identifier"
  value       = module.rds.db_instance_identifier
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.rds.db_instance_resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = module.rds.db_instance_status
}

output "db_instance_port" {
  description = "The database port"
  value       = module.rds.db_instance_port
}

output "db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.rds.db_subnet_group_id
}

output "db_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.rds.db_parameter_group_id
}
