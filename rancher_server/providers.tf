variable "cloudflare_prod_email" {}
variable "cloudflare_prod_token" {}

variable "digitalocean_prod_token" {}

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
