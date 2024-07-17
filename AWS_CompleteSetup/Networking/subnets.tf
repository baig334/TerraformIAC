// Create public and private subnets

module "shared_vars1" {
  source = "../shared_variables"
}

resource "aws_subnet" "publicsb" {
  vpc_id     = module.shared_vars1.vpcid
  cidr_block = "172.31.64.0/20"
  tags = {
    "Name" = local.env
  }
}

resource "aws_subnet" "privatesb" {
  vpc_id     = module.shared_vars1.vpcid
  cidr_block = "172.31.128.0/20"
  tags = {
    "Name" = "Private_subnet_${local.env}"
  }
}

output "sgid1" {
  value = aws_subnet.publicsb.id
}

output "sgid2" {
  value = aws_subnet.privatesb.id
}