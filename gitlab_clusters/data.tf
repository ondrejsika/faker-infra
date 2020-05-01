variable "faker_app_project_id" {}

data "gitlab_group" "faker" {
  full_path = "faker"
}

data "rancher2_cluster" "prod" {
  name = "prod"
}

