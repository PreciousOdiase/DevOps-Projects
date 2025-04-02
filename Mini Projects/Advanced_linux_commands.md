# 🐧 Advanced Linux Commands: File Permissions & User Management

## 📌 Introduction
Learning advanced Linux commands has deepened my understanding of **file permissions, access rights, user management, and superuser privileges**. These concepts are crucial for maintaining security and ensuring proper access control on a Linux system.

---

## 🔒 1. Understanding File Permissions & Access Rights
Every file and directory in Linux has **three types of access rights**:

| Permission | Symbol | Numeric Value | Description |
|------------|--------|--------------|-------------|
| Read       | `r`    | 4            | View the contents of a file or directory |
| Write      | `w`    | 2            | Modify or delete a file |
| Execute    | `x`    | 1            | Run a file as a program or enter a directory |

Each file has **three levels of ownership**:
- **User (Owner)**: The person who created the file.
- **Group**: Users belonging to a specific group.
- **Others**: Anyone else on the system.

To view file permissions, use:
```sh
ls -l
```

Example output:
```sh
-rw-r--r--  1 user group  1234 Mar 10 10:00 file.txt
```
- The first character (`-`) indicates a file (`d` would mean a directory).
- `rw-` (User: Read & Write), `r--` (Group: Read), `r--` (Others: Read).

📌 **Key Learning**: Understanding these permissions helps prevent unauthorized access.

---

## 🔢 2. Numeric Representation of Permissions
Permissions can also be represented numerically using the **chmod numeric mode**:

| Permission | Numeric Value |
|------------|--------------|
| `rwx` (Read, Write, Execute) | `7` |
| `rw-` (Read, Write) | `6` |
| `r--` (Read only) | `4` |

To set specific permissions:
```sh
chmod 755 myfile.txt
```
This gives:
- **User**: Read, Write, Execute (`7`)
- **Group**: Read, Execute (`5`)
- **Others**: Read, Execute (`5`)

📌 **Key Learning**: Numeric mode simplifies setting multiple permissions at once.

---

## 🛠 3. File Permission Commands
- **Change permissions using `chmod`**:
  ```sh
  chmod u+x script.sh  # Give execute permission to the user (owner)
  chmod g-w myfile.txt  # Remove write permission from the group
  ```

- **Change ownership using `chown`**:
  ```sh
  sudo chown newuser myfile.txt  # Change owner of a file
  sudo chown -R newuser:newgroup mydir/  # Change owner and group for a directory
  ```

📌 **Key Learning**: `chmod` and `chown` are essential for managing file security.

---

## 🔑 4. Superuser Privileges (`sudo`)
The `sudo` command allows a regular user to execute administrative commands.

- Check if a user has sudo privileges:
  ```sh
  sudo -l
  ```

- Switch to the root user:
  ```sh
  sudo su
  ```

- Execute a command as root:
  ```sh
  sudo apt update  # Debian-based
  sudo yum update  # Red Hat-based
  ```

📌 **Key Learning**: Only grant **sudo access** to trusted users for security reasons.

---

## 👤 5. User Management on Linux
To manage users, I learned the following commands:

- **Create a new user**:
  ```sh
  sudo useradd -m newuser
  ```

- **Set a password for the user**:
  ```sh
  sudo passwd newuser
  ```

- **Add the user to the sudo group** (for admin access):
  ```sh
  sudo usermod -aG sudo newuser  # Debian-based
  sudo usermod -aG wheel newuser  # Red Hat-based
  ```

📌 **Key Learning**: Adding users correctly ensures security and controlled access.

---

## 🔄 6. Modifying User Accounts
- **Change a username**:
  ```sh
  sudo usermod -l newname oldname
  ```

- **Change a user's home directory**:
  ```sh
  sudo usermod -d /home/newdir -m username
  ```

- **Lock a user account**:
  ```sh
  sudo passwd -l username
  ```

📌 **Key Learning**: `usermod` is useful for modifying user attributes.

---

## 🗑 7. Deleting a User
To remove a user from the system:

- **Delete a user account** (without removing their home directory):
  ```sh
  sudo userdel username
  ```

- **Delete a user and their home directory**:
  ```sh
  sudo userdel -r username
  ```

📌 **Key Learning**: Always ensure a user’s data is backed up before deletion.

---

## 🎯 Conclusion
Mastering **file permissions, superuser privileges, and user management** has significantly improved my Linux administration skills. These commands are **essential for security, access control, and system management**. 🚀

