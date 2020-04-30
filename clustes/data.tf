data "rancher2_node_template" "do-prod-2vcpu-4gb" {
  name = "do-prod-2vcpu-4gb"
}

data "rancher2_node_template" "do-dev-2vcpu-4gb" {
  name = "do-dev-2vcpu-4gb"
}

data "rancher2_cluster_template" "default" {
  name = "default"
}
