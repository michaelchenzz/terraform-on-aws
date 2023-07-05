locals {
  apps_dns_name = "${var.apps_subdomain}.${var.mydomain}"
  app1_dns_name = "${var.app1_subdomain}.${var.mydomain}"
  app2_dns_name = "${var.app2_subdomain}.${var.mydomain}"
}

variable "mydomain" {
  description = "Current Top-level Domain"
  type        = string
}

variable "apps_subdomain" {
  description = "Apps Subdomain"
  type        = string
}

variable "app1_subdomain" {
  description = "App1 Subdomain"
  type        = string
}

variable "app2_subdomain" {
  description = "App2 Subdomain"
  type        = string
}
