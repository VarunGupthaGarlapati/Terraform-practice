provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "my-bucket" {
    bucket="gvg.s3.bucket"

}
resource "aws_s3_bucket_versioning" "bucket-versio"{
    bucket = aws_s3_bucket.my-bucket.id
    versioning_configuration {
      status = "Enabled"
    }
}

