variable "name" { type=string }
variable "region" { type=string }
variable "password" { type=string sensitive=true }
resource "google_sql_database_instance" "this" { name=var.name region=var.region database_version="POSTGRES_15" settings { tier="db-f1-micro" backup_configuration { enabled=true } ip_configuration { ipv4_enabled=false } } deletion_protection=false }
resource "google_sql_user" "admin" { name="pgadmin" instance=google_sql_database_instance.this.name password=var.password }
output "connection_name" { value=google_sql_database_instance.this.connection_name }
