# AWS Identity and Access Management (IAM) - Mini Project Documentation

This documentation outlines the knowledge gained through hands-on learning and project work involving **AWS Identity and Access Management (IAM)**. IAM is a key component in securing AWS environments by managing access and permissions.

---

## 📘 What is IAM?

**IAM (Identity and Access Management)** is an AWS service that helps securely control access to AWS services and resources. IAM allows you to create and manage users and groups and define permissions to allow or deny their access to AWS resources.

**Key Features:**
- Centralized access control
- Least privilege principle enforcement
- Role-based access control
- MFA and identity federation support

![IAM Overview](https://d1.awsstatic.com/Projects/IAM/iam-diagram.3e6a4a4b8d1770b49e05ff89f23e05fc096d944e.png)

---

## 👤 What is an IAM User?

An **IAM User** is a representation of a person or an application that interacts with AWS. Each user has a unique name and credentials such as passwords or access keys.

**Use Cases:**
- Developers or admins logging in to AWS
- Applications accessing AWS via SDK

**Permissions are granted directly or via group memberships.**

![IAM User](https://docs.aws.amazon.com/IAM/latest/UserGuide/images/console_users.png)

---

## 🛡️ What is an IAM Role?

An **IAM Role** is an AWS identity with permissions policies that determine what actions the identity can perform. Unlike users, roles are assumed temporarily and do not have long-term credentials.

**Use Cases:**
- Granting permissions to AWS services (e.g., EC2 to access S3)
- Federated identities
- Cross-account access

![IAM Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/images/roles_diagram.png)

---

## 📜 What is an IAM Policy?

An **IAM Policy** is a JSON document that defines permissions. It specifies allowed or denied actions on AWS resources.

**Types of Policies:**
- AWS Managed Policies
- Customer Managed Policies
- Inline Policies

**Example Policy:**
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "*"
    }
  ]
}
