
resource "aws_route53_record" "apps" {
  zone_id = data.aws_route53_zone.rshcmdevops.zone_id
  name    = "apps.rshcmdevops.com"
  type    = "A"
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}
