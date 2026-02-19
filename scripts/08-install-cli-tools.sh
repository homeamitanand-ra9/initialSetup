#!/bin/bash
# CLI Tools Installation Script
# Installs essential developer CLI tools

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== Installing CLI Tools ===${NC}"

sudo apt install -y \
    jq \
    htop \
    tree \
    neovim \
    ripgrep \
    fd-find \
    bat \
    tldr

echo -e "${GREEN}✓ CLI tools installed${NC}"
echo -e "${YELLOW}Note: Use 'fdfind' instead of 'fd' and 'batcat' instead of 'bat'${NC}"
echo -e "${YELLOW}Add aliases to ~/.zshrc:${NC}"
echo "  alias fd='fdfind'"
echo "  alias bat='batcat'"
