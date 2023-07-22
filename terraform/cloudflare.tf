
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# resource "cloudflare_record" "app_server" {
#   zone_id = var.cloudflare_zone_id
#   name    = "test-${var.cloudflare_domain}"
#   value   = aws_instance.app_server.public_ip
#   type    = "A"
#   proxied = false

#   depends_on = [aws_instance.app_server]
# }

module "zone" {
  source = "cloudposse/zone/cloudflare"
  # version = "0.5.1"

  account_id = "519be7c32b14d85ab7e43655becde6b3"
  zone       = "die13.cc"

  records = [
    # {
    #   name  = "bastion"
    #   value = "23.95.209.245"
    #   type  = "A"
    #   ttl   = 3600
    # },
    {
      name  = "test"
      value = "23.95.209.245"
      type  = "A"
      ttl   = 3600
    }
  ]

  context = module.this.context
}
