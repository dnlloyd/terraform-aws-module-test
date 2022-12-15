resource "aws_organizations_organizational_unit" "ou" {
  name      = "Parent-OU"
  parent_id = "r-t50w"
}

resource "aws_organizations_account" "account" {
  name  = "MyChildAccount"
  email = "dnlloyd@outlook.com"
  parent_id = aws_organizations_organizational_unit.ou.id
  close_on_deletion = true
}

output "accounts" {
  value = aws_organizations_organizational_unit.ou.accounts
}

output "accounts2" {
  value = [
    for a in aws_organizations_organizational_unit.ou.accounts : a.arn
  ]
}

output "arn" {
  value = aws_organizations_organizational_unit.ou.arn
}

output "id" {
  value = aws_organizations_organizational_unit.ou.id
}

output "tags_all" {
  value = aws_organizations_organizational_unit.ou.tags_all
}
