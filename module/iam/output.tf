output "user_arn" {
	description = "ARN of the created IAM user"
	value       = aws_iam_user.this.arn
}

output "user_name" {
	description = "Name of the created IAM user"
	value       = aws_iam_user.this.name
}

output "policy_arn" {
	description = "ARN of the created IAM policy"
	value       = aws_iam_policy.this.arn
}

output "access_key_ids" {
	description = "List with the access key id(s) created for the user (empty if none)"
	value       = aws_iam_access_key.this[*].id
}

output "access_key_secrets" {
	description = "List with the secret access key(s) created for the user (empty if none) - treat secrets securely"
	value       = aws_iam_access_key.this[*].secret
	sensitive   = true
}

