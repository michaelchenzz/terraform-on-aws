locals {
  apps_dns_name = "${var.apps_subdomain}.${var.mydomain}"
  git_dns_name  = "${var.git_subdomain}.${var.mydomain}"
}
