
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

module "zone" {
  source  = "cloudposse/zone/cloudflare"
  version = "0.5.1"

  account_id   = var.cloudflare_account_id
  zone         = var.cloudflare_zone
  zone_enabled = false

  records = [
    {
      name  = "traefik"
      type  = "A"
      value = var.ip
    },
    {
      name  = "sy"
      type  = "A"
      value = var.ip
    },
  ]
}
