

# Create a GCS Bucket -- raw data
resource "google_storage_bucket" "poc_igti_btc_edc_enem_raw_data_001" {
    name = "poc_igti_btc_edc_enem_raw_data_001"
    location = var.region
}