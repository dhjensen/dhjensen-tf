locals {

  zones = [
    {
      zone        = "dhjensen.dk"
      jump_start  = false
    },
    {
      zone        = "daniboy.dk"
      jump_start  = false
    }
  ]

  cname_a_records = [
    {
      zone    = "dhjensen.dk"
      type    = "CNAME"
      name    = "dhjensen.dk"
      value   = "dhjensen.netlify.app"
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "CNAME"
      name    = "www"
      value   = "dhjensen.netlify.app"
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
    for zone in local.zones : zone.zone => zone
  }

  zone = each.value.zone
  paused = false
  #Setting plan to free gives http 403 error.
  #plan = "free"
  type = "full"
  jump_start = each.value.jump_start
}

# dhjensen.dk ALIAS dhjensen.netlify.app.
resource "cloudflare_record" "cname_a_records" {
  for_each = {
    for record in local.cname_a_records : "${record.zone}.${record.name}" => record
  }

  zone_id = cloudflare_zone.zones[each.value.zone].id
  type    = each.value.type
  name    = each.value.name
  value   = each.value.value
  proxied = each.value.proxied

}

resource "cloudflare_record" "mx_records" {
  for_each = {
    for record in local.mx_records : "${record.zone}.${record.value}" => record
  }

  zone_id   = cloudflare_zone.zones[each.value.zone].id
  type      = "MX"
  name      = each.value.zone
  value     = each.value.value
  priority  = each.value.priority
  proxied   = false
}

# _xmpp-server._tcp 43200 IN SRV 5 0 5269 xmpp-server.l.google.com.
resource "cloudflare_record" "srv_records" {
  for_each = {
    for record in local.srv_records : "${record.zone}.${record.data_name}.${record.data_target}" => record
  }

  zone_id   = cloudflare_zone.zones[each.value.zone].id
  type      = "SRV"
  name      = "@"

  data = {
    service  = "_sip"
    proto    = "_tls"
    name     = each.value.data_name
    priority = each.value.data_priority
    weight   = 0
    port     = 5269
    target   = each.value.data_target
  }

  proxied   = false
}

resource "cloudflare_page_rule" "daniboy_redirect" {
  zone_id = cloudflare_zone.zones["daniboy.dk"].id
  target = "*.daniboy.dk/*"
  actions {
    forwarding_url {
      status_code = 301
      url = "https://dhjensen.dk"
    }
  }
}