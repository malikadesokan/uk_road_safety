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



# Google storage account

resource "google_storage_bucket" "uk_road_safety" {
  name     = "uk_road_safety_bucket"
  location = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_bigquery_dataset" "uk_road_safety_data" {
  dataset_id                  = "uk_road_safety_collision"
  friendly_name               = "collision"
  description                 = "This dataset contains the UK Road safety collision data"
  location                    = "europe-west2"
  default_table_expiration_ms = 3600000
}

resource "google_bigquery_table" "table" {
  dataset_id = google_bigquery_dataset.uk_road_safety_data.dataset_id
  table_id   = "collision_uk_road_safety"
 
  deletion_protection = false

}

resource "google_bigquery_table" "table" {
  dataset_id = google_bigquery_dataset.uk_road_safety_data.dataset_id
  table_id   = "vehicles_uk_road_safety"
 
  deletion_protection = false

}