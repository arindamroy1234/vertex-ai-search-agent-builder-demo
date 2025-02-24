resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.region
}

resource "google_storage_bucket_object" "research_pdfs_folder" {
  name   = "research-pdfs/"
  content = " "
  bucket = google_storage_bucket.bucket.name
}

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}