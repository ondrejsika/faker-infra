// BEGIN ZONE fakermail.cz

resource "cloudflare_zone" "fakermail_cz" {
  provider = cloudflare.prod

  zone = "fakermail.cz"
}

// END ZONE fakermail.cz
