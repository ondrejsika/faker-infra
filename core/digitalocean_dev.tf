resource "digitalocean_ssh_key" "ondrejsika_dev" {
  provider = digitalocean.dev

  name       = "ondrejsika"
  public_key = file("./ssh/ondrejsika.pub")
}
