terraform {
  required_version = ">= 0.12"
}

resource "local_file" "file" {
  filename = "./outputs/${var.fname}"
  content = "This is the sample file for module and creates a file with file name ${var.fname}!!"
}

