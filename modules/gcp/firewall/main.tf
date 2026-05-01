variable "name" { type=string }
variable "network" { type=string }
variable "source_ranges" { type=list(string) default=[] }
resource "google_compute_firewall" "this" { name=var.name network=var.network allow { protocol="tcp" ports=["443"] } source_ranges=var.source_ranges }
output "id" { value=google_compute_firewall.this.id }
