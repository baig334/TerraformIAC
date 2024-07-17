module "sample_module" {
  source = "./local_module"
  fname = "module3.txt"
}

module "fileExtend" {
  source = "./local_m2"
  fname = "module4.txt"
}

output "filePerm" {
  value = module.sample_module.name
}

output "filePerm2" {
  value = module.fileExtend.name
}