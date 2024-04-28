locals {
  files = {
    # resource_name = uid_of_resource
    "1-txt"  = "1.txt"
    "2-txt"  = "2.txt"
    "3-txt"  = "3.txt"
    "4-txt"  = "4.txt"
    "5-txt"  = "5.txt"
    "6-txt"  = "6.txt"
    "7-txt"  = "7.txt"
    "8-txt"  = "8.txt"
    "9-txt"  = "9.txt"
    "10-txt" = "10.txt"
  }
}

import {
  for_each = local.files
  to       = aws_s3_object.this[each.key]
  id       = "s3://terraform-learning-test-brodul/${each.value}"
}

data "aws_s3_bucket" "terraform-learning-test-brodul" {
  bucket = "terraform-learning-test-brodul"

}

resource "aws_s3_object" "this" {
  bucket = data.aws_s3_bucket.terraform-learning-test-brodul.id
  key    = each.value

  for_each = local.files
}
