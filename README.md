

# Terraform EKS Nginx Deployment

This project automates the provisioning of an **AWS EKS cluster** using **Terraform**, along with deploying an **Nginx application** on Kubernetes exposed via a LoadBalancer. The Nginx container displays a custom welcome message injected via a ConfigMap.

---

## Features

- AWS VPC with public and private subnets
- IAM roles for EKS cluster and worker nodes
- EKS cluster creation with managed node group
- Nginx deployment with 2 replicas
- ConfigMap injecting a `WELCOME_MSG` environment variable into Nginx
- LoadBalancer service exposing Nginx to the internet
- CI/CD pipeline via GitHub Actions:
  - PR → Terraform formatting, validation, kubectl lint
  - Push to main → Terraform apply, update kubeconfig, apply Kubernetes manifests

---

## Prerequisites

- AWS account with permissions to create VPC, IAM roles, EKS, EC2, and LoadBalancer
- Terraform >= 1.7.0
- kubectl installed and configured
- GitHub repository (for CI/CD)





---

## Terraform Deployment

1. **Initialize Terraform**
```bash
terraform init
````

2. **Format & Validate**

```bash
terraform fmt
terraform validate
```

3. **Apply Terraform**

```bash
terraform apply -auto-approve
```

> This will create the VPC, IAM roles, EKS cluster, and managed node group.

---

## Kubernetes Deployment

1. **Update kubeconfig**

```bash
aws eks update-kubeconfig --region us-east-1 --name nadine-cluster
```

2. **Apply Kubernetes manifests**

```bash
kubectl apply -f k8/
kubectl apply -f configmap.yaml
```

3. **Verify pods and service**

```bash
kubectl get pods
kubectl get svc
```

> The LoadBalancer service will expose Nginx publicly. Use the `EXTERNAL-IP` to access the welcome page.

---

## GitHub Actions CI/CD

Workflow defined in `.github/workflows/ci-cd.yml`:

* On PR: `terraform fmt`, `terraform validate`, `kubectl lint`
* On push to main:

  * `terraform apply`
  * Update kubeconfig
  * Apply Kubernetes manifests (`kubectl apply -f k8/`)

---

## Clean Up

To remove all resources created by Terraform:

```bash
terraform destroy -auto-approve
```

> This deletes the EKS cluster, node group, IAM roles, and VPC.

---

## Customization

* Change the Nginx welcome message in `configmap.yaml`:

```yaml
WELCOME_MSG: "Hello from <Your Name>"
```

* Update Terraform variables in `variables.tf` as needed.

---

