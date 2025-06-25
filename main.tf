provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "my-bucket" {
    bucket="gvg.s3.bucket"

}
resource "aws_s3_bucket_versioning" "bucket-version"{
    bucket = aws_s3_bucket.my-bucket.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_instance" "my-instance" {
  tags = {
    Name= "Terraform-Ec2"
  }
  ami = "ami-000ec6c25978d5999"
  instance_type = "t2.micro"
  key_name = "keypairgvg"
  availability_zone = "us-east-1a"
  root_block_device{        // this is for os including,, ebs is used  for additional volume to add to instance
    volume_size = 10
  } 
  count=1
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_size = 12
  }
}