resource "digitalocean_ssh_key" "ondrejsika_prod" {
  provider = digitalocean.prod

  name       = "ondrejsika"
  public_key = file("./ssh/ondrejsika.pub")
}
