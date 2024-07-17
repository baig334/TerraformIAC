terraform {
  required_version = ">= 0.13"
}


variable "sgname" {
  type = string
}

resource "aws_instance" "name" {
   ami = "ami-011c99152163a87ae"
  instance_type = "t2.micro"
  tags = {
      Name = var.sgname
  }
}