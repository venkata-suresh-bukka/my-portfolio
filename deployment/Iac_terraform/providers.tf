terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.34.0"
    }
  }

  backend "gcs" {
    bucket  = "gke-task-backend-tf"
    prefix  = "terraform-backend-state-files/"   
  }
}

provider "google" {
  credentials = file("./lateral-berm.json")
  project     = var.project_id
}