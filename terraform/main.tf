terraform {
  cloud {
    organization = ""

    workspaces {
      name = "raspberry"
    }
  }
  required_providers {
    pihole = {
      source = "ryanwholey/pihole"
    }
  }
}

provider "pihole" {
  url       = var.url
  api_token = var.api_token
}

resource "pihole_dns_record" "neptune_record" {
  domain = "neptune.local"
  ip     = "192.168.1.29"
}

resource "pihole_cname_record" "status_neptune_record" {
  domain = "status.neptune.local"
  target = "neptune.local"
}

resource "pihole_cname_record" "pihole_neptune_record" {
  domain = "pihole.neptune.local"
  target = "neptune.local"
}

resource "pihole_cname_record" "dashboard_neptune_record" {
  domain = "dashboard.neptune.local"
  target = "neptune.local"
}

resource "pihole_cname_record" "traefik_neptune_record" {
  domain = "traefik.neptune.local"
  target = "neptune.local"
}

resource "pihole_cname_record" "search_neptune_record" {
  domain = "search.neptune.local"
  target = "neptune.local"
}
