resource "rancher2_token" "gitlab-prod" {
  cluster_id = data.rancher2_cluster.prod.id
}

resource gitlab_group_cluster "prod" {
  group = data.gitlab_group.faker.id
  name = "prod"
  domain = "prod.k8s.fakerco.cz"
  enabled = true
  managed = false
  kubernetes_api_url = "${var.rancher_api_url}/k8s/clusters/${data.rancher2_cluster.prod.id}"
  kubernetes_token = rancher2_token.gitlab-prod.token
  kubernetes_authorization_type = "rbac"
  environment_scope = "*"
}
