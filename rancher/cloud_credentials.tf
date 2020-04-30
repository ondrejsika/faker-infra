variable "digitalocean_prod_token" {}
variable "digitalocean_dev_token" {}

resource "rancher2_cloud_credential" "do-prod" {
  name = "do-prod"
  digitalocean_credential_config {
    access_token  = var.digitalocean_prod_token
  }
}

resource "rancher2_cloud_credential" "do-dev" {
  name = "do-dev"
  digitalocean_credential_config {
    access_token  = var.digitalocean_dev_token
  }
}
