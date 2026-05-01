variable "name" { type=string }
variable "resource_group_name" { type=string }
variable "location" { type=string }
variable "subnet_id" { type=string }
variable "node_count" { type=number default=2 }
variable "tags" { type=map(string) default={} }
resource "azurerm_kubernetes_cluster" "this" { name=var.name location=var.location resource_group_name=var.resource_group_name dns_prefix=var.name private_cluster_enabled=true default_node_pool { name="system" node_count=var.node_count vm_size="Standard_D4s_v5" vnet_subnet_id=var.subnet_id } identity { type="SystemAssigned" } network_profile { network_plugin="azure" network_policy="azure" } tags=var.tags }
output "name" { value=azurerm_kubernetes_cluster.this.name }
