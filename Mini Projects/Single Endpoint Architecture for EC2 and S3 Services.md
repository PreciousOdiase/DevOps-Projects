# 🌐 AWS Web Hosting Project with EC2, NGINX, Elastic IP, and S3

This project demonstrates the deployment of a web server and static website using AWS services. It includes launching an Ubuntu EC2 instance, installing NGINX, configuring an Elastic IP, and hosting a static webpage via Amazon S3.

---

## ✅ Project Overview

**Services Used:**
- Amazon EC2 (Ubuntu)
- NGINX Web Server
- Elastic IP
- Amazon S3 (Static Website Hosting)

---

## 🛠️ Setup Steps

### 1. Launched an Amazon Linux EC2 Instance

An EC2 instance was launched using the Ubuntu Server 20.04 LTS AMI:

- Chose instance type: `t2.micro` (Free Tier eligible)
- Configured a security group to allow **HTTP (80)**, **HTTPS (443)**, and **SSH (22)** access
- Launched instance with a key pair for SSH access

 ![EC2 Instance Setup](img/ec2.jpg)

---


### 2.  Install and Start NGINX
Once inside the instance, NGINX was installed and configured:

```bash
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```
 ![EC2 Instance Setup](img/ec2-config-nginx.jpg)
![Nginx](img/nginx-config.jpg)


### 3. Allocate and Attach an Elastic IP
An Elastic IP address was allocated and associated with the EC2 instance to ensure consistent public access.

![Elstic IP](img/elastic-ip.jpg)


### 4. Create and Configure S3 Bucket for Static Hosting
An S3 bucket was created to host a static HTML file.

Steps:

Created a new bucket with public access enabled

Uploaded index.html and style.css

Enabled static website hosting under Properties

 ![Static Website](img/s3.jpg)
 ![Bucket Policy](img/bucket-policy.jpg)


### 5. Access the Static Webpage
Visited the S3 static site via its public endpoint:

```
 http://my-static-site-bucket12312.s3-website.eu-west-2.amazonaws.com
```
![S3 Public Endpoint](img/static-website.jpg)

Visited the S3 static site via its elastic IP:
 ![Elastic IP](img/elastic-ip-website.jpg)


### 📦 Final Outcome
✅ EC2 instance running NGINX accessible via a stable Elastic IP

✅ Static website hosted and publicly available on Amazon S3