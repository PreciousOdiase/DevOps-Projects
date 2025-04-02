#!/bin/bash

# IAM Users List
IAM_USERS=("Alice" "Bob" "Charlie" "Dave" "Eve")

# Function to create IAM users
create_users() {
  for user in "${IAM_USERS[@]}"; do
    aws iam create-user --user-name "$user"
    echo "Created IAM User: $user"
  done
}

# Function to create IAM group
create_group() {
  aws iam create-group --group-name admin
  echo "Created IAM Group: admin"
}

# Function to attach the AdministratorAccess policy to the admin group
attach_policy() {
  aws iam attach-group-policy --group-name admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
  echo "Attached AdministratorAccess policy to admin group."
}

# Function to add users to the IAM group
assign_users_to_group() {
  for user in "${IAM_USERS[@]}"; do
    aws iam add-user-to-group --user-name "$user" --group-name admin
    echo "Assigned $user to admin group."
  done
}

# Execute functions in order
create_users
create_group
attach_policy
assign_users_to_group

echo "IAM Automation Completed Successfully!"
