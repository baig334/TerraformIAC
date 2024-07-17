/* The below resource creates a local.txt file with the content as per the argument
Resource type used here is local_file */

resource "local_file" "test" {
  filename = "./Outputs/local.txt"
  content  = "Hey, Welcome to the resource type local_File!"
}


// Adding sensitive content so that it doesn't show output on the terminal and giving perimission to the file
// We cannot use content and sensitive content in the same resource
// directory_permission is the other argument left in the local_file provider

resource "local_file" "sensitive" {
  filename          = "./Outputs/sensitive_co.txt"
  file_permission   = "0755"
  sensitive_content = "Hey, Welcome to the sensitive content!"
}

// Adding another provider to verify that Terraform supports multi-provider

resource "random_pet" "pet_name" {
  length    = "2"
  separator = "."
  prefix    = "Mrs"
}

output "NameOfThePet" {
  value = random_pet.pet_name.id
}
// Adding the above result (Pet name) as content in the next resource

resource "local_file" "Create_file" {
  filename = "./Outputs/Multi.txt"
  content  = random_pet.pet_name.id
}


//Resource for using static time values - Time_static doesn't require any arguments and it takes the current time.

resource "time_static" "timeNow" {
  
}

output "currentTime" {
  value = time_static.timeNow
}

