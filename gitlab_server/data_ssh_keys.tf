data "digitalocean_ssh_key" "ondrejsika_prod" {
  provider = digitalocean.prod

  name = "ondrejsika"
}
