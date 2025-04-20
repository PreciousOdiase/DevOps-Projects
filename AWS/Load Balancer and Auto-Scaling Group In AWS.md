# 🚀 My AWS Auto Scaling & Load Balancer Project

Hey! 👋 This is a quick documentation of a project I recently worked on, where I built a scalable and highly available web application infrastructure using AWS. I set up an **Auto Scaling Group (ASG)** with an **Application Load Balancer (ALB)** to handle dynamic traffic loads. Here’s how it all came together.

---

## 🧠 Why I Did This

I wanted to make sure my web app could handle traffic spikes, recover from instance failures, and stay up without manual babysitting. Auto Scaling + Load Balancer was the perfect combo.

---

## 🧰 Tools I Used

- EC2 Launch Template (for instance config)
- Auto Scaling Group
- Application Load Balancer
- Target Group with health checks
- CloudWatch for monitoring

---

## 🧱 Step 1: Launch Template

First up, I created a **Launch Template** to define how EC2 instances should be spun up.

### What I included:

- Amazon Linux 2 AMI
- `t2.micro` instance type (for testing)
- Security Group allowing HTTP/HTTPS/SSH
- A simple user-data script to install Apache and serve a test page

![Launch Template](images/launch-template.png)

---

## 🔁 Step 2: Auto Scaling Group Setup

Then I created an Auto Scaling Group tied to that launch template.

### Config highlights:

- VPC with public subnets in 2 AZs
- Desired capacity: 2
- Min: 1 | Max: 4
- Scaling policy based on average CPU (target: 50%)

![Auto Scaling Group](images/auto-scaling-group.png)

---

## ⚖️ Step 3: Load Balancer Time!

I set up an **Application Load Balancer** to distribute traffic evenly across instances in the ASG.

### My ALB setup:

- Internet-facing
- HTTP listener on port 80
- Attached to public subnets in both AZs
- Security Group allowing HTTP from anywhere

Then I created a **Target Group** for the ALB and registered my instances (automatically handled by ASG).

![Application Load Balancer](images/load-balancer.png)

---

## 🔗 Step 4: Hooking ASG to ALB

During the ASG setup, I connected it to the ALB's target group. This way, when new instances are launched or terminated, the ALB knows exactly where to send traffic.

![Attach Target Group](images/attach-target-group.png)

---

## 🧪 Step 5: Testing It Out

To test the setup:

- I accessed the ALB DNS — and boom 💥 my app loaded!
- Simulated traffic using stress tools — scaling kicked in!
- Terminated an instance manually — ASG replaced it automatically!

![Testing Setup](images/test-scaling.png)

---

## 📊 Step 6: Monitoring

I used **CloudWatch** to monitor metrics like CPU usage and instance health. It also helped me confirm when scaling events were triggered.

![CloudWatch Monitoring](images/cloudwatch.png)

---




