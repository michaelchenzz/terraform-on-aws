variable "mydomain" {
  description = "Current Top-level Domain"
  type        = string
}

variable "dns_to_db_subdomain" {
  description = "dns-to-db Subdomain"
  type        = string
}

variable "acm_certificate_arn" {
  description = "SSL Certificate"
  type        = string
}
