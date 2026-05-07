resource "google_cloud_identity_group_membership" "admins" {
  for_each = toset(var.andrew_ids.admins)

  group = var.google_group_id

  preferred_member_key {
    id = "${each.value}@andrew.cmu.edu"
  }

  roles {
    name = "MANAGER"
  }

  roles {
    name = "MEMBER"
  }
}
