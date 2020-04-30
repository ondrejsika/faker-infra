resource "rancher2_node_template" "do-prod-2vcpu-4gb" {
  name = "do-prod-2vcpu-4gb"
  cloud_credential_id = rancher2_cloud_credential.do-prod.id
  digitalocean_config {
    image = "rancheros"
    region = "fra1"
    size = "s-2vcpu-4gb"
    ssh_user = "rancher"
  }
}

resource "rancher2_node_template" "do-prod-4vcpu-8gb" {
  name = "do-prod-4vcpu-8gb"
  cloud_credential_id = rancher2_cloud_credential.do-prod.id
  digitalocean_config {
    image = "rancheros"
    region = "fra1"
    size = "s-4vcpu-8gb"
    ssh_user = "rancher"
  }
}

resource "rancher2_node_template" "do-dev-2vcpu-4gb" {
  name = "do-dev-2vcpu-4gb"
  cloud_credential_id = rancher2_cloud_credential.do-dev.id
  digitalocean_config {
    image = "rancheros"
    region = "fra1"
    size = "s-2vcpu-4gb"
    ssh_user = "rancher"
  }
}

resource "rancher2_node_template" "do-dev-4vcpu-8gb" {
  name = "do-dev-4vcpu-8gb"
  cloud_credential_id = rancher2_cloud_credential.do-dev.id
  digitalocean_config {
    image = "rancheros"
    region = "fra1"
    size = "s-4vcpu-8gb"
    ssh_user = "rancher"
  }
}
