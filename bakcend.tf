terraform {
  backend "s3" {
    bucket="gvg.s3.bucket"
    region="us-east-1"
    key="terraform/terraform.tfstate"   //this is the path in the bucket where do we need to store tfstatefile
  }
}