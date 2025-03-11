# 🚀 Terraform AWS Infrastructure Project

## 📌 Overview
This project automates the provisioning of AWS infrastructure using **Terraform** while implementing a **secure deployment pipeline with GitHub Actions OIDC authentication**.

By eliminating the need for long-term AWS credentials, this setup ensures security and efficiency for cloud infrastructure deployments.

## 🔧 Technologies Used
- **Terraform** – Infrastructure as Code (IaC)
- **AWS** – EC2, IAM, S3, VPC and more
- **GitHub Actions** – CI/CD automation
- **OpenID Connect (OIDC)** – Secure AWS authentication
- **Docker** – Containerized deployments
- **Terraform Cloud** – Remote state management

## 🏗️ Architecture
![terraform-infrastructure-diagram](https://github.com/user-attachments/assets/c5402357-3f8d-42c7-83c9-c7112991da61)


### **Infrastructure Components**
✅ **VPC & Subnets** – Securely isolated AWS network.  
✅ **IAM Roles & Policies** – Managed permissions for GitHub Actions via OIDC.  
✅ **EC2 Instances** – Compute resources deployed via Terraform.  
✅ **S3 Buckets** – Storage for Terraform state and application assets.  
✅ **Security Groups** – Controlled access to deployed resources.  
✅ **GitHub Actions** – Automated Terraform deployment with OIDC authentication.  
✅ **IAM Policies** – Granular access control for AWS resources.  
✅ **OIDC for GitHub Actions** – Secure authentication without long-term credentials.  

---

## 🔥 How to Use
### 1️⃣ Clone the Repository
```sh
git clone https://github.com/YOUR_GITHUB_USERNAME/terraform-aws-infrastructure.git
cd terraform-aws-infrastructure
```

### 2️⃣ Set Up AWS OIDC Authentication (GitHub Actions)
1. Go to **AWS IAM** → Create **OIDC Provider** for GitHub.
2. Attach necessary permissions (Terraform deployments, S3, EC2, IAM policies, etc.).
3. Configure GitHub Secrets:
   - `AWS_ROLE_ARN`: IAM role ARN for GitHub Actions.
   - `AWS_REGION`: Your AWS region (e.g., `us-east-1`).

### 3️⃣ Initialize Terraform & Deploy
```sh
terraform init
terraform apply -auto-approve
```

### 4️⃣ Automate with GitHub Actions
- Push changes to the repo → GitHub Actions will **automatically deploy** updates.

---

## 🎯 Key Features
✅ **Infrastructure as Code (IaC)** – Reproducible and version-controlled.  
✅ **GitHub OIDC Authentication** – Eliminates long-term AWS credentials.  
✅ **Modular Terraform Configuration** – Easily extendable.  
✅ **CI/CD Pipeline** – Auto-deployment with GitHub Actions.  
✅ **Secure AWS Deployment** – IAM roles, policies, and best practices.  
✅ **S3 Bucket Integration** – Centralized storage management.  
✅ **Automated Terraform Deployment** – Hands-free infrastructure updates.  

---

## 📜 Project Structure
```
├── .github/workflows/    # GitHub Actions CI/CD workflows
├── modules/              # Terraform modules for modularity
├── terraform/            # Main Terraform configuration
│   ├── main.tf           # Infrastructure definition
│   ├── variables.tf      # Input variables
│   ├── outputs.tf        # Output values
│   ├── providers.tf      # Provider configurations
├── .gitignore            # Ignore unnecessary files
├── README.md             # Project documentation
```

---

## 🚀 Future Enhancements
🔹 Add Terraform state backend (S3 + DynamoDB).  
🔹 Implement monitoring with AWS CloudWatch.  
🔹 Enhance security with AWS IAM least privilege policies.  
🔹 Implement auto-scaling for EC2 instances.  

---

## 👨‍💻 Author
**Jason Akrofi Ocansey**  


💼 **LinkedIn:** https://www.linkedin.com/in/jason-ocansey-05410934b/



📧 **Email:** jasonocansey2706@gmail.com
