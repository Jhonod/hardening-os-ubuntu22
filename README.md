# Ubuntu Hardening CI/CD

## Features
- Provision Ubuntu VM (GCP) with Terraform
- Run Ansible to harden security automatically
- CI/CD via GitHub Actions

## Setup
1. Set GitHub secrets:
   - `TF_VAR_project_id`
   - `TF_VAR_region`
   - `TF_VAR_ssh_public_key`
   - `ANSIBLE_PRIVATE_KEY`

2. Push to GitHub.
3. Done! It will auto provision + harden the OS.