variable "rancher_api_url" {}
variable "rancher_token_key" {}

variable "cloudflare_prod_email" {}
variable "cloudflare_prod_token" {}

variable "digitalocean_prod_token" {}

provider "rancher2" {
  api_url = var.rancher_api_url
  token_key = var.rancher_token_key
}

provider "cloudflare" {
  version = "~> 1.0"
  alias = "prod"

  email = var.cloudflare_prod_email
  token = var.cloudflare_prod_token
}

provider "digitalocean" {
  alias = "prod"

  token = var.digitalocean_prod_token
}
