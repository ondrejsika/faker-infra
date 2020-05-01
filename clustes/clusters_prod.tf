resource "rancher2_cluster" "prod" {
  name = "prod"
  cluster_template_id = data.rancher2_cluster_template.default.id
  cluster_template_revision_id = data.rancher2_cluster_template.default.template_revisions.0.id
}

variable "node_count" {
  default = 3
}

resource "digitalocean_droplet" "node-prod" {
  provider = digitalocean.prod
  count = var.node_count

  image    = "rancheros"
  name     = "prod${count.index}.node"
  region   = "fra1"
  size     = "s-2vcpu-4gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ondrejsika_prod.id
  ]

  connection {
    type = "ssh"
    host = self.ipv4_address
    user = "rancher"
  }

  provisioner "remote-exec" {
    inline = [
      "${rancher2_cluster.prod.cluster_registration_token[0].node_command} --etcd --controlplane --worker",
    ]
  }
}

resource "cloudflare_record" "node-prod" {
  provider = cloudflare.prod
  count = var.node_count

  domain = "fakerco.cz"
  name   = "${digitalocean_droplet.node-prod[count.index].name}.node"
  value  = digitalocean_droplet.node-prod[count.index].ipv4_address
  type   = "A"
  proxied = false
}

resource "digitalocean_loadbalancer" "prod" {
  provider = digitalocean.prod

  name = "prod"
  region = "fra1"

  droplet_ids = [
    for i in range(var.node_count):
    digitalocean_droplet.node-prod[i].id
  ]
  healthcheck {
    port = 30001
    protocol = "tcp"
  }

  forwarding_rule {
    entry_port  = 80
    target_port = 30001
    entry_protocol = "tcp"
    target_protocol = "tcp"
  }

  forwarding_rule {
    entry_port  = 443
    target_port = 30002
    entry_protocol = "tcp"
    target_protocol = "tcp"
  }

  forwarding_rule {
    entry_port  = 8080
    target_port = 30003
    entry_protocol = "tcp"
    target_protocol = "tcp"
  }
}


resource "cloudflare_record" "prod" {
  provider = cloudflare.prod

  domain = "fakerco.cz"
  name   = "prod.k8s"
  value  = digitalocean_loadbalancer.prod.ip
  type   = "A"
  proxied = false
}

resource "cloudflare_record" "prod_wildcard" {
  provider = cloudflare.prod

  domain = "fakerco.cz"
  name   = "*.${cloudflare_record.prod.name}"
  value  = cloudflare_record.prod.hostname
  type   = "CNAME"
  proxied = false
}
