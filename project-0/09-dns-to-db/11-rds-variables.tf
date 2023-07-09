# DB Username
variable "db_username" {
  description = "RDS Database Administrator Username"
  type        = string
}

# DB Password - Enable Sensitive flag
variable "db_password" {
  description = "RDS Database Administrator Password"
  type        = string
  sensitive   = true
}
