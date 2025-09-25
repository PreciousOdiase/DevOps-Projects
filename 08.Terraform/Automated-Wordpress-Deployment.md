# WordPress Deployment on AWS with Terraform

## Overview

This project automates the deployment of a WordPress website on AWS using Terraform. It provisions:

- VPC with public and private subnets

- RDS MySQL database for WordPress

- EFS (Elastic File System) for shared storage

- EC2 web servers using Launch Templates and Auto Scaling Group

- ALB (Application Load Balancer) to distribute traffic

- Security groups for proper access control

The deployment is fully automated, with WordPress installation handled via user data scripts.

## Architecture

1. VPC & Subnets
   Private subnets host the web servers and RDS database, while public subnets can host NAT gateways.

2. EFS
   Shared storage mounted to all WordPress EC2 instances for persistent files.

3. RDS MySQL
   Manages the WordPress database. Credentials are passed via Terraform variables and user data scripts.

4. EC2 + Auto Scaling
   Launch Templates define instance configurations. ASG ensures desired capacity and automatic replacement on updates.

5. ALB
   Distributes traffic to web servers. Health checks ensure only healthy instances receive traffic.

```css
project/
├── backend/
│   ├── main.tf
│   ├── state.tf
│   └── terraform.tf
├── environments/
│   ├── production/
│   └── staging/
├── modules/
│   ├── alb/
│   ├── efs/
│   ├── rds/
│   ├── security/
│   ├── scripts/
│   ├── vpc/
│   └── webserver/
└── README.md
```

- modules/ contains reusable Terraform modules.

- scripts/ contains the WordPress user data script (wordpress_userdata.sh.tpl) for EC2 instances.

- environments/ contains environment-specific Terraform configurations.

## Setup Steps

### 1. Configure Terraform Variables

Set up variables for:

- Project name and environment

- VPC, subnets, and security groups

- RDS database credentials

- EFS ID

- EC2 instance type and AMI

Example terraform.tfvars:

```hcl
project     = "wordpress"
environment = "staging"
vpc_id      = "vpc-xxxxxxx"
subnet_ids  = ["subnet-xxxxxx", "subnet-yyyyyy"]
efs_sg_id   = "sg-xxxxxx"

db_name     = "wordpress"
db_user     = "wp_user"
db_pass     = "wp_password"
db_host     = "rds-endpoint.amazonaws.com"
```

### 2. Deploy Infrastructure

```hcl
terraform init
terraform plan
terraform apply
```

Terraform will provision all resources in the correct order:

1. VPC and subnets

2. Security groups

3. EFS filesystem and mount targets

4. RDS database

5. ALB and target group

6. EC2 instances in ASG with user data script

### 3. Configure WordPress (via User Data)

The Launch Template passes variables to the WordPress installation script:

```bash
#!/bin/bash
set -xe

# Update system
dnf update -y

# Install Apache, PHP, MySQL client, EFS utils
dnf install -y httpd php php-mysqlnd amazon-efs-utils mysql

# Start Apache
systemctl enable httpd
systemctl start httpd

# Mount EFS
mkdir -p /var/www/html
efs_id="${efs_id}"
mount -t efs -o tls $efs_id:/ /var/www/html

# Download WordPress if not present
if [ ! -f /var/www/html/wp-config.php ]; then
    cd /var/www/html
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz --strip-components=1
    rm latest.tar.gz
fi

# Configure WordPress
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/$db_name/" wp-config.php
sed -i "s/username_here/$db_user/" wp-config.php
sed -i "s/password_here/$db_pass/" wp-config.php
sed -i "s/localhost/$db_host/" wp-config.php

# Set permissions and restart Apache
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html
systemctl restart httpd

```

### 4. Accessing WordPress

Once the infrastructure is deployed:

Get the ALB DNS name:

terraform output alb_dns_name

Open the DNS in a browser:

http://staging-alb-alb-885990705.us-east-1.elb.amazonaws.com

Complete WordPress setup (site title, admin user, etc.).

### 5. Common Issues

1. Unhealthy target group instances:

- Usually due to Apache not running on EC2 instances or EFS not mounted.

- Check cloud-init logs:

```bash
sudo journalctl -u cloud-init -b
```

- Ensure user data script ran successfully.

2. Missing httpd service:

- Make sure the user data installs Apache (dnf install -y httpd) before starting it.

3. EFS mount issues:

- Check security group allows NFS traffic on port 2049.

- Check subnets are private and reachable from EC2.
