terraform {
  required_version = ">= 0.13"
}

module "shared_var"{
  source = "../shared_variables"
}

resource "aws_instance" "name" {
  ami = module.shared_var.amiID
  instance_type = "t2.micro"
  //security_group = ["${var.sgid}"]
  //vpc_security_group_ids = ["var.sgid"]
  tags = {
      Name = "${module.shared_var.workspace_name}"
  }
}