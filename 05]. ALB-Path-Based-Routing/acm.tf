module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = "algotrading.live"
  zone_id     = data.route53_zone.domain.zone_id

  validation_method = "DNS"

  subject_alternative_names = [
    "*.algotrading.live"
  ]

  tags = local.common_tags
}

# Output certificate ARN
output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}