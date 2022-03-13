

# Create a GCS Bucket -- raw data
resource "google_storage_bucket" "poc_igti_btc_edc_enem_raw_data_001" {
    name = "raw_data"
    location = var.region
}