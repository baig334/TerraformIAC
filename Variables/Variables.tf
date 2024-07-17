variable "name"{
    type = string
    default = "Ziya"
}

variable "filename" {
  type = map
  default = {
      filename = "./Outputs/sampleOutput.txt"
  }
}

variable "number1" {
  type = number
  default = 5
}

variable "StringT" {
  default = ""
}

variable "filelist" {
  type = map
  default = {
    file1 = "./Outputs/file1.txt"
    file2 = "./Outputs/file2.txt"
  }
}

variable "True_False" {
  type = bool
  default = true
}

variable "StringSet" {
  type = list(string)
  default = [ "Ziya","Dhoni","Smiling" ]
}

variable "multiVar" {
  type = string
  default = <<EOF
This is multi line string.
And can be used mostly in case of writing userdata...
EOF
}