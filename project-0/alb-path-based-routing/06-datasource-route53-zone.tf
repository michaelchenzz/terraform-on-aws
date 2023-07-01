# Get DNS information from Amazon Route53
data "aws_route53_zone" "rshcmdevops" {
  name         = "rshcmdevops.com"
}

# Output Zone ID
output "rshcmdevops_zoneid" {
  value = data.aws_route53_zone.selected.zone_id
}