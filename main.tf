module "iam_user" {
  source = "./module/IAM"

  user_name        = "peter"
  path             = "/system/"
  tags             = { Environment = "Dev" }
  policy_actions   = ["s3:ListBucket", "s3:GetObject"]
  policy_resources = ["arn:aws:s3:::example-bucket", "arn:aws:s3:::example-bucket/*"]
  policy_name      = "example-user-policy"
  create_access_key = true
}

module "s3_bucket" {
  source = "./Module/s3"

  bucket_name = "my-unique-bucket-name-123456141125"
}

module "ec2_instances" {
  source = "./Module/ec2"

  ami           = "ami-07eb36e50da2fcccd"
  instance_type = "t3.micro"
}
