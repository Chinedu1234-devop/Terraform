resource "aws_instance" "main1" {
  ami           = var.ami
  instance_type = var.instance_type
vpc_security_group_ids = ["default"]
  tags = {
    Name = "main1"
  }
  
}