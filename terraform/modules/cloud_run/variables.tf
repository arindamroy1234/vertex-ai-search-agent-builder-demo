variable "service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "image" {
  description = "The container image to deploy to Cloud Run."
  type        = string
}

variable "region" {
  description = "The region in which to create the Cloud Run service."
  type        = string
}

variable "bucket_name" {
  description = "The name of the Cloud Storage bucket."
  type        = string
}

variable "project_id" {
  description = "The ID of the project in which to create the resources."
  type        = string
}