terraform {
  required_version = ">= 0.13"
}

variable "vpcID" {
  type = string
  default = "vpc-58b34733"
}

module "shared_var" {
  source = "../shared_variables"
}

resource "aws_security_group" "sg_module" {
  name = module.shared_var.workspace_name
  vpc_id = var.vpcID
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Ingress value"
    from_port = 22
    protocol = "tcp"
    to_port = 22
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Ingress value"
    from_port = 22
    protocol = "tcp"
    to_port = 22
  }
}

output "sgroupid" {
  value = aws_security_group.sg_module.name
}