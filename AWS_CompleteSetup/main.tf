provider "aws" {
  region     = "*****"
  access_key = "*****"
  secret_key = "*****"
}

module "shared_vars" {
  source = "./shared_variables"
}

module "Networking" {
  source = "./Networking"
}