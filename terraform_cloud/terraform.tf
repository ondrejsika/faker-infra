resource "tfe_organization" "faker" {
  name  = "faker"
  email = "accounts-infra@fakerco.cz"
}

resource "tfe_workspace" "core" {
  organization = tfe_organization.faker.name
  name         = "core"
  operations   = false
}

resource "tfe_workspace" "gitlab_vm" {
  organization = tfe_organization.faker.name
  name         = "gitlab_vm"
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
