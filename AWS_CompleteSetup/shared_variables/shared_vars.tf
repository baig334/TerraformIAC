
locals {
    env = terraform.workspace

    vpcidNew = {
        default = "vpc-58b34733"
        dev = "vpc-58b34733"
        production = "vpc-58b34733"
    }

    vpcid = lookup(local.vpcidNew, local.env)

}

output "vpcid" {
  value = local.vpcid
}

output "workspace_name" {
  value = local.env
}