resource "gitlab_group" "faker" {
  name = "faker"
  path = "faker"
  visibility_level = "public"
}

output "runners_token" {
  value = gitlab_group.faker.runners_token
  sensitive = true
}
