variable "gitlab_token" {}
variable "gitlab_base_url" {}

variable "rancher_api_url" {}
variable "rancher_token_key" {}

provider "gitlab" {
    token = var.gitlab_token
    base_url = "${var.gitlab_base_url}/api/v4/"
}

provider "rancher2" {
  api_url = var.rancher_api_url
  token_key = var.rancher_token_key
}
