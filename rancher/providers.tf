variable "rancher_api_url" {}
variable "rancher_token_key" {}

provider "rancher2" {
  api_url = var.rancher_api_url
  token_key = var.rancher_token_key
}
