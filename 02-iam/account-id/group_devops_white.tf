############## DevOps Group ##################
resource "aws_iam_group" "account_devops_white" {
  name = "account_devops_white"
}

resource "aws_iam_group_membership" "account_devops_white" {
  name = aws_iam_group.account_devops_white.name

  users = [
    aws_iam_user.readonly_account.name,
  ]

  group = aws_iam_group.account_devops_white.name
}

#######################################################

##################  DevOps users ######################

resource "aws_iam_user" "readonly_account" {
  name = "readonly@art.com" # Edit this value to the username you want to use 
}

#######################################################

############### DevOps Basic Policy ##################
######################################################

########### DevOps Assume Policies ####################
resource "aws_iam_group_policy_attachment" "group_devops_white" {
  count      = length(var.assume_policy_group_devops_white)
  group      = aws_iam_group.group_devops_white.name
  policy_arn = var.assume_policy_group_devops_white[count.index]
}

variable "assume_policy_group_devops_white" {
  description = "IAM Policy to be attached to user"
  type        = list(string)

  default = [
    # Please change <account_id> to the real account id number of id account 
    "arn:aws:iam::<account_id>:policy/assume-policy-prod-readonly-policy", # Add readonly policy to while group user
  ]
}

#######################################################


############### MFA Manager ###########################
resource "aws_iam_group_policy_attachment" "group_devops_white_rotatekeys" {
  group      = aws_iam_group.group_devops_white.name
  policy_arn = aws_iam_policy.RotateKeys.arn
}

resource "aws_iam_group_policy_attachment" "group_devops_white_selfmanagemfa" {
  group      = aws_iam_group.group_devops_white.name
  policy_arn = aws_iam_policy.SelfManageMFA.arn
}

resource "aws_iam_group_policy_attachment" "group_devops_white_forcemfa" {
  group      = aws_iam_group.group_devops_white.name
  policy_arn = aws_iam_policy.ForceMFA.arn
}

#######################################################

