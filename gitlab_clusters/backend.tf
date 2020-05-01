terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "faker"
    workspaces {
      name = "gitlab_clusters"
    }
  }
}
