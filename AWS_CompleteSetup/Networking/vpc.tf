// Creating a VPC

locals {
  env = terraform.workspace
}

resource "aws_vpc" "NewVpc" {
  cidr_block = "172.31.0.0/16"
  tags = {
    Name = local.env
  }
}

output "vpcid" {
  value = aws_vpc.NewVpc.id
}