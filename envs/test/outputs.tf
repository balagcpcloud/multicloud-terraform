output "azure_aks_name" { value=module.azure_aks.name }
output "aws_eks_name" { value=module.aws_eks.name }
output "gcp_gke_name" { value=module.gcp_gke.name }
output "azure_postgres_fqdn" { value=module.azure_postgres.fqdn }
output "aws_rds_endpoint" { value=module.aws_rds.endpoint }
output "gcp_cloudsql_connection" { value=module.gcp_cloudsql.connection_name }
