provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Define IAM Users
resource "aws_iam_user" "sysadmin" {
  count = 4
  name  = "SysAdmin${count.index + 1}User"
}

resource "aws_iam_user" "dbwebadmin" {
  count = 4
  name  = "DBWebAdmin${count.index + 1}User"
}

resource "aws_iam_user" "netadmin" {
  count = 4
  name  = "NetAdmin${count.index + 1}User"
}

resource "aws_iam_user" "itsupportadmin" {
  count = 4
  name  = "ITSupportAdmin${count.index + 1}User"
}

# Define IAM Groups
resource "aws_iam_group" "sysadmin_group" {
  name = "SysAdmins"
}

resource "aws_iam_group" "dbwebadmin_group" {
  name = "DBWebAdmins"
}

resource "aws_iam_group" "netadmin_group" {
  name = "NetAdmins"
}

resource "aws_iam_group" "itsupportadmin_group" {
  name = "ITSupportAdmins"
}

# Attach Users to Groups
resource "aws_iam_group_membership" "sysadmin_group_membership" {
  name  = "sysadmin-membership"
  users = aws_iam_user.sysadmin.*.name
  group = aws_iam_group.sysadmin_group.name
}

resource "aws_iam_group_membership" "dbwebadmin_group_membership" {
  name  = "dbwebadmin-membership"
  users = aws_iam_user.dbwebadmin.*.name
  group = aws_iam_group.dbwebadmin_group.name
}

resource "aws_iam_group_membership" "netadmin_group_membership" {
  name  = "netadmin-membership"
  users = aws_iam_user.netadmin.*.name
  group = aws_iam_group.netadmin_group.name
}

resource "aws_iam_group_membership" "itsupportadmin_group_membership" {
  name  = "itsupportadmin-membership"
  users = aws_iam_user.itsupportadmin.*.name
  group = aws_iam_group.itsupportadmin_group.name
}

# Define IAM Policies
resource "aws_iam_policy" "sysadmin_policy" {
  name        = "SysAdminPolicy"
  description = "Policy for System Administrators"
  policy      = data.aws_iam_policy_document.sysadmin_policy.json
}

resource "aws_iam_policy" "dbwebadmin_policy" {
  name        = "DBWebAdminPolicy"
  description = "Policy for Database/Web Administrators"
  policy      = data.aws_iam_policy_document.dbwebadmin_policy.json
}

resource "aws_iam_policy" "netadmin_policy" {
  name        = "NetAdminPolicy"
  description = "Policy for Network Administrators"
  policy      = data.aws_iam_policy_document.netadmin_policy.json
}

resource "aws_iam_policy" "itsupportadmin_policy" {
  name        = "ITSupportAdminPolicy"
  description = "Policy for IT Support Administrators"
  policy      = data.aws_iam_policy_document.itsupportadmin_policy.json
}

# IAM Policy Documents
data "aws_iam_policy_document" "sysadmin_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "dbwebadmin_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "netadmin_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "itsupportadmin_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

# Attach Policies to Groups
resource "aws_iam_group_policy_attachment" "sysadmin_group_policy_attachment" {
  group      = aws_iam_group.sysadmin_group.name
  policy_arn = aws_iam_policy.sysadmin_policy.arn
}

resource "aws_iam_group_policy_attachment" "dbwebadmin_group_policy_attachment" {
  group      = aws_iam_group.dbwebadmin_group.name
  policy_arn = aws_iam_policy.dbwebadmin_policy.arn
}

resource "aws_iam_group_policy_attachment" "netadmin_group_policy_attachment" {
  group      = aws_iam_group.netadmin_group.name
  policy_arn = aws_iam_policy.netadmin_policy.arn
}

resource "aws_iam_group_policy_attachment" "itsupportadmin_group_policy_attachment" {
  group      = aws_iam_group.itsupportadmin_group.name
  policy_arn = aws_iam_policy.itsupportadmin_policy.arn
}

# Define IAM Roles
resource "aws_iam_role" "sysadmin_role" {
  name               = "SysAdminRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role" "dbwebadmin_role" {
  name               = "DBWebAdminRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role" "netadmin_role" {
  name               = "NetAdminRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role" "itsupportadmin_role" {
  name               = "ITSupportAdminRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

# Assume Role Policy Document
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Attach Policies to Roles
resource "aws_iam_role_policy_attachment" "sysadmin_role_policy_attachment" {
  role       = aws_iam_role.sysadmin_role.name
  policy_arn = aws_iam_policy.sysadmin_policy.arn
}

resource "aws_iam_role_policy_attachment" "dbwebadmin_role_policy_attachment" {
  role       = aws_iam_role.dbwebadmin_role.name
  policy_arn = aws_iam_policy.dbwebadmin_policy.arn
}

resource "aws_iam_role_policy_attachment" "netadmin_role_policy_attachment" {
  role       = aws_iam_role.netadmin_role.name
  policy_arn = aws_iam_policy.netadmin_policy.arn
}

resource "aws_iam_role_policy_attachment" "itsupportadmin_role_policy_attachment" {
  role       = aws_iam_role.itsupportadmin_role.name
  policy_arn = aws_iam_policy.itsupportadmin_policy.arn
}
