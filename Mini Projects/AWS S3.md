
# AWS Simple Storage Service (S3) - Mini Project Documentation

This documentation summarizes the knowledge gained through hands-on experience with **AWS S3 (Simple Storage Service)**. S3 is a scalable and durable object storage service that is commonly used for backup, archiving, data lakes, and web hosting.

---

## 🪣 Create and Configure S3 Buckets Using the AWS Management Console

Creating and configuring an S3 bucket through the AWS Console is one of the first steps in using S3. Key configuration options include:
- Choosing a unique bucket name
- Selecting a region for data residency
- Enabling or disabling public access
- Optional settings like versioning, logging, tags, and encryption

**Screenshot/Diagram (Example Bucket Creation UI):**
![S3 Bucket Creation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/images/create-bucket.png)

---

## 📤 Upload Files and Manage Objects Within S3 Buckets

Once a bucket is created, objects such as files, images, and backups can be uploaded using the console, AWS CLI, or SDKs.

**Key Object Management Features:**
- Uploading single or multiple files
- Setting metadata and storage class
- Creating folders (virtual directory structure)
- Renaming, moving, or deleting files

**Example Console View:**
![Upload Files](https://docs.aws.amazon.com/AmazonS3/latest/userguide/images/upload-object.png)

---

## 🗂️ Understand the Importance of Versioning and Its Implications for Data Management

**S3 Versioning** allows multiple versions of an object in the same bucket, protecting against accidental overwrites and deletions.

**Benefits:**
- Retain older versions for recovery
- Track changes over time
- Undo accidental deletes or changes

**Implications:**
- Storage costs may increase
- Requires careful lifecycle policy design

**Versioning Diagram:**
![S3 Versioning](https://docs.aws.amazon.com/AmazonS3/latest/userguide/images/versioning-overview-diagram.png)

---

## 🔐 Configure Permissions to Control Access to S3 Objects

S3 offers flexible access control using:
- **Bucket Policies** (written in JSON)
- **Access Control Lists (ACLs)**
- **IAM policies**

**Common Use Cases:**
- Making a bucket public for static website hosting
- Granting read access to specific IAM users
- Using pre-signed URLs for secure object access

**Example Permissions UI:**
![S3 Permissions](https://docs.aws.amazon.com/AmazonS3/latest/userguide/images/bucket-permissions.png)

---

## 🔄 Implement Lifecycle Policies to Automate Data Management Tasks and Optimize Storage Costs

**Lifecycle Policies** automate transitions and deletions of objects to manage storage costs efficiently.

**Typical Rules:**
- Transition to Standard-IA after 30 days
- Move to Glacier after 90 days
- Delete after 365 days

**Benefits:**
- Reduce long-term storage costs
- Comply with data retention policies

**Lifecycle Policy UI:**
![S3 Lifecycle Policy](https://docs.aws.amazon.com/AmazonS3/latest/userguide/images/lifecycle-console.png)

---

## ✅ Conclusion

AWS S3 is a versatile and reliable storage solution. Through this project, core features like bucket creation, file uploads, permissions, versioning, and lifecycle policies were explored in depth. These skills are fundamental for building scalable and cost-efficient cloud storage systems.

---
