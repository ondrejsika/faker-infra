variable "rancher_api_url" {}

provider "rancher2" {
  alias = "bootstrap"

  api_url   = var.rancher_api_url
  bootstrap = true
}
