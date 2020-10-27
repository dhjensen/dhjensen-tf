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

# kd7dnyrjqqmy.dhjensen.dk	CNAME gv-laue62xky4xyhu.dv.googlehosted.com
# localhost.dhjensen.dk	127.0.0.1

# dhjensen.dk mx
# dhjensen.dk	aspmx.l.google.com 10	43200	
# dhjensen.dk	alt1.aspmx.l.google.com 20	43200	
# dhjensen.dk	alt2.aspmx.l.google.com 20	43200	
# dhjensen.dk	aspmx2.googlemail.com 30	43200	
# dhjensen.dk	aspmx3.googlemail.com 30	43200	
# dhjensen.dk	aspmx4.googlemail.com 30	43200	
# dhjensen.dk	aspmx5.googlemail.com 30	43200

# daniboy.dk cname
# aoc.daniboy.dk	ghs.google.com	43200	
# calendar.daniboy.dk	ghs.google.com	43200	
# docs.daniboy.dk	ghs.google.com	43200	
# ftp.daniboy.dk	router.daniboy.dk	43200	
# hat.daniboy.dk	ghs.google.com	43200	
# mail.daniboy.dk	ghs.google.com	43200	
# rsync.daniboy.dk	router.daniboy.dk	43200	
# sites.daniboy.dk	ghs.google.com	43200	
# skole.daniboy.dk	ghs.google.com	43200	
# www.daniboy.dk	ghs.google.com	43200	

# daniboy.dk mx
# daniboy.dk	aspmx.l.google.com 10	43200	
# daniboy.dk	alt1.aspmx.l.google.com 20	43200	
# daniboy.dk	alt2.aspmx.l.google.com 20	43200	
# daniboy.dk	aspmx2.googlemail.com 30	43200	
# daniboy.dk	aspmx3.googlemail.com 30	43200	
# daniboy.dk	aspmx4.googlemail.com 30	43200	
# daniboy.dk	aspmx5.googlemail.com 30	43200

# daniboy.dk srv
# _jabber._tcp.daniboy.dk	xmpp-server4.l.google.com	20	0	5269	43200	
# _jabber._tcp.daniboy.dk	xmpp-server3.l.google.com	20	0	5269	43200	
# _jabber._tcp.daniboy.dk	xmpp-server2.l.google.com	20	0	5269	43200	
# _jabber._tcp.daniboy.dk	xmpp-server1.l.google.com	20	0	5269	43200	
# _jabber._tcp.daniboy.dk	xmpp-server.l.google.com	5	0	5269	43200	
# _xmpp-server._tcp.daniboy.dk	xmpp-server4.l.google.com	20	0	5269	43200	
# _xmpp-server._tcp.daniboy.dk	xmpp-server3.l.google.com	20	0	5269	43200	
# _xmpp-server._tcp.daniboy.dk	xmpp-server2.l.google.com	20	0	5269	43200	
# _xmpp-server._tcp.daniboy.dk	xmpp-server1.l.google.com	20	0	5269	43200	
# _xmpp-server._tcp.daniboy.dk	xmpp-server.l.google.com	5	0	5269	43200	
