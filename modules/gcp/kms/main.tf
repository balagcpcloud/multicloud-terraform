variable "key_ring" { type=string }
variable "key_name" { type=string }
variable "location" { type=string }
resource "google_kms_key_ring" "this" { name=var.key_ring location=var.location }
resource "google_kms_crypto_key" "this" { name=var.key_name key_ring=google_kms_key_ring.this.id rotation_period="7776000s" }
output "key_id" { value=google_kms_crypto_key.this.id }
