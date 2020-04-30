variable "runner_count" {
  default = 1
}

resource "digitalocean_droplet" "runner" {
  provider = digitalocean.prod
  count = var.runner_count

  image  = "rancheros"
  name   = "runner${count.index}"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ondrejsika_prod.id
  ]

  connection {
    type = "ssh"
    user = "rancher"
    host = digitalocean_droplet.runner[count.index].ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "docker run -d --name gitlab-runner --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /builds:/builds gitlab/gitlab-runner:latest",
      "docker exec gitlab-runner gitlab-runner register --non-interactive --url ${var.gitlab_base_url} --registration-token ${data.gitlab_group.faker.runners_token} --executor docker --docker-image docker:git --docker-volumes '/var/run/docker.sock:/var/run/docker.sock' --docker-volumes '/builds:/builds'"
    ]
  }
}

resource "cloudflare_record" "runner" {
  provider = cloudflare.prod
  count = var.runner_count

  domain = "fakerco.cz"
  name   = "runner${count.index}"
  value  = digitalocean_droplet.runner[count.index].ipv4_address
  type   = "A"
  proxied = false
}
