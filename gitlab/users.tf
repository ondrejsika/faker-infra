resource "gitlab_user" "ondrejsika" {
  name             = "Ondrej Sika"
  username         = "ondrejsika"
  password         = "asdfasdf"
  email            = "ondrej@fakerco.cz"
  is_admin         = true
}

resource "gitlab_group_membership" "faker_ondrejsika" {
  group_id     = gitlab_group.faker.id
  user_id      = gitlab_user.ondrejsika.id
  access_level = "owner"
}
