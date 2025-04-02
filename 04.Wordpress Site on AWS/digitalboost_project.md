# 🚀 DigitalBoost WordPress Deployment on AWS

## 📌 Project Overview
This project involved designing and implementing a **high-performance, scalable, and cost-effective** WordPress solution for **DigitalBoost**, a digital marketing agency. The goal was to leverage **AWS services** such as **VPC, EC2, RDS, EFS, Load Balancing, and Auto Scaling** to build a **secure and efficient** infrastructure.

---

## 1️⃣ VPC Setup 

### 1.1 IP Address Range Definition 
- Defined an IP address range for the VPC (`10.0.0.0/16`), ensuring flexibility for subnetting.
- Used **CIDR notation** to allow efficient IP allocation.

💡 **Key Takeaway**: Proper IP addressing ensures efficient network segmentation.

### 1.2 VPC Creation 
- Created a **VPC** named `DigitalBoostVPC`.
- Configured both **public** and **private** subnets for better security and resource isolation.

💡 **Key Takeaway**: A well-structured VPC improves network management and security.

### 1.3 Route Table Configuration
- Configured **route tables** to direct internet traffic through an **Internet Gateway (IGW)**.
- Associated different **subnets** with the correct route tables.

💡 **Key Takeaway**: Route tables define network paths for internet and internal traffic.

---

## 2️⃣ Public and Private Subnet with NAT Gateway 
### 2.1 Public Subnet Setup
- Created a **Public Subnet (`10.0.1.0/24`)** for internet-facing resources.
- Attached the **Internet Gateway (IGW)** to enable external access.

### 2.2 Private Subnet Setup 
- Created a **Private Subnet (`10.0.2.0/24`)** for internal resources like RDS.
- Restricted direct internet access for security.

### 2.3 NAT Gateway Configuration
- Set up a **NAT Gateway** in the **Public Subnet** to allow outbound internet access for private resources.
- Updated **route tables** to direct private subnet traffic through the NAT Gateway.

💡 **Key Takeaway**: A **NAT Gateway** allows instances in private subnets to access the internet **without exposing** them.

---

## 3️⃣ AWS MySQL RDS Setup 

### 3.1 RDS Instance Creation 
- Launched an **Amazon RDS (MySQL) instance** for WordPress database storage.
- Configured it in a **private subnet** for enhanced security.

### 3.2 Security Group Configuration 
- Created a **Security Group** to allow WordPress EC2 instances to connect to RDS.
- Limited access using **port 3306** (MySQL).

### 3.3 WordPress-RDS Connection 
- Connected WordPress to **Amazon RDS** by configuring the `wp-config.php` file.

💡 **Key Takeaway**: Using **RDS** improves database performance, scalability, and reliability.

---

## 4️⃣ EFS Setup for WordPress Files

### 4.1 EFS File System Creation 
- Created an **AWS Elastic File System (EFS)** to store WordPress files.
- Ensured **multi-AZ availability** for high durability.

### 4.2 Mounting EFS 
- Mounted **EFS** to multiple EC2 instances using the `mount` command.
- Automated mounting via `/etc/fstab` for persistence.

### 4.3 WordPress Configuration 
- Updated **WordPress configuration** to store media and files on **EFS**.

💡 **Key Takeaway**: **EFS** enables multiple EC2 instances to share WordPress files, improving **scalability**.

---

## 5️⃣ Application Load Balancer and Auto Scaling 

### 5.1 ALB Creation 
- Created an **Application Load Balancer (ALB)** to distribute traffic across EC2 instances.

### 5.2 Listener Rules Configuration 
- Configured **listener rules** to route HTTP traffic to the correct target group.

### 5.3 Integration with Auto Scaling 
- Set up an **Auto Scaling Group** to automatically adjust the number of EC2 instances based on traffic.

💡 **Key Takeaway**: ALB + Auto Scaling ensures **high availability and fault tolerance**.

---

## 🎯 Conclusion

By implementing this **AWS-powered WordPress architecture**, DigitalBoost now has a **secure, scalable, and high-performance** online presence. This project provided hands-on experience with:

✅ **VPC networking and subnetting**  
✅ **Public and private subnet design**  
✅ **MySQL RDS database setup and security**  
✅ **Elastic File System (EFS) for shared storage**  
✅ **Load Balancing and Auto Scaling for fault tolerance**  

🚀 **This project reinforced best practices in AWS cloud architecture, security, and scalability!**  
