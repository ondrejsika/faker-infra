resource "rancher2_user" "ondrejsika" {
  name = "Ondrej Sika"
  username = "ondrejsika"
  password = "asdfasdf"
  enabled = true
}

resource "rancher2_global_role_binding" "ondrejsika" {
  name = "ondrejsika"
  global_role_id = "admin"
  user_id = rancher2_user.ondrejsika.id
}
