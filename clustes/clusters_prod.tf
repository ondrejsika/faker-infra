resource "rancher2_cluster" "prod" {
  name = "prod"
  cluster_template_id = data.rancher2_cluster_template.default.id
  cluster_template_revision_id = data.rancher2_cluster_template.default.template_revisions.0.id
}

resource "rancher2_node_pool" "prod" {
  cluster_id =  rancher2_cluster.prod.id
  name = "prod"
  hostname_prefix =  "prod"
  node_template_id = data.rancher2_node_template.do-prod-2vcpu-4gb.id
  quantity = 1
  control_plane = true
  etcd = true
  worker = true
}
