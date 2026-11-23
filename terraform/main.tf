# enable cloud api
resource "google_project_service" "apis" {
  for_each = toset([
    "storage.googleapis.com",
    "bigquery.googleapis.com"
  ])

    service = each.value

  disable_on_destroy = false
}

# Current project information to pull numeric project ID

data "google_project" "project" {}

#    Google storage account

##

##  create bucket

resource "google_storage_bucket" "uk_road_safety" {
  name     = "uk-road-safety-bucket"
  location = "europe-west2"
  force_destroy = true
  
  # retention_policy {
  #   retention_period = 777600
  #   is_locked = false
  # }

   uniform_bucket_level_access = true
}

## create raw folder
resource "google_storage_bucket_object" "raw" {
  name = "raw/"
  content = " "
  bucket = google_storage_bucket.uk_road_safety.name

  # retention {
  #   mode = "Unlocked"
  #   retain_until_time = 2026-21-30T23:59:59Z
  # }
}

## create lookup folder
resource "google_storage_bucket_object" "lookup_tables" {
  name = "lookup_tables/"
  content = " "
  bucket = google_storage_bucket.uk_road_safety.name
}

#   Create Datasets (Schemas)

resource "google_bigquery_dataset" "landing_layer" {
  dataset_id                  = "landing_layer"
  friendly_name               = "landing"
  description                 = "This dataset is the landing layer for the pipeline"
  location                    = "europe-west2"
  
}

resource "google_bigquery_dataset" "bronze_layer" {
  dataset_id                  = "staging_layer"
  friendly_name               = "staging"
  description                 = "This dataset is the staging layer for the pipeline"
  location                    = "europe-west2"
  delete_contents_on_destroy =  true
  
}

resource "google_bigquery_dataset" "silver_layer" {
  dataset_id                  = "intermediate_layer"
  friendly_name               = "intermediate"
  description                 = "This dataset is the intermediate layer for the pipeline"
  location                    = "europe-west2"
  
}

resource "google_bigquery_dataset" "intermediate_layer" {
  dataset_id                  = "mart_layer"
  friendly_name               = "mart"
  description                 = "This dataset is the mart layer for the pipeline"
  location                    = "europe-west2"
  
}


 resource "google_bigquery_table" "collision_table" {
  dataset_id = google_bigquery_dataset.landing_layer.dataset_id
  table_id   = "collision_data"
 
  deletion_protection = false

}

 resource "google_bigquery_table" "casualties_table" {
  dataset_id = google_bigquery_dataset.landing_layer.dataset_id
  table_id   = "casualties_data"
 
  deletion_protection = false

}


 resource "google_bigquery_table" "vehicle_table" {
  dataset_id = google_bigquery_dataset.landing_layer.dataset_id
  table_id   = "vehicle_data"
 
  deletion_protection = false

}