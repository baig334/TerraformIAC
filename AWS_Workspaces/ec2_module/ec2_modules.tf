terraform {
  required_version = ">= 0.13"
}


variable "sgname" {
  type = string
}

variable "ami_id"{
  type = string
}

resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = "t2.micro"
  //security_group = ["${var.sgid}"]
  //vpc_security_group_ids = ["var.sgid"]
  tags = {
      Name = var.sgname
  }
}