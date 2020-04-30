resource "tfe_organization" "faker" {
  name  = "faker"
  email = "accounts-infra@fakerco.cz"
}

resource "tfe_workspace" "core" {
  organization = tfe_organization.faker.name
  name         = "core"
}

resource "tfe_workspace" "gitlab_vm" {
  organization = tfe_organization.faker.name
  name         = "gitlab_vm"
}
