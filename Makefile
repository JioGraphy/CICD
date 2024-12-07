# Include environment variables from a file
-include .env

# Task: Deploy infrastructure using Terraform
deploy-infra:
	cd infra/terraform && terraform init && terraform apply -auto-approve

# Task: Build Docker image
build-image: deploy-infra
	docker build -t $(IMAGE_NAME):latest ./app

# Task: Push Docker image to ECR
push-image: build-image
	aws ecr get-login-password --region $(REGION) | docker login --username AWS --password-stdin $(ECR_REGISTRY)
	docker tag $(IMAGE_NAME):latest $(ECR_REGISTRY)/$(IMAGE_NAME):latest
	docker push $(ECR_REGISTRY)/$(IMAGE_NAME):latest

# Task: Deploy the container to EKS
deploy-container: push-image
	kubectl apply -f k8s/deployment.yaml
