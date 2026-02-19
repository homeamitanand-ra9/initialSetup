# Developer Environment Cheat Sheet

## 🐚 Zsh & Oh My Zsh

```bash
# Reload configuration
source ~/.zshrc

# Edit configuration
nano ~/.zshrc

# Accept autosuggestion
→  # Right arrow key

# Clear suggestion
Ctrl+C

# Search history
Ctrl+R

# List plugins
ls ~/.oh-my-zsh/plugins/

# Update Oh My Zsh
omz update
```

---

## 🔵 Go (via GVM)

```bash
# Install Go version
gvm install go1.21.6 -B

# List installed versions
gvm list

# List available versions
gvm listall

# Use specific version
gvm use go1.21.6

# Set default version
gvm use go1.21.6 --default

# Uninstall version
gvm uninstall go1.21.6

# Go commands
go version                    # Check version
go run main.go               # Run program
go build                     # Compile program
go mod init module-name      # Initialize module
go mod tidy                  # Clean dependencies
go get package-name          # Install package
go install                   # Install binary
```

---

## 🟢 Node.js (via NVM)

```bash
# Install latest LTS
nvm install --lts

# Install specific version
nvm install 18.19.0

# List installed versions
nvm list

# List available versions
nvm list-remote

# Use specific version
nvm use 18

# Set default version
nvm alias default 18

# Use project's .nvmrc
nvm use

# Uninstall version
nvm uninstall 16

# Node/NPM commands
node --version               # Check Node version
npm --version                # Check NPM version
npm init -y                  # Initialize package.json
npm install package-name     # Install package
npm install -g package-name  # Install globally
npm run script-name          # Run script
npx command                  # Run package without installing
```

---

## 🦀 Rust (via Rustup)

```bash
# Update Rust
rustup update

# Check version
rustc --version
cargo --version

# Install component
rustup component add rustfmt

# Install target
rustup target add wasm32-unknown-unknown

# Cargo commands
cargo new project-name       # Create new project
cargo init                   # Initialize in current dir
cargo build                  # Build project
cargo build --release        # Build optimized
cargo run                    # Build and run
cargo test                   # Run tests
cargo check                  # Check without building
cargo install package-name   # Install binary
cargo update                 # Update dependencies
```

---

## 🐘 PostgreSQL

```bash
# Service management
sudo systemctl start postgresql
sudo systemctl stop postgresql
sudo systemctl restart postgresql
sudo systemctl status postgresql

# Access database
sudo -u postgres psql

# Access as specific user
psql -U username -d database_name

# SQL commands (inside psql)
\l                           # List databases
\c database_name             # Connect to database
\dt                          # List tables
\d table_name                # Describe table
\du                          # List users
\q                           # Quit

# Database operations
CREATE DATABASE dbname;
DROP DATABASE dbname;
CREATE USER username WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE dbname TO username;

# Backup and restore
pg_dump dbname > backup.sql
psql dbname < backup.sql
```

---

## 🐬 MySQL

```bash
# Service management
sudo systemctl start mysql
sudo systemctl stop mysql
sudo systemctl restart mysql
sudo systemctl status mysql

# Access database
sudo mysql
mysql -u username -p

# SQL commands (inside mysql)
SHOW DATABASES;
USE database_name;
SHOW TABLES;
DESCRIBE table_name;
SELECT USER();
EXIT;

# Database operations
CREATE DATABASE dbname;
DROP DATABASE dbname;
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON dbname.* TO 'username'@'localhost';
FLUSH PRIVILEGES;

# Backup and restore
mysqldump -u username -p dbname > backup.sql
mysql -u username -p dbname < backup.sql

# Secure installation
sudo mysql_secure_installation
```

---

## 📦 Podman

```bash
# Container operations
podman run image-name                    # Run container
podman run -d image-name                 # Run in background
podman run -p 8080:80 image-name        # Port mapping
podman run -v /host:/container image    # Volume mount
podman run --name mycontainer image     # Named container
podman ps                                # List running
podman ps -a                             # List all
podman stop container-id                 # Stop container
podman start container-id                # Start container
podman restart container-id              # Restart container
podman rm container-id                   # Remove container
podman logs container-id                 # View logs
podman exec -it container-id bash       # Enter container

# Image operations
podman images                            # List images
podman pull image-name                   # Pull image
podman build -t name:tag .              # Build image
podman rmi image-id                      # Remove image
podman tag source target                 # Tag image
podman push image-name                   # Push to registry

# System operations
podman system prune                      # Clean up
podman system df                         # Disk usage
podman info                              # System info
podman version                           # Version info

# Compose (if installed)
podman-compose up                        # Start services
podman-compose down                      # Stop services
podman-compose ps                        # List services
```

---

## 🛠️ Developer CLI Tools

### jq (JSON processor)
```bash
jq '.' file.json                         # Pretty print
jq '.key' file.json                      # Extract field
jq '.[] | .name' file.json              # Array iteration
echo '{"a":1}' | jq '.a'                # Pipe input
curl api.com/data | jq                   # Format API response
```

### ripgrep (rg)
```bash
rg "pattern"                             # Search in files
rg "pattern" -t js                       # Search JS files
rg -i "pattern"                          # Case insensitive
rg "pattern" -l                          # List files only
rg "pattern" -A 3 -B 3                  # Context lines
```

### fd
```bash
fd filename                              # Find files
fd -e js                                 # Find by extension
fd -H filename                           # Include hidden
fd -t f                                  # Files only
fd -t d                                  # Directories only
```

### bat
```bash
bat file.txt                             # View with highlighting
bat -n file.txt                          # Show line numbers
bat -A file.txt                          # Show all characters
bat file1.txt file2.txt                  # Multiple files
```

### tree
```bash
tree                                     # Show directory tree
tree -L 2                                # Limit depth
tree -a                                  # Show hidden files
tree -d                                  # Directories only
tree -I 'node_modules|.git'             # Ignore patterns
```

### htop
```bash
htop                                     # Interactive monitor
# F1: Help
# F2: Setup
# F3: Search
# F4: Filter
# F5: Tree view
# F9: Kill process
# F10: Quit
```

---

## 🔧 Git Essentials

```bash
# Configuration
git config --global user.name "Name"
git config --global user.email "email@example.com"

# Basic operations
git init                                 # Initialize repo
git clone url                            # Clone repo
git status                               # Check status
git add .                                # Stage all
git commit -m "message"                  # Commit
git push                                 # Push to remote
git pull                                 # Pull from remote

# Branching
git branch                               # List branches
git branch name                          # Create branch
git checkout name                        # Switch branch
git checkout -b name                     # Create and switch
git merge branch-name                    # Merge branch
git branch -d name                       # Delete branch

# History
git log                                  # View history
git log --oneline                        # Compact history
git diff                                 # Show changes
git show commit-hash                     # Show commit

# Undo
git reset HEAD file                      # Unstage file
git checkout -- file                     # Discard changes
git revert commit-hash                   # Revert commit
git reset --hard HEAD~1                  # Delete last commit
```

---

## 🌐 Useful Aliases (Add to ~/.zshrc)

```bash
# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gco='git checkout'
alias gb='git branch'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -lah'
alias la='ls -A'

# Docker/Podman
alias docker='podman'
alias dc='podman-compose'

# Development
alias serve='python3 -m http.server'
alias myip='curl ifconfig.me'

# System
alias update='sudo apt update && sudo apt upgrade -y'
alias ports='netstat -tulanp'
```

---

## 🔍 Quick Diagnostics

```bash
# Check what's installed
which zsh node npm go cargo rustc psql mysql podman

# Check versions
zsh --version
node --version
go version
rustc --version
psql --version
mysql --version
podman --version

# Check services
sudo systemctl status postgresql
sudo systemctl status mysql

# Check ports
sudo netstat -tulanp | grep LISTEN
sudo lsof -i :3000

# Check disk space
df -h
du -sh *

# Check memory
free -h

# Check processes
ps aux | grep process-name
```

---

## 🆘 Emergency Commands

```bash
# Kill process by port
sudo kill -9 $(sudo lsof -t -i:3000)

# Kill process by name
pkill -f process-name

# Clear terminal
clear  # or Ctrl+L

# Exit stuck program
Ctrl+C  # Interrupt
Ctrl+Z  # Suspend
Ctrl+D  # EOF

# Fix broken terminal
reset

# Check system logs
journalctl -xe
dmesg | tail

# Disk cleanup
sudo apt autoremove
sudo apt autoclean
```

---

## 📝 Environment Variables

```bash
# View all
printenv

# View specific
echo $PATH
echo $HOME
echo $SHELL

# Set temporarily
export VAR_NAME=value

# Set permanently (add to ~/.zshrc)
export VAR_NAME=value

# Add to PATH
export PATH="$HOME/bin:$PATH"
```

---

## 🎯 Common Workflows

### Start new Node.js project
```bash
mkdir my-project && cd my-project
nvm use --lts
npm init -y
npm install express
```

### Start new Go project
```bash
mkdir my-project && cd my-project
go mod init github.com/username/my-project
```

### Start new Rust project
```bash
cargo new my-project
cd my-project
cargo run
```

### Run PostgreSQL database
```bash
sudo systemctl start postgresql
sudo -u postgres psql
CREATE DATABASE myapp;
\c myapp
```

### Run containerized app
```bash
podman run -d -p 8080:80 --name myapp nginx
podman logs -f myapp
```

---

Print this and keep it handy! 📌
