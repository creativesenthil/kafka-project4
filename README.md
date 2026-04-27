# Kafka Project 4 — Terraform + CI/CD

## What this project does
Manages Kafka topics as Infrastructure as Code using Terraform.
GitHub Actions automatically deploys topic changes on every push.

## Architecture

### Phase A — Local Kafka
- Kafka running on Docker Compose
- Terraform provider: Mongey/kafka
- Topics managed as code

### Phase B — AWS MSK
- Real managed Kafka on AWS
- Terraform provider: hashicorp/aws
- Same topic code, different target

## Folder Structure
- terraform/
- docker/
- .github/workflows/
