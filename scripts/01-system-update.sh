#!/bin/bash
# System Update Script
# Updates system packages and installs build essentials

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== System Update ===${NC}"
echo -e "${YELLOW}Updating system packages...${NC}"

sudo apt update && sudo apt upgrade -y

echo -e "${YELLOW}Installing build essentials...${NC}"
sudo apt install -y build-essential curl wget git

echo -e "${GREEN}✓ System updated and build tools installed${NC}"
