resource "rancher2_cluster_template" "default" {
  name = "default"
  template_revisions {
    name = "v1"
    cluster_config {
      rke_config {
        network {
          plugin = "canal"
        }
        ingress {
          provider = "none"
        }
      }
    }
    default = true
  }
}
