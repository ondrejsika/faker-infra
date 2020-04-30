variable "gitlab_token" {}
variable "gitlab_base_url" {}

provider "gitlab" {
    token = var.gitlab_token
    base_url = "${var.gitlab_base_url}/api/v4/"
}
