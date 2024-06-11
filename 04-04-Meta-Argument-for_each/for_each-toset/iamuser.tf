# Create 4 IAM Users
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user

resource "aws_iam_user" "user-name" {
  for_each = toset(["ram", "bheem", "Arjun", "Dharma"])
  name = each.key
  tags = {
    tag-key = each.key
  }
}
