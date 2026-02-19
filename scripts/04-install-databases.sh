#!/bin/bash
# Database Installation Script
# Installs PostgreSQL and MySQL

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== Installing Databases ===${NC}"

# Install PostgreSQL
echo -e "${YELLOW}Installing PostgreSQL...${NC}"
sudo apt install -y postgresql postgresql-contrib
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Install MySQL
echo -e "${YELLOW}Installing MySQL...${NC}"
sudo apt install -y mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql

echo -e "${GREEN}✓ Databases installed${NC}"
echo -e "${YELLOW}PostgreSQL: sudo -u postgres psql${NC}"
echo -e "${YELLOW}MySQL: sudo mysql${NC}"
echo -e "${YELLOW}Secure MySQL: sudo mysql_secure_installation${NC}"
