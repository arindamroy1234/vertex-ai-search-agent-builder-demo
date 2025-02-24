# Create Test DataStore
resource "google_discovery_engine_data_store" "test-ds" {
  location = "global"
  data_store_id = "doc-search-data-store-39710"
  display_name = "test-structured-datastore-39710"
  industry_vertical = "GENERIC"
  content_config = "CONTENT_REQUIRED"
  solution_types = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search = false
  project = "doc-search-agent-39710"
}

# Create Test Serach Engine
resource "google_discovery_engine_search_engine" "test-engine" {
  engine_id = "doc-search-engine-39710"
  collection_id = "default_collection"
  location = google_discovery_engine_data_store.test-ds.location
  display_name = "doc-search-engine-39710"
  industry_vertical = "GENERIC"
  data_store_ids = [google_discovery_engine_data_store.test-ds.data_store_id]
  common_config {
  company_name = "Test Company"
  }
search_engine_config {
  search_add_ons = ["SEARCH_ADD_ON_LLM"]
  }
project = "doc-search-agent-39710"
}

# Output resource Id's
/*
output "test_data_store_id" {
  value =resource.google_discovery_engine_data_store.test-ds.data_store_id
}
output "test_engine_id" {
  value = resource.google_discovery_engine_search_engine.test-engine.engine_id
}*/