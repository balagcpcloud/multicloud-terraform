variable "environment" { type=string }
variable "prefix" { type=string }
variable "owner" { type=string }
variable "cost_center" { type=string }
variable "application" { type=string }
variable "azure_location" { type=string }
variable "azure_tenant_id" { type=string }
variable "aws_region" { type=string }
variable "gcp_project_id" { type=string }
variable "gcp_region" { type=string }
variable "postgres_admin_password" { type=string sensitive=true }
