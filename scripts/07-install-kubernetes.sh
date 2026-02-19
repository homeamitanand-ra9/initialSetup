#!/bin/bash
# Kubernetes Tools Installation Script
# Installs kubectl, minikube, k9s, and helm

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== Installing Kubernetes Tools ===${NC}"

# Install kubectl
echo -e "${YELLOW}Installing kubectl...${NC}"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Install minikube
echo -e "${YELLOW}Installing minikube...${NC}"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# Install k9s (Kubernetes CLI UI)
echo -e "${YELLOW}Installing k9s...${NC}"
K9S_VERSION=$(curl -s https://api.github.com/repos/derailed/k9s/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -LO "https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_amd64.tar.gz"
tar -xzf k9s_Linux_amd64.tar.gz
sudo install -o root -g root -m 0755 k9s /usr/local/bin/k9s
rm k9s k9s_Linux_amd64.tar.gz LICENSE README.md

# Install Helm
echo -e "${YELLOW}Installing Helm...${NC}"
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo -e "${GREEN}✓ Kubernetes tools installed${NC}"
echo -e "${YELLOW}Installed:${NC}"
echo "  - kubectl: $(kubectl version --client --short 2>/dev/null || echo 'installed')"
echo "  - minikube: $(minikube version --short 2>/dev/null || echo 'installed')"
echo "  - k9s: $(k9s version --short 2>/dev/null || echo 'installed')"
echo "  - helm: $(helm version --short 2>/dev/null || echo 'installed')"
echo ""
echo -e "${YELLOW}Start minikube: minikube start${NC}"
echo -e "${YELLOW}Use k9s: k9s${NC}"
