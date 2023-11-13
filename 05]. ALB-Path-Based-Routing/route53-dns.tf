resource "aws_route53_record" "app_dns" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = "app.algotrading.live"
  type    = "A"
  alias {
    name = module.alb.this_lb_dns_name
    zone_id = module.alb.this_lb_zone_id
    evaluate_target_health = true
  }
}