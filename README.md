# DevOps Task — Automated Kubernetes Deployment


## Quickstart (local & cloud)


1. Install tools: Git, Docker, Node.js, Terraform, Azure CLI, kubectl
2. Create an Azure subscription
3. Clone this repo
4. Customize terraform/variables.tf (especially ssh_public_key)
5. Run:
- `cd terraform`
- `terraform init`
- `terraform apply --auto-approve`
6. Use `az aks get-credentials` to configure kubectl locally
7. Build and push Docker image (or let GitHub Actions do it):
- `docker build -t <yourhub>/helloapp:v1 .`
- `docker push <yourhub>/helloapp:v1`
8. Update `k8s/deployment.yaml` image or let CI replace the placeholder
9. `kubectl apply -f k8s/`
10. Get public IP: `kubectl get svc hello-service`


## GitHub Actions
- Create secrets in your GitHub repository:
- `DOCKER_USERNAME`, `DOCKER_PASSWORD`
- `AZURE_CREDENTIALS` (create using `az ad sp create-for-rbac --sdk-auth`)
- `AZURE_RG` (terraform output `resource_group_name`)
- `AZURE_CLUSTER` (terraform output `aks_cluster_name`)


Then push to `main` and the pipeline will build, push, and deploy.
