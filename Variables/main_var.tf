// Below resource access the filename, string and number variables from variables.tf
resource "local_file" "NameDisplay" {
  filename = var.filename["filename"]
  content = "Hey, ${var.name}!! You are coming here for the ${var.number1}th time."
}

// Below resource access the filelist variable from variables.tf type = MAP
resource "local_file" "Maps1"{
  filename = var.filelist["file1"]
  content = "Welcome to the maps type variable ${var.StringT}!!"
}

// Below resource access the filelist variable from variables.tf type = MAP
resource "local_file" "Maps2" {
  filename = var.filelist["file2"]
  content = "Welcome to the second maps file. And the boolean value is set to ${var.True_False}"
  file_permission = "0755"
}

// We will pass the input through coomand line for the below output terraform apply -var "StringT = Ziya"
output "StringTest"{
  value = var.StringT
}

//Outputs the file permission of the file created in resource 3
output "fileperm_Maps2" {
  value = local_file.Maps2.file_permission
}

// New resource for creating a locl file and appening the content required

resource "local_file" "ListOfStrings" {
  filename = "./Outputs/ListOfStrings.txt"
  content = "${var.StringSet[0]} and ${var.StringSet[1]}, always keep ${var.StringSet[2]}!!"
}

// Multi string variable

resource "local_file" "MultiVar" {
  filename = "./Outputs/multivar.txt"
  content = var.multiVar
}