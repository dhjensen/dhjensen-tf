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
      value   = "87.61.92.76"
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
      type    = "CNAME"
      name    = "beszel"
      value   = "r01.dhjensen.tech"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "npm"
      value   = "r01.dhjensen.tech"
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
      name    = "wud"
      value   = "r01.dhjensen.tech"
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
      name    = "maubot"
      value   = "r01.dhjensen.tech"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "cyberchef"
      value   = "r01.dhjensen.tech"
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

  srv_records = [
    {
      zone          = "daniboy.dk"
      data_name     = "_xmpp-server._tcp"
      data_priority = 5
      data_target   = "xmpp-server.l.google.com"
    },
    {
      zone          = "daniboy.dk"
      data_name     = "_xmpp-server._tcp"
      data_priority = 20
      data_target   = "xmpp-server1.l.google.com"
    },
    {
      zone          = "daniboy.dk"
      data_name     = "_xmpp-server._tcp"
      data_priority = 20
      data_target   = "xmpp-server2.l.google.com"
    },
    {
      zone          = "daniboy.dk"
      data_name     = "_xmpp-server._tcp"
      data_priority = 20
      data_target   = "xmpp-server3.l.google.com"
    },
    {
      zone          = "daniboy.dk"
      data_name     = "_xmpp-server._tcp"
      data_priority = 20
      data_target   = "xmpp-server4.l.google.com"
    },
    {
      zone          = "daniboy.dk"
      data_name     = "_jabber._tcp"
      data_priority = 5
      data_target   = "xmpp-server.l.google.com"
    },
    {
      zone          = "daniboy.dk"
      data_name     = "_jabber._tcp"
      data_priority = 20
      data_target   = "xmpp-server1.l.google.com"
    },
    {
      zone          = "daniboy.dk"
      data_name     = "_jabber._tcp"
      data_priority = 20
      data_target   = "xmpp-server2.l.google.com"
    },
    {
      zone          = "daniboy.dk"
      data_name     = "_jabber._tcp"
      data_priority = 20
      data_target   = "xmpp-server3.l.google.com"
    },
    {
      zone          = "daniboy.dk"
      data_name     = "_jabber._tcp"
      data_priority = 20
      data_target   = "xmpp-server4.l.google.com"
    }
  ]

}

resource "cloudflare_zone" "zones" {
  for_each = {
    #for name in local.zones : name.name => name
    for zone in local.zones : zone.zone => zone
  }

  #account = {
  #  id = "1cb328fc2007a477b2baf8e7fd6c1ee3"
  #}
  #name = each.value.name
  name = each.value.zone
  account = {
      id = "1cb328fc2007a477b2baf8e7fd6c1ee3"
    }
  #paused = false
  #Setting plan to free gives http 403 error.
  #plan = "free"
  type = "full"
}

# dhjensen.dk ALIAS dhjensen.netlify.app.
resource "cloudflare_dns_record" "cname_a_records" {
  for_each = {
    for record in local.cname_a_records : "${record.zone}.${record.name}.${record.value}" => record
  }

  zone_id = cloudflare_zone.zones[each.value.zone].id
  type    = each.value.type
  name    = each.value.name
  content = each.value.value
  proxied = each.value.proxied
  ttl     = 1

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

# _xmpp-server._tcp 43200 IN SRV 5 0 5269 xmpp-server.l.google.com.
# The following gives this error when used: Error: expected DNS record to not already be present but already exists
# resource "cloudflare_record" "srv_records" {
#  for_each = {
#    for record in local.srv_records : "${record.zone}.${record.data_name}.${record.data_target}" => record
#  }
#
#  zone_id   = cloudflare_zone.zones[each.value.zone].id
#  type      = "SRV"
#  name      = "@"
#  proxied   = false
#
#  data {
#    service  = "_sip"
#    proto    = "_tls"
#    name     = each.value.data_name
#    priority = each.value.data_priority
#    weight   = 0
#    port     = 5269
#    target   = each.value.data_target
#  }
# }

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
