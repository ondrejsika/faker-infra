variable "cloudflare_prod_email" {}
variable "cloudflare_prod_token" {}

variable "digitalocean_prod_token" {}

variable "gitlab_token" {}
variable "gitlab_base_url" {}

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

provider "gitlab" {
    token = var.gitlab_token
    base_url = "${var.gitlab_base_url}/api/v4/"
}
