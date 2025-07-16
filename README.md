# Python Flask Web App

A simple Flask web application with a modern UI, configured for automated deployment to Google Kubernetes Engine (GKE) using GitHub Actions.

## Features
- Flask web framework & Gunicorn server
- Modern, responsive UI
- `/health` endpoint for health checks
- Dockerized for consistent environments
- **CI/CD pipeline** using GitHub Actions to deploy to GKE
- **Infrastructure as Code** using Terraform to provision a GKE cluster.

## CI/CD with GitHub Actions and GKE

This project contains a CI/CD pipeline using GitHub Actions and Terraform. 
- The **Terraform workflow** (`terraform.yml`) provisions a GKE cluster on Google Cloud.
- The **CI workflow** (`ci.yml`) automatically builds a new Docker image, pushes it to Docker Hub, and deploys it to your GKE cluster when you push a change to the `main` branch.

### Prerequisites (One-Time Setup)

Follow these steps to set up the necessary cloud infrastructure and secrets.

#### Step 1: Configure Google Cloud Platform (GCP)
1.  **Create a GCP Project**: If you don't have one already, create a new project in the [GCP Console](https://console.cloud.google.com/).
2.  **Create a Service Account**: This account will be used by GitHub Actions to authenticate with GCP.
    *   Navigate to **IAM & Admin > Service Accounts**.
    *   Click **Create Service Account**.
    *   Give it a name (e.g., `github-actions-deployer`).
    *   Grant it the following roles:
        *   `Kubernetes Engine Admin`
        *   `Artifact Registry Administrator`
        *   `Storage Admin` (for Terraform state)
    *   Create a JSON key for the service account and download it. You will use the contents of this file in the GitHub secrets.
3.  **Create a Docker Hub Account**: You'll need a Docker Hub account to store your container images.
    *   Sign up at [Docker Hub](https://hub.docker.com/) if you don't have an account.
    *   Create a new repository named `python-flask-web`.
    *   Generate an access token from your Docker Hub account settings for secure authentication.

#### Step 2: Configure GitHub Secrets
Your GitHub Actions workflow needs secure credentials to interact with your GCP account.
1.  In your GitHub repository, go to **Settings > Secrets and variables > Actions**.
2.  Click **New repository secret** for each of the following secrets:
    *   `GCP_PROJECT_ID`: Your Google Cloud project ID.
    *   `GCP_SA_KEY`: The entire JSON content of the service account key you downloaded.
    *   `GCP_REGION`: The GCP region where you want to deploy (e.g., `us-central1`).
    *   `DOCKERHUB_USERNAME`: Your Docker Hub username.
    *   `DOCKERHUB_TOKEN`: Your Docker Hub access token.
    *   `GKE_CLUSTER_NAME`: The name for your GKE cluster (e.g., `my-gke-cluster`).

#### Step 3: Update `terraform.tfvars`
Update the `terraform/terraform.tfvars` file with your GCP project details.

### How the Pipeline Works
1.  **Provision Infrastructure**:
    *   Manually trigger the **Terraform Provision and Destroy** workflow from the Actions tab in GitHub.
    *   Select the `apply` action to create the GKE cluster.
2.  **Deploy Application**:
    *   Push a code change to the `main` branch.
    *   This automatically starts the **Deploy to Google GKE** workflow.
    *   The workflow builds a new Docker image, pushes it to Docker Hub, and deploys it to your GKE cluster.
---
**Created by Sushant Sonbarse** | [GitHub](https://github.com/sonbarse17/)
