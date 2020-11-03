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
}

resource "cloudflare_zone" "zones" {
  for_each = {
    for zone in local.zones : zone.zone => zone
  }

  zone = each.value.zone
  paused = true
  #Setting plan to free gives http 403 error.
  #plan = "free"
  type = "full"
  jump_start = each.value.jump_start
}

# dhjensen.dk ALIAS dhjensen.netlify.app.
resource "cloudflare_record" "dhjensen_cname" {
  zone_id = cloudflare_zone.zones["dhjensen.dk"].id
  type = "CNAME"
  name = "dhjensen.dk"
  value = "dhjensen.netlify.app"
  proxied = false
}

