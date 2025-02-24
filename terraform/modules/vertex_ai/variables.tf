variable "project_id" {
  description = "The ID of the project in which to create the resources."
  type        = string
}

variable "region" {
  description = "The region in which to create the resources."
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