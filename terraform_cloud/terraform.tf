resource "tfe_organization" "faker" {
  name  = "faker"
  email = "accounts-infra@fakerco.cz"
}

resource "tfe_workspace" "core" {
  organization = tfe_organization.faker.name
  name         = "core"
}
