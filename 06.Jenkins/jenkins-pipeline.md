# Jenkins Pipeline Project Showcase

This guide demonstrates how to set up and manage a **Jenkins Pipeline Project**. We'll walk through creating a pipeline job, configuring triggers, writing the pipeline script, installing Docker, and finally building the project using the pipeline.

---

## Creating a Pipeline Job

1. Open the **Jenkins dashboard**.
2. Click **New Item**.
3. Enter a name for your job (e.g., `my-pipeline-project`).
4. Select **Pipeline** and click **OK**.
5. In the configuration screen, provide a short **description** (optional).

![Create Pipeline Job](https://example.com/images/create-pipeline-job.png)

---

## Configuring Build Triggers

To automate your pipeline:

1. Scroll to the **Build Triggers** section.
2. Check the option **GitHub hook trigger for GITScm polling** if using GitHub.
3. Alternatively, use **Poll SCM** with a cron syntax (e.g., `H/5 * * * *`) for polling every 5 minutes.

![Configure Build Trigger](https://example.com/images/configure-build-trigger.png)

---

## Writing Jenkins Pipeline Script

You can write your pipeline using the **Declarative Pipeline Syntax** directly in the Jenkins UI or by referencing a `Jenkinsfile` from your repository.

**Example Script:**

```groovy
pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/your-username/your-repo.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
            }
        }
    }
}
```

## Installing Docker

To build Docker images or run containers in your pipeline:

Install Docker on your Jenkins server:

```bash
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl status docker
```

```bash
# Verify Docker access in Jenkins:
docker version

# Add Jenkins user to Docker
sudo usermod -aG docker jenkins
```

Install Docker Pipeline Plugin in Jenkins (Manage Jenkins > Manage Plugins > Available).

## Building Pipeline Script

To include Docker in your pipeline:

Example:

```groovy
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("my-app-image")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    dockerImage.run('-p 8080:8080')
                }
            }
        }
    }
}
```

## Summary

By following the above steps, you can:

Create and configure a Jenkins Pipeline job.

Automate builds with triggers.

Use Docker for building and running containers.

Maintain CI/CD pipelines using simple Groovy-based scripts.
