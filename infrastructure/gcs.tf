
# Create a GCS Bucket
resource "google_storage_bucket" "enem_staging" {
    name = "enem/raw_data"
    location = var.region
}