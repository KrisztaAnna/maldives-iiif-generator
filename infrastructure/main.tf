provider "aws" {
  region  = var.region
  version = "~> 2.46"
}

terraform {
  backend "s3" {
    bucket = "ch-remote-state"
    key    = "maldives/terraform.tfstate"
    region = "eu-west-1"
  }
}

resource "aws_s3_bucket" "iiif_output" {
  bucket = "${var.prefix}-iiif-output"
  acl    = "public-read"

  tags = {
    Terraform = "true"
    Project   = "${var.project}"
  }
}