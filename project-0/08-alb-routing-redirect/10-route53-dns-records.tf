# Default Apps DNS
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

# Git DNS
resource "aws_route53_record" "git" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = local.git_dns_name
  type    = "A"
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}
