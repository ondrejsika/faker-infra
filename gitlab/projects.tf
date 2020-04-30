resource "gitlab_project" "faker_app" {
  name = "faker-app"
  path = "faker-app"
  namespace_id = gitlab_group.faker.id
  visibility_level = "public"
}

resource "gitlab_project" "faker_infra" {
  name = "faker-infra"
  path = "faker-infra"
  namespace_id = gitlab_group.faker.id
  visibility_level = "public"
}
