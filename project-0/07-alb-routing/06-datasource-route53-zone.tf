# Get DNS information from Amazon Route53
data "aws_route53_zone" "mydomain" {
  name = var.mydomain
}

# Output Zone ID
output "mydomain_zoneid" {
  value = data.aws_route53_zone.mydomain.zone_id
}

# Output Zone Name
output "mydomain_name" {
  value = data.aws_route53_zone.mydomain.name
}
