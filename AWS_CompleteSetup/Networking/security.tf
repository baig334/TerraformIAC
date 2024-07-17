// Create security groups for private and public subnets
module "shared_vars" {
  source = "../shared_variables"
}

resource "aws_security_group" "public" {
   name = "Public_${module.shared_vars.workspace_name}"
  vpc_id = module.shared_vars.vpcid
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Ingress value"
    from_port = 80
    protocol = "tcp"
    to_port = 80
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Egress value"
    from_port = 80
    protocol = "tcp"
    to_port = 80
  }
}

resource "aws_security_group" "private" {
   name = "Private_${module.shared_vars.workspace_name}"
  vpc_id = module.shared_vars.vpcid
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Ingress value"
    from_port = 80
    protocol = "tcp"
    to_port = 80
    security_groups = ["${aws_security_group.public.id}"]
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Egress value"
    from_port = 80
    protocol = "tcp"
    to_port = 80
  }
}
