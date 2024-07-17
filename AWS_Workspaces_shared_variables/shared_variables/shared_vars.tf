locals {
  env = terraform.workspace

  env_amiid = {
    dev    = "ami-011c99152163a87ae"
    production = "ami-06a0b4e3b7eb7a300"
  }

  amiid = lookup(local.env_amiid, local.env)
}

output "workspace_name" {
  value = local.env
}

output "amiID"{
value = local.amiid
}