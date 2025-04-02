# 🛒 MarketPeak E-Commerce Website Project

## 📌 Project Overview
I was assigned to develop an **e-commerce website** for **MarketPeak**, a new online marketplace featuring **product listings, a shopping cart, and user authentication**. The project involved:

- **Using Git for version control** 🛠️
- **Developing in a Linux environment** 🐧
- **Deploying on an AWS EC2 instance** ☁️

---

## 🔄 Implement Version Control with Git

### 1️⃣ Initialize Git Repository
I started by initializing a Git repository in my project folder:
```sh
git init
```

### 2️⃣ Obtain and Prepare the E-Commerce Website Template
I downloaded a suitable website template and extracted it into my project directory.

### 3️⃣ Stage and Commit the Template to Git
After organizing the template files, I staged and committed them:
```sh
git add .
git commit -m "Initial commit - Added website template"
```

### 4️⃣ Push the Code to GitHub
I created a GitHub repository and pushed the project:
```sh
git remote add origin https://github.com/username/marketpeak.git
git branch -M main
git push -u origin main
```

---

## ☁️ Set Up an AWS EC2 Instance

### 1️⃣ Launching an EC2 Instance
I created an **EC2 instance** using Amazon Linux 2 and connected via SSH:
```sh
ssh -i my-key.pem ec2-user@your-ec2-public-ip
```

### 2️⃣ Cloning the Repository on the Linux Server
Once connected to the instance, I cloned the project:
```sh
git clone https://github.com/username/marketpeak.git
cd marketpeak
```

---

## 🌍 Install and Configure Web Server

### 1️⃣ Install Apache Web Server (`httpd`)
```sh
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
```

### 2️⃣ Configure `httpd` for the Website
I moved my website files to the Apache root directory:
```sh
sudo cp -r * /var/www/html/
```

Restarted the web server:
```sh
sudo systemctl restart httpd
```

### 3️⃣ Access Website from Browser
I copied my **EC2 public IP** and opened it in the browser to view my **MarketPeak** website. 🚀

---

## 🔄 Continuous Integration and Deployment Workflow

### 🛠 Step 1: Developing New Features and Fixes

#### ✅ Create a Development Branch
To work on new features, I created a new branch:
```sh
git checkout -b feature-branch
```

### 🔄 Step 2: Version Control with Git

#### ✅ Stage Changes
After modifying the code, I staged the updates:
```sh
git add .
```

#### ✅ Commit Changes
I committed the updates with a descriptive message:
```sh
git commit -m "Added user authentication feature"
```

#### ✅ Push Changes to GitHub
I pushed the feature branch to GitHub:
```sh
git push origin feature-branch
```

---

## 🎯 Conclusion
Through this project, I **strengthened my Git skills, worked in a Linux environment, and successfully deployed a website on AWS EC2**. The use of **version control, deployment strategies, and server configurations** has enhanced my ability to manage **real-world projects** efficiently. 🚀
