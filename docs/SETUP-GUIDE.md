# Complete Developer Environment Setup Guide for Pop!_OS

## 📋 Overview

This guide will help you set up a complete development environment on Pop!_OS with Cosmic Desktop. You'll learn what each tool does and why developers need it.

---

## 🚀 Quick Start

```bash
# Make the script executable
chmod +x setup-dev-environment.sh

# Run the setup script
./setup-dev-environment.sh
```

---

## 📚 What Gets Installed & Why

### 1. **Zsh (Z Shell)**
**What it is:** A modern shell that replaces bash  
**Why you need it:**
- Better tab completion (smarter suggestions)
- Powerful plugins and themes
- Better history management
- More customizable than bash

**How to use:**
```bash
# After installation, Zsh becomes your default shell
# Just open a new terminal!
```

---

### 2. **Oh My Zsh**
**What it is:** A framework for managing Zsh configuration  
**Why you need it:**
- Pre-configured themes (makes terminal look nice)
- Easy plugin management
- Hundreds of helpful aliases
- Active community with lots of plugins

**Configuration file:** `~/.zshrc`

---

### 3. **Zsh Autosuggestions**
**What it is:** Plugin that suggests commands as you type  
**Why you need it:**
- Shows suggestions in gray text from your history
- Press → (right arrow) to accept suggestion
- Saves time by not retyping common commands

**Example:**
```
$ git sta█          # You type this
$ git status        # It suggests this (in gray)
```

---

### 4. **Zsh Syntax Highlighting**
**What it is:** Real-time syntax highlighting for commands  
**Why you need it:**
- Valid commands appear in green
- Invalid commands appear in red
- Helps catch typos before running commands

---

### 5. **GVM (Go Version Manager)**
**What it is:** Tool to manage multiple Go versions  
**Why you need it:**
- Different projects may need different Go versions
- Easy to switch between versions
- Keeps your system clean

**Common commands:**
```bash
# Install Go version
gvm install go1.21.6 -B

# Use a specific version
gvm use go1.21.6

# Set default version
gvm use go1.21.6 --default

# List installed versions
gvm list

# List available versions
gvm listall
```

**Why GVM over direct install:**
- Multiple projects, multiple Go versions
- No conflicts between versions
- Easy to test new Go releases

---

### 6. **NVM (Node Version Manager)**
**What it is:** Tool to manage multiple Node.js versions  
**Why you need it:**
- Essential for JavaScript/TypeScript development
- Different projects need different Node versions
- Frontend frameworks often have specific Node requirements

**Common commands:**
```bash
# Install latest LTS (Long Term Support)
nvm install --lts

# Install specific version
nvm install 18.19.0

# Use a version
nvm use 18

# Set default version
nvm alias default 18

# List installed versions
nvm list

# List available versions
nvm list-remote
```

**What is LTS?**
- Long Term Support version
- Most stable and recommended for production
- Gets security updates for longer

---

### 7. **Rust (via Rustup)**
**What it is:** Systems programming language  
**Why you need it:**
- Many modern CLI tools are written in Rust (ripgrep, fd, bat)
- Growing ecosystem for web development (WebAssembly)
- Excellent for performance-critical applications
- Great for learning systems programming

**Common commands:**
```bash
# Update Rust
rustup update

# Check version
rustc --version

# Install a package
cargo install <package-name>

# Create new project
cargo new my-project
```

**What is Cargo?**
- Rust's package manager (like npm for Node)
- Also a build tool
- Manages dependencies

---

### 8. **PostgreSQL**
**What it is:** Advanced relational database  
**Why you need it:**
- Industry standard for web applications
- ACID compliant (reliable transactions)
- Supports JSON, full-text search, and more
- Used by companies like Instagram, Spotify, Reddit

**Common commands:**
```bash
# Access PostgreSQL
sudo -u postgres psql

# Create database
CREATE DATABASE myapp;

# Create user
CREATE USER myuser WITH PASSWORD 'mypassword';

# Grant privileges
GRANT ALL PRIVILEGES ON DATABASE myapp TO myuser;

# List databases
\l

# Connect to database
\c myapp

# List tables
\dt

# Quit
\q
```

**Connection string format:**
```
postgresql://username:password@localhost:5432/database_name
```

---

### 9. **MySQL**
**What it is:** Popular relational database  
**Why you need it:**
- Widely used in web development (LAMP stack)
- Good for learning SQL
- Many legacy projects use it
- Simpler than PostgreSQL for basic use

**Common commands:**
```bash
# Access MySQL
sudo mysql

# Create database
CREATE DATABASE myapp;

# Create user
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';

# Grant privileges
GRANT ALL PRIVILEGES ON myapp.* TO 'myuser'@'localhost';

# Flush privileges
FLUSH PRIVILEGES;

# Show databases
SHOW DATABASES;

# Use database
USE myapp;

# Show tables
SHOW TABLES;

# Exit
EXIT;
```

**Secure your installation:**
```bash
sudo mysql_secure_installation
```

---

### 10. **Podman**
**What it is:** Container engine (Docker alternative)  
**Why you need it:**
- Run containers without root privileges (more secure)
- Compatible with Docker commands
- No daemon required (lighter on resources)
- Better for development on Linux

**Common commands:**
```bash
# Run a container
podman run hello-world

# Run container with port mapping
podman run -p 8080:80 nginx

# List running containers
podman ps

# List all containers
podman ps -a

# Stop container
podman stop <container-id>

# Remove container
podman rm <container-id>

# List images
podman images

# Pull image
podman pull ubuntu

# Build image
podman build -t myapp .
```

**Podman vs Docker:**
- Podman: Daemonless, rootless, more secure
- Docker: More popular, more tutorials available
- Commands are mostly identical

---

### 11. **Developer CLI Tools**

#### **jq** - JSON processor
```bash
# Pretty print JSON
echo '{"name":"John","age":30}' | jq

# Extract field
echo '{"name":"John","age":30}' | jq '.name'

# Filter array
echo '[{"name":"John"},{"name":"Jane"}]' | jq '.[0]'
```

#### **htop** - System monitor
```bash
# Run htop
htop

# Shows: CPU usage, memory, processes
# Press F10 or q to quit
```

#### **tree** - Directory visualization
```bash
# Show directory structure
tree

# Limit depth
tree -L 2

# Show hidden files
tree -a
```

#### **neovim** - Modern text editor
```bash
# Open file
nvim filename.txt

# Basic commands:
# i - insert mode
# Esc - normal mode
# :w - save
# :q - quit
# :wq - save and quit
```

#### **ripgrep (rg)** - Fast search
```bash
# Search in files
rg "search term"

# Search specific file types
rg "search term" -t js

# Case insensitive
rg -i "search term"
```

#### **fd** - Fast find
```bash
# Find files
fd filename

# Find by extension
fd -e js

# Find in specific directory
fd filename /path/to/dir
```

#### **bat** - Cat with syntax highlighting
```bash
# View file with syntax highlighting
bat filename.js

# Show line numbers
bat -n filename.js
```

#### **tldr** - Simplified man pages
```bash
# Get quick examples
tldr tar
tldr git
tldr docker
```

---

## 🔧 Post-Installation Setup

### 1. Configure Zsh Autosuggestions Color

Edit `~/.zshrc` and add:
```bash
# Make autosuggestions gray (default is too dark)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
```

### 2. Add Useful Aliases

Add to `~/.zshrc`:
```bash
# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'

# Docker/Podman
alias docker='podman'  # Use podman with docker commands

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lah'

# Development
alias serve='python3 -m http.server'  # Quick HTTP server
```

### 3. Install Go

```bash
# Source GVM
source ~/.gvm/scripts/gvm

# Install Go (binary version for faster install)
gvm install go1.21.6 -B

# Use it
gvm use go1.21.6 --default

# Verify
go version
```

### 4. Install Node.js

```bash
# Install LTS version
nvm install --lts

# Use it
nvm use --lts

# Verify
node --version
npm --version
```

### 5. Configure Git

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main
```

---

## 🎨 Customize Your Terminal

### Change Zsh Theme

Edit `~/.zshrc`:
```bash
# Change this line
ZSH_THEME="robbyrussell"  # Default

# Popular themes:
# ZSH_THEME="agnoster"     # Powerline style
# ZSH_THEME="powerlevel10k/powerlevel10k"  # Most popular
```

### Install Powerlevel10k (Recommended)

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set in ~/.zshrc
ZSH_THEME="powerlevel10k/powerlevel10k"

# Restart terminal and follow configuration wizard
```

---

## 📦 Additional Useful Tools

### Install Later as Needed:

```bash
# Redis (in-memory database)
sudo apt install redis-server

# MongoDB
# Follow official docs: https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/

# Terraform (infrastructure as code)
sudo apt install terraform

# kubectl (Kubernetes CLI)
sudo snap install kubectl --classic

# Postman (API testing)
sudo snap install postman
```

---

## 🐛 Troubleshooting

### Zsh not showing as default
```bash
# Check current shell
echo $SHELL

# Change to Zsh
chsh -s $(which zsh)

# Log out and log back in
```

### NVM command not found
```bash
# Add to ~/.zshrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Reload
source ~/.zshrc
```

### GVM command not found
```bash
# Add to ~/.zshrc
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Reload
source ~/.zshrc
```

### Rust/Cargo not found
```bash
# Add to ~/.zshrc
source "$HOME/.cargo/env"

# Reload
source ~/.zshrc
```

---

## 📖 Learning Resources

### Zsh
- [Oh My Zsh Wiki](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Awesome Zsh Plugins](https://github.com/unixorn/awesome-zsh-plugins)

### Go
- [Go Tour](https://go.dev/tour/)
- [Go by Example](https://gobyexample.com/)

### Node.js
- [Node.js Docs](https://nodejs.org/docs/)
- [JavaScript.info](https://javascript.info/)

### Rust
- [The Rust Book](https://doc.rust-lang.org/book/)
- [Rust by Example](https://doc.rust-lang.org/rust-by-example/)

### Databases
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- [MySQL Tutorial](https://www.mysqltutorial.org/)

### Containers
- [Podman Tutorial](https://docs.podman.io/en/latest/Tutorials.html)

---

## ✅ Verification Checklist

After installation, verify everything works:

```bash
# Shell
zsh --version

# Version managers
gvm version
nvm --version
rustc --version

# Databases
psql --version
mysql --version

# Containers
podman --version

# Tools
jq --version
htop --version
tree --version
nvim --version
rg --version
fd --version
bat --version
```

---

## 🎯 Quick Reference Card

```bash
# Zsh
source ~/.zshrc              # Reload config
nano ~/.zshrc                # Edit config

# Go
gvm list                     # List Go versions
gvm use go1.21.6            # Switch version

# Node
nvm list                     # List Node versions
nvm use 18                   # Switch version

# Rust
rustup update                # Update Rust
cargo --version              # Check Cargo

# PostgreSQL
sudo systemctl status postgresql    # Check status
sudo -u postgres psql               # Access DB

# MySQL
sudo systemctl status mysql         # Check status
sudo mysql                          # Access DB

# Podman
podman ps                    # List containers
podman images                # List images
```

---

## 🚀 You're All Set!

Your development environment is now ready. Start building amazing things!

Remember:
- Use `tldr <command>` for quick command examples
- Use `man <command>` for detailed documentation
- Google is your friend
- Don't be afraid to experiment

Happy coding! 🎉
