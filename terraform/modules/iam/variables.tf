variable "project_id" {
  description = "The ID of the project in which to create the resources."
  type        = string
}

variable "service_account_id" {
  description = "The ID of the service account to create."
  type        = string
}

variable "bucket_name" {
  description = "The name of the Cloud Storage bucket."
  type        = string
}