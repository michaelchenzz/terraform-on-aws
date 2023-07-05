# Default DNS
resource "aws_route53_record" "apps" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = local.apps_dns_name
  type    = "A"
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}

# App1 DNS
resource "aws_route53_record" "app1" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = local.app1_dns_name
  type    = "A"
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}

# App2 DNS
resource "aws_route53_record" "app2" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = local.app2_dns_name
  type    = "A"
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}
