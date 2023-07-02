# Get DNS information from Amazon Route53
data "aws_route53_zone" "rshcmdevops" {
  name = "rshcmdevops.com"
}

# Output Zone ID
output "rshcmdevops_zoneid" {
  value = data.aws_route53_zone.rshcmdevops.zone_id
}

# Output Zone Name
output "rshcmdevops_name" {
  value = data.aws_route53_zone.rshcmdevops.name
}
