// Multi modules code
provider "aws" {
    region = "*******"
    access_key = "*******"
    secret_key = "*******"
}


module "sggroup" {
  source = "./security_module"
}

module "ec2group1" {
  source = "./ec2_module"
  sgname = module.sggroup.sgroupid
}

// Re-using the module
module "ec2group2" {
  source = "./ec2_module"
  sgname = "Ec2_module2"
}