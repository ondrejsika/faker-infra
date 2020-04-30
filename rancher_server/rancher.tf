resource "digitalocean_droplet" "rancher" {
  provider = digitalocean.prod

  image    = "rancheros"
  name     = "rancher"
  region   = "fra1"
  size     = "s-4vcpu-8gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ondrejsika_prod.id
  ]
}

resource "cloudflare_record" "rancher" {
  provider = cloudflare.prod

  domain = "fakerco.cz"
  name   = "rancher"
  value  = digitalocean_droplet.rancher.ipv4_address
  type   = "A"
  proxied = false
}

resource "null_resource" "rancher" {
  triggers = {
    ip = digitalocean_droplet.rancher.ipv4_address
    domain = cloudflare_record.rancher.hostname
  }

  connection {
    type = "ssh"
    host = digitalocean_droplet.rancher.ipv4_address
    user = "rancher"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 60",
      "docker pull -q rancher/rancher:latest",
      "docker run --name rancher -d --restart=always -p 80:80 -p 443:443 rancher/rancher:latest --acme-domain ${cloudflare_record.rancher.hostname}",
    ]
  }
}

output "rancher_domain" {
  value = cloudflare_record.rancher.hostname
}

output "rancher_api_url" {
  value = "https://${cloudflare_record.rancher.hostname}"
}
