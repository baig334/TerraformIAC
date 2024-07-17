terraform {
  required_version = ">= 0.13"
}

variable "vpcID" {
  type = string
  default = "vpc-58b34733"
}

resource "aws_security_group" "sg_module" {
  name = "sg_module"
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