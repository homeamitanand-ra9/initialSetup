#!/bin/bash
# Python Tools Installation Script
# Installs Python development tools

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== Installing Python Tools ===${NC}"

sudo apt install -y python3-pip python3-venv python3-dev

echo -e "${GREEN}✓ Python tools installed${NC}"
