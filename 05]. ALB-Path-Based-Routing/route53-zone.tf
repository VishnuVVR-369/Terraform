# Get DNS info from AWS Route53
data "route53_zone" "domain" {
  name         = "algotrading.live"
  private_zone = false
}

# Outputs
output "route53_zone_id" {
  description = "Hosted Zone id of the desired Hosted Zone"
  value = data.route53_zone.domain.zone_id
}