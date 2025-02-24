variable "project_id" {
  description = "The ID of the project in which to create the resources."
  type        = string
}

variable "region" {
  description = "The region in which to create the resources."
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "The name of the Cloud Storage bucket."
  type        = string
}

variable "service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "image" {
  description = "The container image to deploy to Cloud Run."
  type        = string
}

variable "service_account_id" {
  description = "The ID of the service account to create."
  type        = string
}

variable "data_store_name" {
  description = "The name of the Vertex AI data store."
  type        = string
}

variable "collection_id" {
  description = "The ID of the collection for the Vertex AI data store."
  type        = string
}