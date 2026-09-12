terraform {
  # CI configures bucket, region, and optional DynamoDB lock table with
  # `terraform init -backend-config=...`; do not hard-code environment details here.
  backend "s3" {}
}
