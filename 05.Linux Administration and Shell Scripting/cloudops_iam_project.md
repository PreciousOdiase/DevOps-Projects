# 🌩️ CloudOps IAM Automation on AWS

## 📌 Project Overview

CloudOps Solutions has embraced **AWS** to manage its cloud infrastructure efficiently. As the company expands, **automating IAM (Identity and Access Management)** has become essential to streamline user management for the **DevOps team**. This project focused on **creating IAM users, groups, and assigning permissions** using AWS CLI.

---

## 1️⃣ Script Enhancement

To simplify **IAM user and group management**, we developed a Bash script that:

✅ Automates **IAM user creation**  
✅ Assigns users to a **group**  
✅ Grants **AdministratorAccess** to the group  

By leveraging **AWS CLI**, the script ensures a **scalable and secure** IAM management process.

---

## 2️⃣ Define IAM User Names Array

We stored **IAM usernames** in an array to iterate through them efficiently.

```bash
IAM_USERS=("Alice" "Bob" "Charlie" "Dave" "Eve")
```

This approach allowed **batch processing** for user creation, ensuring consistency.

📷 *Example Output:*  
![IAM User List](https://example.com/iam-user-list.png)

---

## 3️⃣ Create IAM Users

We used **AWS CLI** to iterate through the array and create IAM users:

```bash
for user in "${IAM_USERS[@]}"; do
  aws iam create-user --user-name "$user"
  echo "Created IAM User: $user"
done
```

💡 **Key Takeaway**: Automating IAM user creation reduces manual effort and human errors.

📷 *Example Output:*  
![IAM User Creation](https://example.com/iam-user-creation.png)

---

## 4️⃣ Create IAM Group

A function was defined to create an **IAM group** named `"admin"`:

```bash
aws iam create-group --group-name admin
echo "IAM Group 'admin' created successfully."
```

💡 **Key Takeaway**: IAM groups simplify **permission management** by allowing policies to be assigned at the group level.

📷 *Example Output:*  
![IAM Group](https://example.com/iam-group.png)

---

## 5️⃣ Attach Administrative Policy to Group

We attached the **AdministratorAccess** policy to the **admin** group:

```bash
aws iam attach-group-policy --group-name admin   --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

📷 *Example Output:*  
![IAM Policy Attachment](https://example.com/iam-policy.png)

💡 **Key Takeaway**: **Managed AWS policies** simplify permission assignment while maintaining security best practices.

---

## 6️⃣ Assign Users to Group

Finally, we iterated through the IAM users and added them to the **admin** group:

```bash
for user in "${IAM_USERS[@]}"; do
  aws iam add-user-to-group --user-name "$user" --group-name admin
  echo "Assigned $user to 'admin' group."
done
```

📷 *Example Output:*  
![IAM User to Group](https://example.com/iam-user-group.png)

💡 **Key Takeaway**: Assigning IAM users to groups helps **centralize permissions management**.

---

## 🎯 Conclusion

This **CloudOps IAM Automation** project provided hands-on experience with:

✅ **AWS Identity & Access Management (IAM)**  
✅ **Automating IAM user and group creation**  
✅ **AWS CLI commands for IAM management**  
✅ **Best practices for user access control**  

🚀 **By automating IAM processes, CloudOps Solutions can now onboard new employees faster while maintaining a secure AWS environment!**  
