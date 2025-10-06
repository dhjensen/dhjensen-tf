locals {

  zones = [
    {
      zone        = "dhjensen.dk"
      jump_start  = false
    },
    {
      zone        = "daniboy.dk"
      jump_start  = false
    },
    {
      zone        = "dhjensen.tech"
      jump_start  = false
    }
  ]

  cname_a_records = [
    {
      zone    = "dhjensen.dk"
      type    = "A"
      name    = "dhjensen.dk"
      value   = "185.199.108.153"
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "A"
      name    = "dhjensen.dk"
      value   = "185.199.109.153"
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "A"
      name    = "dhjensen.dk"
      value   = "185.199.110.153"
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "A"
      name    = "dhjensen.dk"
      value   = "185.199.111.153"
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "A"
      name    = "matomo"
      value   = oci_core_instance.dhjensen-instance-001.public_ip
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "CNAME"
      name    = "www"
      value   = "dhjensen.dk"
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "CNAME"
      name    = "blog"
      value   = "ghs.google.com"
      proxied = "false"
    },
    {
      zone    = "daniboy.dk"
      type    = "CNAME"
      name    = "sites"
      value   = "ghs.google.com"
      proxied = "false"
    },
    {
      zone    = "daniboy.dk"
      type    = "CNAME"
      name    = "calendar"
      value   = "ghs.google.com"
      proxied = "false"
    },
    {
      zone    = "daniboy.dk"
      type    = "CNAME"
      name    = "skole"
      value   = "ghs.google.com"
      proxied = "false"
    },
    {
      zone    = "daniboy.dk"
      type    = "CNAME"
      name    = "docs"
      value   = "ghs.google.com"
      proxied = "false"
    },
    {
      zone    = "daniboy.dk"
      type    = "CNAME"
      name    = "mail"
      value   = "ghs.google.com"
      proxied = "false"
    },
    {
      zone    = "daniboy.dk"
      type    = "A"
      name    = "@"
      value   = "192.0.2.1"
      proxied = "true"
    },
    {
      zone    = "daniboy.dk"
      type    = "A"
      name    = "www"
      value   = "192.0.2.1"
      proxied = "true"
    },
    {
      zone    = "dhjensen.tech"
      type    = "A"
      name    = "r01"
      value   = "87.61.92.76"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "A"
      name    = "instance001"
      value   = oci_core_instance.dhjensen-instance-001.public_ip
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "wg"
      value   = "r01.dhjensen.tech"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "rustdesk"
      value   = "r01.dhjensen.tech"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "croc"
      value   = "r01.dhjensen.tech"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "traefik-oci"
      value   = "instance001.dhjensen.tech"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "beszel"
      value   = "r01.dhjensen.tech"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "dozzle-oci"
      value   = "instance001.dhjensen.tech"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "ntfy"
      value   = "r01.dhjensen.tech"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "wud-oci"
      value   = "instance001.dhjensen.tech"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "duplicati-oci"
      value   = "instance001.dhjensen.tech"
      proxied = "false"
    }
  ]

  mx_records = [
    {
      zone      = "daniboy.dk"
      value     = "aspmx.l.google.com"
      priority  = 10
    },
    {
      zone      = "daniboy.dk"
      value     = "alt1.aspmx.l.google.com"
      priority  = 20
    },
    {
      zone      = "daniboy.dk"
      value     = "alt2.aspmx.l.google.com"
      priority  = 20
    },
    {
      zone      = "daniboy.dk"
      value     = "aspmx2.googlemail.com"
      priority  = 30
    },
    {
      zone      = "daniboy.dk"
      value     = "aspmx3.googlemail.com"
      priority  = 30
    },
    {
      zone      = "daniboy.dk"
      value     = "aspmx4.googlemail.com"
      priority  = 30
    },
    {
      zone      = "daniboy.dk"
      value     = "aspmx5.googlemail.com"
      priority  = 30
    }
  ]
}

resource "cloudflare_zone" "zones" {
  for_each = {
    for zone in local.zones : zone.zone => zone
  }
  name = each.value.zone
  account = {
    id = "1cb328fc2007a477b2baf8e7fd6c1ee3"
  }
  type = "full"
}

resource "cloudflare_dns_record" "cname_a_records" {
  for_each = {
    for record in local.cname_a_records : "${record.zone}.${record.name}.${record.value}" => record
  }
  zone_id     = cloudflare_zone.zones[each.value.zone].id
  type        = each.value.type
  name        = each.value.name
  content     = each.value.value
  proxied     = each.value.proxied
  ttl         = 1
  depends_on  = [oci_core_instance.dhjensen-instance-001]
}

resource "cloudflare_dns_record" "mx_records" {
  for_each = {
    for record in local.mx_records : "${record.zone}.${record.value}" => record
  }
  zone_id   = cloudflare_zone.zones[each.value.zone].id
  type      = "MX"
  name      = each.value.zone
  content   = each.value.value
  priority  = each.value.priority
  proxied   = false
  ttl       = 1
}

resource "cloudflare_page_rule" "daniboy_redirect" {
  zone_id = cloudflare_zone.zones["daniboy.dk"].id
  target = "*.daniboy.dk/*"
  status = "active"

  actions = {
    forwarding_url = {
      status_code = 301
      url = "https://dhjensen.dk"
    }
  }
}
