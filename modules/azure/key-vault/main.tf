variable "name" { type=string }
variable "resource_group_name" { type=string }
variable "location" { type=string }
variable "tenant_id" { type=string }
variable "tags" { type=map(string) default={} }
resource "azurerm_key_vault" "this" { name=var.name location=var.location resource_group_name=var.resource_group_name tenant_id=var.tenant_id sku_name="standard" enable_rbac_authorization=true purge_protection_enabled=true soft_delete_retention_days=7 tags=var.tags }
output "uri" { value=azurerm_key_vault.this.vault_uri }
