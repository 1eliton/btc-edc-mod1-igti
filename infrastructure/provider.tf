
provider "google" {
    region  = var.region
}

# set tfstate to GCS bucket
terraform {
  backend "gcs" {
    bucket = "poc-gcp-tf-files"
    prefix = "terraform.tfstate"
  }
}
