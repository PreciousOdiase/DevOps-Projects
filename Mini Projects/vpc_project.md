# 🌐 Virtual Private Cloud (VPC) Project

## 📌 Project Overview
In this project, I gained hands-on experience in **setting up and configuring a Virtual Private Cloud (VPC)** on AWS. This included:

- Creating a **VPC** and configuring **subnets** 🏗️  
- Setting up an **Internet Gateway** for external access 🌍  
- Configuring **routing tables** for traffic flow 🚦  
- Enabling outbound internet with a **NAT Gateway** 🌐  
- Establishing **VPC Peering connections** for inter-VPC communication 🔗  

---

## 1️⃣ Setting Up a Virtual Private Cloud (VPC)

I started by creating a **custom VPC** using the AWS Management Console:

- Navigated to **VPC Dashboard**  
- Clicked **Create VPC** and named it **MyCustomVPC**  
- Chose an **IPv4 CIDR block** (e.g., `10.0.0.0/16`)  
- Enabled **DNS resolution** and **hostnames**  

💡 **Key Takeaway**: A VPC is an isolated network within AWS that provides full control over networking.

---

## 2️⃣ Configuring Subnets within the VPC

Subnets divide the VPC into smaller networks:

- Created a **Public Subnet** (`10.0.1.0/24`) in **us-east-1a**  
- Created a **Private Subnet** (`10.0.2.0/24`) in **us-east-1b**  

💡 **Key Takeaway**: Public subnets allow internet access, while private subnets are isolated.

---

## 3️⃣ Creating an Internet Gateway and Attaching it to the VPC

An **Internet Gateway (IGW)** enables communication between the VPC and the internet:

- Created an **Internet Gateway**  
- Attached it to **MyCustomVPC**  

💡 **Key Takeaway**: Without an IGW, instances in public subnets cannot access the internet.

---

## 4️⃣ Enabling Internet Connectivity with Routing Tables

To direct traffic, I updated the **Route Table**:

- Created a new **Route Table**  
- Added a route: `0.0.0.0/0 → Internet Gateway`  
- Associated it with the **Public Subnet**  

💡 **Key Takeaway**: Routing tables determine how traffic flows within the VPC.

---

## 5️⃣ Enabling Outbound Internet Access through a NAT Gateway

To allow instances in the **Private Subnet** to access the internet:

- Created a **NAT Gateway** in the **Public Subnet**  
- Attached an **Elastic IP**  
- Updated the **Private Subnet Route Table** with `0.0.0.0/0 → NAT Gateway`  

💡 **Key Takeaway**: A NAT Gateway allows outbound traffic from private subnets while keeping them secure.

---

## 6️⃣ Establishing VPC Peering Connections

To enable communication between two VPCs:

- Created a **VPC Peering Connection** between **MyCustomVPC** and another VPC  
- Accepted the connection request  
- Updated **route tables** in both VPCs for intercommunication  

💡 **Key Takeaway**: VPC Peering allows secure, private communication between VPCs without internet exposure.

---

## 🎯 Conclusion

Through this project, I **mastered AWS VPC networking** by setting up **subnets, internet access, NAT Gateway, and VPC peering**. This knowledge is **crucial for cloud architecture and security**. 🚀  
