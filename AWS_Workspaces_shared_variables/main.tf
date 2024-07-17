
provider "aws" {
  region     = "******"
  access_key = "******"
  secret_key = "******"
}


module "sggroup" {
  source = "./security_module"
}

module "ec2_Instance" {
  source = "./ec2_module"
}


