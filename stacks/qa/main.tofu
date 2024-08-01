provider "aws" {
  region = "eu-west-1"
}

module "ec2" {
  source        = "github.com/saturnhead/tofu_18.git//modules/ec2?ref=ec2-${var.module_tag}"
  instance_type = "t2.micro"
  ami           = "ami-099a8245f5daa82bf"
}
