#!/bin/bash
# Version Managers Installation Script
# Installs GVM, NVM, and Rustup

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== Installing Version Managers ===${NC}"

# Install GVM (Go Version Manager)
echo -e "${YELLOW}Installing GVM...${NC}"
sudo apt install -y bison
if [ ! -d "$HOME/.gvm" ]; then
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
fi

# Install NVM (Node Version Manager)
echo -e "${YELLOW}Installing NVM...${NC}"
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

# Install Rust
echo -e "${YELLOW}Installing Rust...${NC}"
if ! command -v rustc &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

echo -e "${GREEN}✓ Version managers installed${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo "  source ~/.gvm/scripts/gvm && gvm install go1.21.6 -B"
echo "  source ~/.nvm/nvm.sh && nvm install --lts"
echo "  source ~/.cargo/env"
