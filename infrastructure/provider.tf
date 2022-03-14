
provider "google" {
    region  = var.region
}

# declare gcs as backend. it could be "local" for example
terraform {
  backend "gcs" {
    bucket = "poc-gcp-tf-files"
    prefix = "terraform.tfstate"
  }
}
