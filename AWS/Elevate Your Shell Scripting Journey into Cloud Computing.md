# Mini Project: Understanding Requirements

## 🎯 Project Goal

Develop a **shell script** to automate the setup of **AWS EC2 instances** and **S3 buckets**, while demonstrating essential shell scripting concepts.

---

## 📚 Shell Scripting Concepts to Implement

### 1. Functions
- Modularize the script using functions.
- Example functions:
  - `create_ec2_instance()`
  - `create_s3_bucket()`
  - `check_deployment_status()`
- Improves code reusability and clarity.

### 2. Arrays
- Use arrays to track created resources.
- Example arrays:
  - List of EC2 instance IDs.
  - Names of created S3 buckets.
- Facilitates easy manipulation and cleanup.

### 3. Environment Variables
- Store sensitive data and config settings using environment variables.
- Examples:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_REGION`
  - Custom variables like `DEFAULT_INSTANCE_TYPE`
- Enhances script portability and security.

### 4. Command Line Arguments
- Accept user input to customize script behavior.
- Examples:
  - `--instance-type t2.micro`
  - `--bucket-name my-sample-bucket`
- Adds flexibility for different scenarios.

### 5. Error Handling
- Implement checks to catch and respond to failures.
- Handle issues like:
  - AWS CLI command errors.
  - Invalid input.
  - Network or permission issues.
- Ensure the script can exit or retry gracefully.

---

