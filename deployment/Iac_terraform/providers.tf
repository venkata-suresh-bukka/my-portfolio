terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.34.0"
    }
  }
}

provider "google" {
  credentials = file("./lateral-berm.json")
  project     = var.project_id
}