// BEGIN ZONE fakerdev.cz

resource "cloudflare_zone" "fakerdev_cz" {
  provider = cloudflare.dev

  zone = "fakerdev.cz"
}

// END ZONE fakerdev.cz
