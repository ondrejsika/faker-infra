variable "terraform_token" {}

provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.terraform_token
  version  = "~> 0.15.0"
}
