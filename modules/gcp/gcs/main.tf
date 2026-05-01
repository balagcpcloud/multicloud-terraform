variable "bucket_name" { type=string }
variable "location" { type=string }
variable "labels" { type=map(string) default={} }
resource "google_storage_bucket" "this" { name=var.bucket_name location=var.location uniform_bucket_level_access=true versioning { enabled=true } labels=var.labels }
output "name" { value=google_storage_bucket.this.name }
