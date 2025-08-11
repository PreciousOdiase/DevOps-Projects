# Jenkins Freestyle Job

This document walks through the setup and configuration of a **Jenkins Freestyle Project** integrated with GitHub. The following steps include connecting Jenkins to our Source Code Management, configuring build triggers, and creating a GitHub webhook.

---

## Connecting Jenkins To Our Source Code Management

To connect Jenkins to our SCM (e.g., GitHub), follow these steps:

1. Open Jenkins dashboard.
2. Create a new Freestyle project.
3. In the **Source Code Management** section:
   - Select **Git**.
   - Enter your GitHub repository URL.
   - Add credentials if your repository is private.

**Example:**

```bash
https://github.com/your-username/your-repo.git
```

Optionally, specify the branch to build (default is \*/main).

---

# Configure Build Trigger

To automate builds on code changes, configure build triggers:

Go to the Build Triggers section of your Freestyle project.

Check the option GitHub hook trigger for GITScm polling.

This ensures Jenkins listens for webhook calls from GitHub and initiates a build automatically.

---

# Create GitHub Webhook

Next, set up a GitHub webhook to notify Jenkins of repository changes:

Go to your GitHub repository.

Navigate to Settings > Webhooks.

Click Add webhook.

In the Payload URL, enter your Jenkins webhook endpoint. Typically:

```bash
http://<your-jenkins-domain>/github-webhook/
```

Set Content type to application/json.

Choose to send the webhook on Just the push event.

Save the webhook.

After this, any git push to the repository will trigger the Jenkins job.

---

# Summary

With these configurations:

Jenkins pulls source code from GitHub.

Automatically triggers builds via webhook.

Keeps your project continuously integrated and up to date.
