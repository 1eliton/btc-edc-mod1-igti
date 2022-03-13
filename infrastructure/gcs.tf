

# Create a GCS Bucket -- raw data
resource "google_storage_bucket" "poc_igti_enem_raw_data" {
    name = "raw_data"
    location = var.region
}