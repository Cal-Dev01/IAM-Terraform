output "sysadmin_users" {
  value = aws_iam_user.sysadmin.*.name
}

output "dbwebadmin_users" {
  value = aws_iam_user.dbwebadmin.*.name
}

output "netadmin_users" {
  value = aws_iam_user.netadmin.*.name
}

output "itsupportadmin_users" {
  value = aws_iam_user.itsupportadmin.*.name
}

output "sysadmin_group" {
  value = aws_iam_group.sysadmin_group.name
}

output "dbwebadmin_group" {
  value = aws_iam_group.dbwebadmin_group.name
}

output "netadmin_group" {
  value = aws_iam_group.netadmin_group.name
}

output "itsupportadmin_group" {
  value = aws_iam_group.itsupportadmin_group.name
}

output "sysadmin_role" {
  value = aws_iam_role.sysadmin_role.name
}

output "dbwebadmin_role" {
  value = aws_iam_role.dbwebadmin_role.name
}

output "netadmin_role" {
  value = aws_iam_role.netadmin_role.name
}

output "itsupportadmin_role" {
  value = aws_iam_role.itsupportadmin_role.name
}
