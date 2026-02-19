#!/bin/bash

# Development Environment Setup Script for Pop!_OS
# This script will guide you through setting up a complete dev environment

set -e  # Exit on error

echo "=================================="
echo "Development Environment Setup"
echo "=================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print section headers
print_section() {
    echo ""
    echo -e "${GREEN}===================================${NC}"
    echo -e "${GREEN}$1${NC}"
    echo -e "${GREEN}===================================${NC}"
    echo ""
}

# Function to print info
print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

# Function to print success
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

# Check if running on Pop!_OS
print_section "Step 1: System Check"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    print_info "Detected OS: $NAME"
else
    print_info "Could not detect OS, continuing anyway..."
fi

# Update system
print_section "Step 2: Updating System"
print_info "This ensures all packages are up to date"
sudo apt update && sudo apt upgrade -y
print_success "System updated"

# Install essential build tools
print_section "Step 3: Installing Build Essentials"
print_info "These are required for compiling software from source"
sudo apt install -y build-essential curl wget git
print_success "Build tools installed"


# Install Zsh
print_section "Step 4: Installing Zsh"
print_info "Zsh is a powerful shell with better features than bash"
print_info "Features: better tab completion, themes, plugins, and more"
sudo apt install -y zsh
print_success "Zsh installed"

# Install Oh My Zsh
print_section "Step 5: Installing Oh My Zsh"
print_info "Oh My Zsh is a framework for managing Zsh configuration"
print_info "It provides themes, plugins, and helpful aliases"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_success "Oh My Zsh installed"
else
    print_info "Oh My Zsh already installed"
fi

# Install zsh-autosuggestions
print_section "Step 6: Installing Zsh Autosuggestions"
print_info "This plugin suggests commands as you type (in gray)"
print_info "It learns from your command history"
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    print_success "Zsh autosuggestions installed"
else
    print_info "Zsh autosuggestions already installed"
fi

# Install zsh-syntax-highlighting
print_section "Step 7: Installing Zsh Syntax Highlighting"
print_info "This plugin highlights commands in real-time"
print_info "Valid commands = green, invalid = red"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    print_success "Zsh syntax highlighting installed"
else
    print_info "Zsh syntax highlighting already installed"
fi

# Configure .zshrc
print_section "Step 8: Configuring Zsh"
print_info "Enabling plugins in .zshrc"
if [ -f "$HOME/.zshrc" ]; then
    # Backup original .zshrc
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Update plugins line
    sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "$HOME/.zshrc"
    print_success "Zsh configured with plugins"
else
    print_info "No .zshrc found, will be created on first Zsh launch"
fi


# Install GVM (Go Version Manager)
print_section "Step 9: Installing GVM (Go Version Manager)"
print_info "GVM allows you to install and switch between multiple Go versions"
print_info "Similar to nvm for Node.js"
sudo apt install -y bison
if [ ! -d "$HOME/.gvm" ]; then
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    print_success "GVM installed"
    print_info "After this script, run: source ~/.gvm/scripts/gvm"
    print_info "Then install Go: gvm install go1.21.6 -B && gvm use go1.21.6 --default"
else
    print_info "GVM already installed"
fi

# Install NVM (Node Version Manager)
print_section "Step 10: Installing NVM (Node Version Manager)"
print_info "NVM allows you to install and switch between multiple Node.js versions"
print_info "Essential for working on different projects with different Node requirements"
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    
    # Load NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    print_success "NVM installed"
    print_info "After this script, run: nvm install --lts"
    print_info "This installs the latest Long Term Support version of Node.js"
else
    print_info "NVM already installed"
fi

# Install Rust
print_section "Step 11: Installing Rust"
print_info "Rust is a systems programming language focused on safety and performance"
print_info "Rustup manages Rust versions and associated tools"
if ! command -v rustc &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    print_success "Rust installed"
    print_info "Cargo (Rust package manager) is also installed"
else
    print_info "Rust already installed"
fi


# Install PostgreSQL
print_section "Step 12: Installing PostgreSQL"
print_info "PostgreSQL is a powerful, open-source relational database"
print_info "Known for reliability, feature robustness, and performance"
sudo apt install -y postgresql postgresql-contrib
sudo systemctl start postgresql
sudo systemctl enable postgresql
print_success "PostgreSQL installed and started"
print_info "Default user: postgres"
print_info "To access: sudo -u postgres psql"

# Install MySQL
print_section "Step 13: Installing MySQL"
print_info "MySQL is one of the most popular relational databases"
print_info "Widely used in web applications"
sudo apt install -y mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql
print_success "MySQL installed and started"
print_info "Run 'sudo mysql_secure_installation' to secure your installation"
print_info "To access: sudo mysql"

# Install Podman
print_section "Step 14: Installing Podman"
print_info "Podman is a daemonless container engine (Docker alternative)"
print_info "Runs containers without root privileges (more secure)"
print_info "Compatible with Docker commands (alias docker=podman)"
sudo apt install -y podman
print_success "Podman installed"
print_info "Try: podman run hello-world"

# Install additional developer tools
print_section "Step 15: Installing Additional Developer Tools"
print_info "Installing useful CLI tools for development"

# Install jq (JSON processor)
sudo apt install -y jq
print_info "jq: Command-line JSON processor"

# Install htop (system monitor)
sudo apt install -y htop
print_info "htop: Interactive process viewer"

# Install tree (directory visualization)
sudo apt install -y tree
print_info "tree: Display directory structure"

# Install neovim
sudo apt install -y neovim
print_info "neovim: Modern vim-based text editor"

# Install ripgrep (fast grep alternative)
sudo apt install -y ripgrep
print_info "ripgrep (rg): Fast search tool"

# Install fd-find (fast find alternative)
sudo apt install -y fd-find
print_info "fd: Fast and user-friendly alternative to find"

# Install bat (cat with syntax highlighting)
sudo apt install -y bat
print_info "bat: Cat clone with syntax highlighting"

# Install tldr (simplified man pages)
sudo apt install -y tldr
print_info "tldr: Simplified and community-driven man pages"

print_success "Additional tools installed"


# Install Python tools
print_section "Step 16: Installing Python Development Tools"
print_info "Python is usually pre-installed on Pop!_OS"
sudo apt install -y python3-pip python3-venv python3-dev
print_success "Python tools installed"
print_info "pip: Python package manager"
print_info "venv: Virtual environment support"

# Install Docker (optional)
print_section "Step 17: Docker Installation (Optional)"
read -p "Do you want to install Docker alongside Podman? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_info "Installing Docker..."
    sudo apt install -y docker.io docker-compose
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
    print_success "Docker installed"
    print_info "You'll need to log out and back in for group changes to take effect"
else
    print_info "Skipping Docker installation"
fi

# Set Zsh as default shell
print_section "Step 18: Setting Zsh as Default Shell"
read -p "Do you want to set Zsh as your default shell? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    chsh -s $(which zsh)
    print_success "Zsh set as default shell"
    print_info "You'll need to log out and back in for this to take effect"
else
    print_info "Keeping current shell. You can switch to Zsh anytime by running: chsh -s $(which zsh)"
fi

# Final summary
print_section "Installation Complete!"
echo ""
echo "Summary of installed tools:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✓ Zsh with Oh My Zsh"
echo "✓ Zsh plugins: autosuggestions, syntax-highlighting"
echo "✓ GVM (Go Version Manager)"
echo "✓ NVM (Node Version Manager)"
echo "✓ Rust (via rustup)"
echo "✓ PostgreSQL"
echo "✓ MySQL"
echo "✓ Podman"
echo "✓ Developer tools: jq, htop, tree, neovim, ripgrep, fd, bat, tldr"
echo "✓ Python development tools"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Next steps:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "1. Log out and log back in (or restart) for shell changes"
echo "2. Open a new terminal (should be Zsh)"
echo "3. Install Go: gvm install go1.21.6 -B && gvm use go1.21.6 --default"
echo "4. Install Node: nvm install --lts && nvm use --lts"
echo "5. Secure MySQL: sudo mysql_secure_installation"
echo "6. Test Podman: podman run hello-world"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
print_success "Setup script completed successfully!"
