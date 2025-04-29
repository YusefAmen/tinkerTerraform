# Terraform SRE Stack MVP

This project launches:
- A web app (FastAPI + Prometheus metrics)
- Prometheus monitoring
- Grafana visualization
- All infrastructure provisioned by Terraform

## Usage

1. Edit `terraform/variables.tf` to set your AWS Key Pair name.
2. Build and push your Docker image from `app/`
3. `cd terraform && terraform init && terraform apply`
4. Visit:
   - http://[your-ec2-ip]/ (Web App)
   - http://[your-ec2-ip]:9090 (Prometheus)
   - http://[your-ec2-ip]:3000 (Grafana)


