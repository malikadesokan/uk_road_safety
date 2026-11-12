terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.34.0"
    }
  }

}

provider "google" {
    # Configuration details
  project     = "uk-road-safety-data-platform"
  region      = "europe-west2"
}