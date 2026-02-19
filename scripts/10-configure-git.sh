#!/bin/bash
# Git Configuration Script
# Configures Git with user details

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== Configuring Git ===${NC}"

git config --global user.name "Amit Anand"
git config --global user.email "dropmaill.amit@gmail.com"
git config --global init.defaultBranch main

echo -e "${GREEN}✓ Git configured${NC}"
echo -e "${YELLOW}Configuration:${NC}"
git config --global --list | grep -E "(user.name|user.email|init.defaultBranch)"
