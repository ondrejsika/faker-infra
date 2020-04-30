resource "tfe_organization" "faker" {
  name  = "faker"
  email = "accounts-infra@fakerco.cz"
}

resource "tfe_workspace" "core" {
  organization = tfe_organization.faker.name
  name         = "core"
  operations   = false
}

resource "tfe_workspace" "gitlab_server" {
  organization = tfe_organization.faker.name
  name         = "gitlab_server"
  operations   = false
}

resource "tfe_workspace" "gitlab" {
  organization = tfe_organization.faker.name
  name         = "gitlab"
  operations   = false
}

resource "tfe_workspace" "gitlab_runners" {
  organization = tfe_organization.faker.name
  name         = "runners"
  operations   = false
}

resource "tfe_workspace" "racher_server" {
  organization = tfe_organization.faker.name
  name         = "rancher_server"
  operations   = false
}

resource "tfe_workspace" "racher_bootstrap" {
  organization = tfe_organization.faker.name
  name         = "rancher_bootstrap"
  operations   = false
}

resource "tfe_workspace" "racher" {
  organization = tfe_organization.faker.name
  name         = "rancher"
  operations   = false
}

resource "tfe_workspace" "clusters" {
  organization = tfe_organization.faker.name
  name         = "clusters"
  operations   = false
}
