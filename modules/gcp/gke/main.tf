variable "name" { type=string }
variable "location" { type=string }
variable "network" { type=string }
variable "subnetwork" { type=string }
resource "google_container_cluster" "this" { name=var.name location=var.location network=var.network subnetwork=var.subnetwork remove_default_node_pool=true initial_node_count=1 private_cluster_config { enable_private_nodes=true enable_private_endpoint=false master_ipv4_cidr_block="172.16.0.0/28" } }
resource "google_container_node_pool" "this" { name="system" location=var.location cluster=google_container_cluster.this.name node_count=2 node_config { machine_type="e2-standard-4" } }
output "name" { value=google_container_cluster.this.name }
