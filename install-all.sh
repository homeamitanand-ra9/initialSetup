#!/bin/bash
# Master Installation Script
# Runs all installation scripts in order

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${GREEN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║     Pop!_OS Development Environment Setup             ║${NC}"
echo -e "${GREEN}║     Complete Installation                              ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Function to run script
run_script() {
    local script=$1
    local name=$2
    
    echo ""
    echo -e "${YELLOW}▶ Running: $name${NC}"
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    
    if bash "$SCRIPT_DIR/scripts/$script"; then
        echo -e "${GREEN}✓ $name completed${NC}"
    else
        echo -e "${RED}✗ $name failed${NC}"
        exit 1
    fi
}

# Run all scripts in order
run_script "01-system-update.sh" "System Update"
run_script "02-install-zsh.sh" "Zsh Installation"
run_script "03-install-version-managers.sh" "Version Managers"
run_script "04-install-databases.sh" "Databases"
run_script "05-install-docker.sh" "Docker"
run_script "06-install-podman.sh" "Podman"
run_script "07-install-kubernetes.sh" "Kubernetes Tools"
run_script "08-install-cli-tools.sh" "CLI Tools"
run_script "09-install-python-tools.sh" "Python Tools"
run_script "10-configure-git.sh" "Git Configuration"

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║     Installation Complete!                             ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "1. Log out and log back in (for shell and group changes)"
echo "2. Install language versions:"
echo "   source ~/.gvm/scripts/gvm && gvm install go1.21.6 -B"
echo "   source ~/.nvm/nvm.sh && nvm install --lts"
echo "3. Test Docker: docker run hello-world"
echo "4. Test Kubernetes: minikube start"
echo ""
echo -e "${GREEN}Happy coding! 🚀${NC}"
