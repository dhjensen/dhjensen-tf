locals {
  pihole_a_records = [
    {
      name = "pi2.dhjensen.tech"
      value = "192.168.0.76"
    },
    {
      name = "daniel-pc.dhjensen.tech"
      value = "192.168.0.64"
    }
  ]

  pihole_cname_records = [
    {
      name = "beszel.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "npm.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "npm-pc.dhjensen.tech"
      cname = "daniel-pc.dhjensen.tech"
    },
    {
      name = "wg.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "wud.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "wud-pc.dhjensen.tech"
      cname = "daniel-pc.dhjensen.tech"
    },
    {
      name = "ntfy.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "maubot.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "cyberchef.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "ittools.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "dozzle.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "dozzle-pc.dhjensen.tech"
      cname = "daniel-pc.dhjensen.tech"
    },
    {
      name = "homarr.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "speedtest.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "rustdesk.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "duplicati.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "jellyfin.dhjensen.tech"
      cname = "daniel-pc.dhjensen.tech"
    },
    {
      name = "netbox.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "ombi.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "qb.dhjensen.tech"
      cname = "daniel-pc.dhjensen.tech"
    },
    {
      name = "jackett.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "radarr.dhjensen.tech"
      cname = "daniel-pc.dhjensen.tech"
    },
    {
      name = "sonarr.dhjensen.tech"
      cname = "daniel-pc.dhjensen.tech"
    },
    {
      name = "gitea.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "croc.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "pihole.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    }

  ]
}

resource "pihole_dns_record" "record" {
  for_each = {
    for record in local.pihole_a_records : "${record.name}.${record.value}" => record
  }
  domain = each.value.name
  ip     = each.value.value
}

resource "pihole_cname_record" "record" {
  for_each = {
    for record in local.pihole_cname_records : "${record.name}.${record.cname}" => record
  }
  domain      = each.value.name
  target      = each.value.cname
  depends_on  = [pihole_dns_record.record]
}
