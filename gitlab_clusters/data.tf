variable "faker_app_project_id" {}

data "gitlab_project" "faker-app" {
  id = var.faker_app_project_id
}

data "gitlab_group" "faker" {
  full_path = "faker"
}

data "rancher2_cluster" "prod" {
  name = "prod"
}

data "rancher2_cluster" "dev" {
  name = "dev"
}
