variable "name" { type=string }
variable "subnets" { type=map(object({ region=string, cidr=string })) }
resource "google_compute_network" "this" { name=var.name auto_create_subnetworks=false }
resource "google_compute_subnetwork" "this" { for_each=var.subnets name=each.key ip_cidr_range=each.value.cidr region=each.value.region network=google_compute_network.this.id }
output "network_id" { value=google_compute_network.this.id }
output "subnet_ids" { value={ for k,v in google_compute_subnetwork.this : k => v.id } }
