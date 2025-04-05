# Single Endpoint Architecture: EC2 and S3 Integration

This document outlines the key learnings and steps taken to implement a Single Endpoint Architecture using AWS EC2 and S3 services. The project involved hosting a web application on EC2 while using S3 for static assets, with a reverse proxy configuration to unify access through a single endpoint.

---

## Setting up the EC2 Instance

![EC2 Instance Setup](images/ec2-setup.png)

1. **Launching the Instance**:
   - Selected an Amazon Linux 2 AMI with t2.micro instance type for cost efficiency
   - Configured security groups to allow:
     - SSH (port 22)
     - HTTP (port 80)
     - Custom application port (if needed)

2. **Application Deployment**:
   ```bash
   # Example deployment commands
   sudo yum install -y nodejs
   npm install
   pm2 start app.js

Key Learning: IAM roles for EC2 eliminate the need for storing AWS credentials in configuration files.

Creating S3 Bucket
S3 Bucket Creation

Bucket Configuration:

Naming: project-name-assets-[region]

Region: Matched with EC2 instance location

Versioning: Enabled for backup recovery

Access Configuration:

json
Copy
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::bucket-name/*"
    }
  ]
}
Key Learning: Bucket policies require explicit resource ARNs including the /* suffix for object access.

Configuring S3 Bucket for Web Hosting
S3 Web Hosting

Static Website Hosting:

Enabled via S3 console > Properties

Set default documents:

Index document: index.html

Error document: 404.html (optional)

CORS Configuration:

xml
Copy
<CORSConfiguration>
  <CORSRule>
    <AllowedOrigin>https://yourdomain.com</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
    <AllowedHeader>*</AllowedHeader>
  </CORSRule>
</CORSConfiguration>
Run HTML
Key Learning: CORS headers must be explicitly set for web applications fetching S3 resources.

Configuring Nginx as a Reverse Proxy
Reverse Proxy Diagram

/etc/nginx/conf.d/reverse-proxy.conf:

nginx
Copy
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
    }

    location /assets/ {
        proxy_pass https://s3.amazonaws.com/your-bucket/;
        proxy_set_header Host s3.amazonaws.com;
    }
}
Key Learning: Proxy headers must be properly set to preserve request information.

Testing and Validation
1. Direct Application Access
Direct Access Test

Accessed via Elastic IP: http://<EC2_IP>:<PORT>

Verified:

Application responds with 200 OK

Core functionality works without proxy

No mixed-content errors in console

2. Reverse Proxy Validation
bash
Copy
curl -I http://localhost
# Expected:
# HTTP/1.1 200 OK
# Server: nginx/1.18.0
3. S3 Asset Access Test
bash
Copy
curl https://s3.amazonaws.com/your-bucket/image.png
# Should return binary data with:
# Content-Type: image/png
Lessons Learned
