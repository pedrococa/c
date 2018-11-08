provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "example" {
  ami = "ami-034ffcb87502ccc08"
  instance_type = "t2.micro"
  count = 2
}
