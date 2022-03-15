
# SHOULD REVIEW
# https://towardsdatascience.com/deploy-cloud-functions-on-gcp-with-terraform-111a1c4a9a88
# https://console.cloud.google.com/home/activity?project=poc-gcp-340811

# Create a GCS Bucket -- raw data
resource "google_storage_bucket" "poc_igti_btc_edc_enem_raw_data_001" {
    name = "poc_igti_btc_edc_enem_raw_data_001"
    location = var.region
}

# Create a GCS Bucket -- delta table
# TODO: download a file from inep and upload on this bucket
resource "google_storage_bucket" "poc_igti_btc_edc_enem_delta_table_001" {
    name = "poc_igti_btc_edc_enem_delta_table_001"
    location = var.region
}

# Create a GCS Bucket for the Cloud Function
resource "google_storage_bucket" "function_bucket" {
    name = "poc_igti_btc_edc_enem_function_bucket"
    location = var.region
}