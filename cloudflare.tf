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

  cname_a_txt_records = [
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
      type    = "TXT"
      name    = "@"
      value   = "protonmail-verification=c98d9bbfeba5e00d61e16edfaa84b9a36bf6e565"
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "TXT"
      name    = "@"
      value   = "v=spf1 include:_spf.protonmail.ch ~all"
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "TXT"
      name    = "_dmarc"
      value   = "v=DMARC1; p=quarantine"
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
      type    = "TXT"
      name    = "@"
      value   = "protonmail-verification=322e4d97500ae13178e3aeafa5f9de4565d76b2e"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "TXT"
      name    = "@"
      value   = "v=spf1 include:_spf.protonmail.ch ~all"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "TXT"
      name    = "_dmarc"
      value   = "v=DMARC1; p=quarantine"
      proxied = "false"
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
      name    = "ntfy"
      value   = "instance001.dhjensen.tech"
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
    },
    {
      zone    = "dhjensen.tech"
      type    = "A"
      name    = "infisical"
      value   = "87.61.92.76"
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "CNAME"
      name    = "protonmail._domainkey"
      value   = "protonmail.domainkey.dsxjqdmj5xmixf6pjrf3dgeuz5knnis7bamn7alum2utzakeciufa.domains.proton.ch"
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "CNAME"
      name    = "protonmail2._domainkey"
      value   = "protonmail2.domainkey.dsxjqdmj5xmixf6pjrf3dgeuz5knnis7bamn7alum2utzakeciufa.domains.proton.ch"
      proxied = "false"
    },
    {
      zone    = "dhjensen.dk"
      type    = "CNAME"
      name    = "protonmail3._domainkey"
      value   = "protonmail3.domainkey.dsxjqdmj5xmixf6pjrf3dgeuz5knnis7bamn7alum2utzakeciufa.domains.proton.ch"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "protonmail._domainkey"
      value   = "protonmail.domainkey.dq4hqk5z5keqv2ovgcyoxjehwq2hlhitsu6u2446qo75fteyunrpa.domains.proton.ch"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "protonmail2._domainkey"
      value   = "protonmail2.domainkey.dq4hqk5z5keqv2ovgcyoxjehwq2hlhitsu6u2446qo75fteyunrpa.domains.proton.ch"
      proxied = "false"
    },
    {
      zone    = "dhjensen.tech"
      type    = "CNAME"
      name    = "protonmail3._domainkey"
      value   = "protonmail3.domainkey.dq4hqk5z5keqv2ovgcyoxjehwq2hlhitsu6u2446qo75fteyunrpa.domains.proton.ch"
      proxied = "false"
    }
    
  ]

  mx_records = [
    {
      zone      = "dhjensen.dk"
      value     = "mail.protonmail.ch"
      priority  = 10
    },
    {
      zone      = "dhjensen.dk"
      value     = "mailsec.protonmail.ch"
      priority  = 20
    },
    {
      zone      = "dhjensen.tech"
      value     = "mail.protonmail.ch"
      priority  = 10
    },
    {
      zone      = "dhjensen.tech"
      value     = "mailsec.protonmail.ch"
      priority  = 20
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
    for record in local.cname_a_txt_records : "${record.zone}.${record.name}.${record.value}" => record
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
