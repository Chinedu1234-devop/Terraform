variable "user_name" {
	description = "Name of the IAM user to create"
	type        = string
}

variable "policy_name" {
	description = "Name for the IAM policy (falls back to '<user_name>-policy' when empty)"
	type        = string
	default     = ""
}

variable "policy_actions" {
	description = "List of IAM policy actions to allow"
	type        = list(string)
	default     = ["s3:*"]
}

variable "policy_resources" {
	description = "List of resources for the policy"
	type        = list(string)
	default     = ["*"]
}

variable "create_access_key" {
	description = "Whether to create an access key for the user"
	type        = bool
	default     = false
}

variable "path" {
	description = "Path for the IAM user"
	type        = string
	default     = "/"
}

variable "tags" {
	description = "Tags to add to the user"
	type        = map(string)
	default     = {}
}

