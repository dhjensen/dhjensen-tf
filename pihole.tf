locals {
  pihole_a_records = [
    {
      name = "pi2.dhjensen.tech"
      value = "192.168.86.22"
    },
    {
      name = "daniel-pc.dhjensen.tech"
      value = "192.168.86.21"
    },
    {
      name = "mini.dhjensen.tech"
      value = "192.168.86.120"
    }
  ]

  pihole_cname_records = [
    {
      name = "beszel.dhjensen.tech"
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
      name = "homarr.dhjensen.tech"
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
      cname = "mini.dhjensen.tech"
    },
    {
      name = "netbox.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "qb.dhjensen.tech"
      cname = "mini.dhjensen.tech"
    },
    {
      name = "jackett.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "radarr.dhjensen.tech"
      cname = "mini.dhjensen.tech"
    },
    {
      name = "sonarr.dhjensen.tech"
      cname = "mini.dhjensen.tech"
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
    },
    {
      name = "duplicati-pc.dhjensen.tech"
      cname = "daniel-pc.dhjensen.tech"
    },
    {
      name = "traefik-pc.dhjensen.tech"
      cname = "daniel-pc.dhjensen.tech"
    },
    {
      name = "traefik.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "infisical.dhjensen.tech"
      cname = "pi2.dhjensen.tech"
    },
    {
      name = "seerr.dhjensen.tech"
      cname = "mini.dhjensen.tech"
    },
    {
      name = "traefik-mini.dhjensen.tech"
      cname = "mini.dhjensen.tech"
    },
    {
      name = "wud-mini.dhjensen.tech"
      cname = "mini.dhjensen.tech"
    },
    {
      name = "duplicati-mini.dhjensen.tech"
      cname = "mini.dhjensen.tech"
    },
    {
      name = "uk.dhjensen.tech"
      cname = "mini.dhjensen.tech"
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
