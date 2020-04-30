variable "cloudflare_prod_email" {}
variable "cloudflare_prod_token" {}

variable "cloudflare_dev_email" {}
variable "cloudflare_dev_token" {}


provider "cloudflare" {
  version = "~> 1.0"
  alias = "prod"

  email = var.cloudflare_prod_email
  token = var.cloudflare_prod_token
}

provider "cloudflare" {
  version = "~> 1.0"
  alias = "dev"

  email = var.cloudflare_dev_email
  token = var.cloudflare_dev_token
}
