// IAM user + policy module

resource "aws_iam_user" "this" {
	name = var.user_name
	path = var.path
	tags = var.tags
}

data "aws_iam_policy_document" "policy" {
	statement {
		sid    = "AllowActions"
		effect = "Allow"
		actions   = var.policy_actions
		resources = var.policy_resources
	}
}

resource "aws_iam_policy" "this" {
	name   = var.policy_name != "" ? var.policy_name : "${var.user_name}-policy"
	policy = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_user_policy_attachment" "attach" {
	user       = aws_iam_user.this.name
	policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_access_key" "this" {
	count = var.create_access_key ? 1 : 0
	user  = aws_iam_user.this.name
	depends_on = [aws_iam_user_policy_attachment.attach]
}

