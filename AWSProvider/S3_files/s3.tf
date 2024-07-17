provider "aws"{
    access_key = "*******"
    secret_key = "*******"
    region = "*****"
}

// Creating bucket and uploading oject using resources

resource "aws_s3_bucket" "mybucketfirstbucket" {
  bucket = "mybucket-ziya-062821"
  acl = "private"
  tags = {
      Environment = "Test"
  }
}

resource "aws_s3_bucket_object" "sampleUpload" {
  bucket = aws_s3_bucket.mybucketfirstbucket.id
  acl = "private"
  key = "sample.txt"
  source = "../../AWS_connect_instructions.txt"
  etag = filemd5("../../AWS_connect_instructions.txt")
}

// Creation of bucket using module
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket-ziya-0628-21"
  acl    = "private"

  versioning = {
    enabled = true
  }

}