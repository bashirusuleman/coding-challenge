
# Bucket to store website
resource "google_storage_bucket" "static-site" {
  name          = var.website
  location      = var.location
  force_destroy = true
   project = var.project_id
 

  uniform_bucket_level_access = false

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
 }

# Make new objects public
resource "google_storage_default_object_access_control" "website_read" {
  bucket = google_storage_bucket.static-site.name
  role   = "READER"
  entity = "allUsers"
}

# Add the bucket as a CDN backend
resource "google_compute_backend_bucket" "website" {  
  name        = "website-backend"
  description = "Contains files needed by the website"
  bucket_name = google_storage_bucket.static-site.name
  enable_cdn  = true
  project = var.project_id
}


#Added a index object to bucket 
resource "google_storage_bucket_object" "object" {
  name   = "index.html"
  source = "./index.html"
  bucket = google_storage_bucket.static-site.id 
}


