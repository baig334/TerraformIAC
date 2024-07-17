// Using depends_on attribute for explicit dependency

resource "local_file" "dependency" {
  filename = "./Outputs/file1.txt"
  content = "This file depends on the file2.txt"
  depends_on = [
    local_file.dependency2
  ]
}

resource "local_file" "dependency2" {
  filename = "./Outputs/file2.txt"
  content = "This will be the first file created at ${time_static.timeNow.id}"
 // depends_on = [
   // time_sleep.sleepT
  //]
}

//resource "time_sleep" "sleepT" {
  //create_duration = "15s"
//}

//Adding lifecycle rule - Create before destroy

resource "local_file" "fileNew"{
  filename = "./Outputs/file2.txt"
  lifecycle {
    create_before_destroy = true
  }
}

//lifecycle rule - prevent destroy

resource "local_file" "ziya" {
  filename = "./Outputs/ziya.txt"
  content = "This is a lifecycle rule!!"
  lifecycle {
    prevent_destroy = true
  }
}

// Adding count

resource "local_file" "Count" {
  filename = "./Outputs/count.txt"
  count = 3
  content = "This has the files equal to no of counts!!"
}