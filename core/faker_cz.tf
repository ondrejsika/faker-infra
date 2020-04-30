// BEGIN ZONE faker.cz

resource "cloudflare_zone" "faker_cz" {
  provider = cloudflare.prod

  zone = "faker.cz"
}

resource "cloudflare_record" "mx99_faker_cz" {
  provider = cloudflare.prod

  domain = cloudflare_zone.faker_cz.zone
  name    = "@"
  value   = "mail.oxs.cz"
  type    = "MX"
  priority = "99"
}

// END ZONE faker.cz
