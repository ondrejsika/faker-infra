resource "digitalocean_droplet" "gitlab" {
  provider = digitalocean.prod

  image  = "debian-10-x64"
  name   = "gitlab"
  region = "fra1"
  size   = "s-2vcpu-4gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ondrejsika_prod.id
  ]

  connection {
    type = "ssh"
    user = "root"
    host = self.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "export DEBIAN_FRONTEND=noninteractive",
      "apt-get -qq update",
      "apt-get install -yqq sudo curl openssh-server ca-certificates",
      "curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash",
      "apt-get install gitlab-ee",
    ]
  }
}

resource "cloudflare_record" "gitlab" {
  provider = cloudflare.prod

  domain = "fakerco.cz"
  name   = "gitlab"
  value  = digitalocean_droplet.gitlab.ipv4_address
  type   = "A"
  proxied = false
}

resource "cloudflare_record" "registry" {
  provider = cloudflare.prod

  domain = "fakerco.cz"
  name   = "registry"
  value  = cloudflare_record.gitlab.hostname
  type   = "CNAME"
  proxied = false
}

resource "null_resource" "gitlab" {
  triggers = {
    ip = digitalocean_droplet.gitlab.ipv4_address
    gitlab = cloudflare_record.gitlab.hostname
    registry = cloudflare_record.registry.hostname
  }

  connection {
    type = "ssh"
    user = "root"
    host = digitalocean_droplet.gitlab.ipv4_address
  }

  provisioner "file" {
    source      = "gitlab.rb"
    destination = "/etc/gitlab/gitlab.rb"
  }

  provisioner "remote-exec" {
    inline = [
      "gitlab-ctl reconfigure",
    ]
  }
}
