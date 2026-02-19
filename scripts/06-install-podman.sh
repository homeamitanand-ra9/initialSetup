#!/bin/bash
# Podman Installation Script
# Installs Podman container engine

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== Installing Podman ===${NC}"

sudo apt install -y podman

echo -e "${GREEN}✓ Podman installed${NC}"
echo -e "${YELLOW}Test with: podman run hello-world${NC}"
