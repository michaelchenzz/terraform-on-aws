locals {
  apps_dns_name = "${var.apps_subdomain}.${var.mydomain}"
  app1_dns_name = "${var.app1_subdomain}.${var.mydomain}"
  app2_dns_name = "${var.app2_subdomain}.${var.mydomain}"
}
