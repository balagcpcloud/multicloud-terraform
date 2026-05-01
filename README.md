# Multi-Cloud Terraform Modules: Azure + AWS + GCP

GitHub-ready Terraform monorepo for a 3-cloud landing zone and platform services.

Included: Azure RG/VNet/NSG/KeyVault/AKS/Storage/Postgres/Monitor, AWS VPC/SG/KMS/S3/EKS/RDS/CloudWatch, GCP VPC/Firewall/KMS/GCS/GKE/CloudSQL/Logging.

Run:
```bash
cd envs/dev
terraform init
terraform validate
terraform plan -var-file=terraform.tfvars.example
```
