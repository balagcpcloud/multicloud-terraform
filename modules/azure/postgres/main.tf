variable "name" { type=string }
variable "resource_group_name" { type=string }
variable "location" { type=string }
variable "administrator_login" { type=string }
variable "administrator_password" { type=string sensitive=true }
variable "tags" { type=map(string) default={} }
resource "azurerm_postgresql_flexible_server" "this" { name=var.name resource_group_name=var.resource_group_name location=var.location version="15" administrator_login=var.administrator_login administrator_password=var.administrator_password sku_name="B_Standard_B1ms" storage_mb=32768 backup_retention_days=7 zone="1" tags=var.tags }
output "fqdn" { value=azurerm_postgresql_flexible_server.this.fqdn }
