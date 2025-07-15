# Python Flask Web App

A simple Flask web application with a modern UI, configured for automated deployment to AWS Fargate using GitHub Actions.

## Features
- Flask web framework & Gunicorn server
- Modern, responsive UI
- `/health` endpoint for health checks
- Dockerized for consistent environments
- **Basic CI/CD pipeline** using GitHub Actions to deploy to AWS ECS Fargate

## CI/CD with GitHub Actions and AWS Fargate

This project contains a simple, self-contained CI/CD pipeline using GitHub Actions. When you push a change to the `main` branch, the workflow automatically builds a new Docker image, pushes it to your private Amazon ECR repository, and deploys it to your Amazon ECS Fargate service.

### Deployment Setup (One-Time)

Follow these steps in the AWS Console to set up the necessary cloud infrastructure.

#### Step 1: Create an ECR Repository
This is the private Docker registry where your application images will be stored.
1.  Navigate to the **Amazon ECR** service in the AWS Console.
2.  Click **Create repository**.
3.  Set the **Visibility** to **Private**.
4.  Give it a **Repository name** (e.g., `python-flask-web`). You will use this name later.
5.  Click **Create repository**.

#### Step 2: Create an ECS Fargate Cluster
The cluster provides the environment where your application will run.
1.  Navigate to the **Amazon ECS** service.
2.  Click **Create Cluster**.
3.  Set the **Cluster name** (e.g., `flask-cluster`).
4.  For **Infrastructure**, select **AWS Fargate (serverless)**.
5.  Click **Create**.

#### Step 3: Create an ECS Task Definition and Service
This step tells ECS *what* to run (the Task Definition) and *how* to run it (the Service).
1.  In the ECS console, go to **Task Definitions** and click **Create new Task Definition**.
2.  Enter a **Task definition family** name (e.g., `flask-app-task`).
3.  In the **Container details** section, set:
    *   **Name:** `flask-app` (or your preferred container name).
    *   **Image URI:** Enter a placeholder for now, like `hello-world`. The CI/CD pipeline will update this automatically.
    *   **Port mappings:** Add a mapping for port `5000`.
4.  Click **Create**.
5.  Now, create a **Service** to run and manage your task:
    *   In your ECS Cluster, click the **Services** tab and then **Create**.
    *   Select the Task Definition you just created.
    *   Give the service a name (e.g., `flask-service`).
    *   To make your app accessible from the internet, configure a **Load Balancer**.

#### Step 4: Configure GitHub Secrets
Your GitHub Actions workflow needs secure credentials to interact with your AWS account.
1.  In your GitHub repository, go to **Settings > Secrets and variables > Actions**.
2.  Click **New repository secret** for each of the following secrets:
    *   `AWS_ACCESS_KEY_ID`: Your AWS access key ID.
    *   `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
    *   `AWS_REGION`: The AWS region where you created your resources (e.g., `us-east-1`).
    *   `ECR_REPOSITORY`: The name of the ECR repository you created in Step 1.
    *   `ECS_CLUSTER_NAME`: The name of the ECS cluster you created in Step 2.
    *   `ECS_SERVICE_NAME`: The name of the ECS service you created in Step 3.
    *   `CONTAINER_NAME`: The container name from your Task Definition (e.g., `flask-app`).

### How the Pipeline Works
1.  **Push to `main`**: You push a code change to the `main` branch of your repository.
2.  **Trigger Workflow**: This automatically starts the GitHub Actions workflow defined in `.github/workflows/ci.yml`.
3.  **Checkout Code**: The first step in the job checks out your repository's code so it can be used by the next steps.
4.  **Build Image**: The workflow builds a new Docker image based on the `Dockerfile`.
5.  **Push to ECR**: It tags the new image with a unique identifier (the commit SHA) and pushes it to your private Amazon ECR repository.
6.  **Deploy to ECS**: Finally, it updates your ECS Task Definition with the new image ID and triggers a deployment. ECS then gracefully stops the old container and starts a new one with the updated image.
---
**Created by Sushant Sonbarse** | [GitHub](https://github.com/sonbarse17/)
