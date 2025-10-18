## Prerequisites
Ensure you have the following prerequisites installed:
- A compatible version of Go, Homebrew (for macOS), or curl for downloading binaries
- A system with virtualization support (for Minikube)

### 1. Install kubectl
On macOS (via Homebrew)
```
brew install kubectl
```
On Linux (via curl)
``` bash
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```
Verify kubectl
``` bash
kubectl version --client
```

### 2. Install Kustomize
Using Homebrew (macOS/Linux)
```
brew install kustomize
```
Download Binary (cross-platform)
```
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
sudo mv kustomize /usr/local/bin/
```
Verify Kustomize
```
kustomize version
```

On macOS (via Homebrew)
```bash
brew install minikube
```
On Linux (via curl)
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
Verify Minikube
``` bash
minikube version
```
```bash
minikube start
```

This will start a local Kubernetes cluster using your default hypervisor (e.g., VirtualBox, Docker, HyperKit).

You can check the status of your cluster:
```bash
minikube status
```
### 5. Test kubectl with Minikube

Check nodes:
``` bash
kubectl get nodes
```
