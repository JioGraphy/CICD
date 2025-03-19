# CI/CD End-to-End Pipeline with Flask Application

## Overview

This repository demonstrates an end-to-end CI/CD pipeline for deploying a Flask application. The project showcases the integration of **Terraform (or AWS CDK)** for infrastructure provisioning, **Docker** for containerization, and **GitHub Actions** for CI/CD automation. The pipeline automates the deployment of the application to an **Amazon EKS cluster**, with **Amazon RDS** as the backend database.

This project is an example of best practices in DevOps, including infrastructure-as-code (IaC), containerized application deployment, and continuous integration and deployment pipelines.

---

## Application: Flask Web App

The application is a simple **Flask** web service with a couple of routes.

### Running Locally

1. **Create a virtual environment**:
   > ```bash
   > python -m venv venv
   > ```
2. **Activate the virtual environment**:
   > ```bash
   > source venv/bin/activate
   > ```
3. **Install dependencies**:
   > ```bash
   > pip install -r requirements.txt
   > ```
4. **Run the application**:
   > ```bash
   > python main.py
   > ```
5. **Test the endpoint**:
   > ```bash
   > curl http://127.0.0.1:5000/hello/John
   > ```

---

## Infrastructure: Provisioning with Terraform or AWS CDK

Infrastructure is provisioned using either **Terraform** or **AWS CDK**. Key infrastructure components include:

1. **IAM Roles and Policies**: 
   - Roles with necessary permissions for EKS and RDS.
   - Trust relationships configured for EKS to access RDS.

2. **Amazon EKS Cluster**:
   - Kubernetes cluster for deploying containerized applications.

3. **Amazon RDS (PostgreSQL)**:
   - Database for storing application data.

4. **Container Registry**:
   - ECR to store Docker images.

5. **VPC**:
   - A Virtual Private Cloud to host EKS and RDS securely.

### Key Files

- `infra/terraform/main.tf`: Terraform configuration file for provisioning the infrastructure.
- `infra/cdk/main.py`: AWS CDK Python script for provisioning infrastructure.

---

## Application Deployment: Dockerized Flask App

The application is containerized using Docker. The following files and steps support deployment:

1. **Dockerfile**:
   - Defines the application container.

2. **Makefile**:
   - Simplifies build, test, and deployment commands for the application.

### Commands (via Makefile)

- Build Docker Image:
  > ```bash
  > make build
  > ```
- Push Docker Image to ECR:
  > ```bash
  > make push
  > ```
- Deploy to EKS:
  > ```bash
  > make deploy
  > ```

---

## CI/CD: GitHub Actions Workflow

A robust CI/CD pipeline was implemented using **GitHub Actions**, ensuring smooth and automated deployment of the application.

### Workflow Features

1. **Triggers**:
   - Runs on pushes and pull requests to the `main` branch.

2. **Steps**:
   - **Build**: Builds the Docker image of the Flask application.
   - **Push**: Pushes the Docker image to Amazon ECR.
   - **Deploy**: Deploys the application to the EKS cluster.

3. **Rollback Mechanism** (Bonus):
   - Ensures previous versions of the application are deployed if the new deployment fails.

4. **Monitoring & Alerting** (Bonus):
   - Integrated with **CloudWatch** for monitoring and alerting on infrastructure and application metrics.

### Workflow File

- `.github/workflows/ci-cd-pipeline.yml`

---

## Evaluation Criteria and Highlights

### Key Achievements

1. **Infrastructure Code**:
   - Infrastructure is provisioned as code using Terraform or AWS CDK, ensuring repeatability and consistency.
2. **CI/CD Pipeline**:
   - Fully automated pipeline for build, test, and deployment.
3. **Code Quality**:
   - Adherence to best practices for Terraform, Docker, and GitHub Actions.
4. **Rollback Mechanism**:
   - Ensures resilience by rolling back failed deployments.
5. **Monitoring**:
   - Tracks infrastructure and application health using CloudWatch.

---

## Usage Instructions

1. Clone the repository:
   > ```bash
   > git clone https://github.com/<your-username>/ci-cd-flask-pipeline.git
   > ```
2. Provision infrastructure:
   > ```bash
   > make infra
   > ```
3. Build and deploy the application:
   > ```bash
   > make deploy
   > ```

---

## Tech Stack

| Technology                 | Logo                                   |
|----------------------------|----------------------------------------|
| **Infrastructure**         | ![Terraform](https://img.shields.io/badge/-Terraform-623CE4?logo=terraform&logoColor=white) ![AWS CDK](https://img.shields.io/badge/-AWS%20CDK-FF9900?logo=amazon-aws&logoColor=white) |
| **Kubernetes (EKS)**       | ![Kubernetes](https://img.shields.io/badge/-Kubernetes-326CE5?logo=kubernetes&logoColor=white) |
| **Containerization**       | ![Docker](https://img.shields.io/badge/-Docker-2496ED?logo=docker&logoColor=white) |
| **Database**               | ![PostgreSQL](https://img.shields.io/badge/-PostgreSQL-336791?logo=postgresql&logoColor=white) |
| **CI/CD**                  | ![GitHub Actions](https://img.shields.io/badge/-GitHub%20Actions-2088FF?logo=github-actions&logoColor=white) |
| **Monitoring**             | ![CloudWatch](https://img.shields.io/badge/-CloudWatch-FF4F8B?logo=amazon-aws&logoColor=white) |
| **Application Framework**  | ![Flask](https://img.shields.io/badge/-Flask-000000?logo=flask&logoColor=white) |

---

## Lessons and Best Practices

- Infrastructure as Code (IaC) simplifies infrastructure management and ensures scalability.
- Containerization makes the application portable and platform-independent.
- CI/CD pipelines reduce manual errors, increase deployment speed, and ensure consistency.
- Monitoring and rollback mechanisms ensure application stability and reliability in production environments.

---

## Future Improvements

- Enhance logging and tracing using **AWS X-Ray**.
- Automate RDS database schema migration with tools like **Flyway**.
- Integrate additional security mechanisms, such as AWS WAF and Secrets Manager.

---

This project demonstrates how to craft scalable, secure, and robust cloud-native solutions using modern DevOps practices.

---
