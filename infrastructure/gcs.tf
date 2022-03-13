

# Create a GCS Bucket -- raw data
resource "google_storage_bucket" "enem_staging" {
    name = "raw_data"
    location = var.region
}