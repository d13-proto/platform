terraform {
  cloud {
    organization = var.organization_name

    workspaces {
      name = var.workspace_name
    }
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }
}
