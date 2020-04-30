resource "rancher2_cluster" "dev" {
  name = "dev"
  cluster_template_id = data.rancher2_cluster_template.default.id
  cluster_template_revision_id = data.rancher2_cluster_template.default.template_revisions.0.id
}

resource "rancher2_node_pool" "dev" {
  cluster_id =  rancher2_cluster.dev.id
  name = "dev"
  hostname_prefix =  "dev"
  node_template_id = data.rancher2_node_template.do-dev-2vcpu-4gb.id
  quantity = 1
  control_plane = true
  etcd = true
  worker = true
}
