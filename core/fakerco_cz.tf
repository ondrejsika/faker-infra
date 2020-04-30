// BEGIN ZONE fakerco.cz

resource "cloudflare_zone" "fakerco_cz" {
  provider = cloudflare.prod

  zone = "fakerco.cz"
}

resource "cloudflare_record" "mx99_fakerco_cz" {
  provider = cloudflare.prod

  domain = cloudflare_zone.fakerco_cz.zone
  name    = "@"
  value   = "mail.oxs.cz"
  type    = "MX"
  priority = "99"
}

// END ZONE fakerco.cz
