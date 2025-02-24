terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0" # or "latest" or a more recent version.
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.30"
    }
  }
}
provider "google" {
  project = var.project_id
  region  = var.region
  user_project_override = true 
  billing_project = var.project_id // The project used for quota
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

module "storage" {
  source      = "./modules/storage"
  bucket_name = var.bucket_name
  region      = var.region
}

module "cloud_run" {
  source          = "./modules/cloud_run"
  service_name    = var.service_name
  image           = var.image
  region          = var.region
  project_id      = var.project_id
  bucket_name     = module.storage.bucket_name

}

module "iam" {
  source             = "./modules/iam"
  project_id         = var.project_id
  service_account_id = var.service_account_id
  bucket_name        = module.storage.bucket_name
}

module "vertex_ai" {
  source          = "./modules/vertex_ai"
  project_id      = var.project_id
  region          = var.region
  data_store_name = var.data_store_name
  collection_id   = var.collection_id
}