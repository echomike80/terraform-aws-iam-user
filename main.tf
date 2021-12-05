resource "aws_iam_user" "this" {
  count         = var.create_user ? 1 : 0
  name          = var.username_prefix != null ? format("%s-%s", var.username_prefix, var.name) : var.name
}

resource "aws_iam_policy" "this" {
  count         = var.create_user && length(var.policy_jsons) > 0 ? 1 : 0
  name          = var.policy_name_prefix != null ? format("%s-%s", var.policy_name_prefix, var.name) : var.name
  description   = var.policy_description
  path          = var.policy_path
  policy        = element(var.policy_jsons, count.index)
}

resource "aws_iam_user_policy_attachment" "this" {
  count         = var.create_user && length(var.policy_jsons) > 0 ? 1 : 0
  user          = aws_iam_user.this[0].name
  policy_arn    = aws_iam_policy.this[0].arn
}