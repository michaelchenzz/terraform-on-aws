# Default DNS
resource "aws_route53_record" "dns_to_db" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = local.dns_to_db_dns_name
  type    = "A"
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}
