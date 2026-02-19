# 🚀 Pop!_OS Development Environment Setup

Complete automated setup for a professional development environment on Pop!_OS.

## 📦 What Gets Installed

### Shell & Terminal
- **Zsh** with Oh My Zsh
- **Autosuggestions** (gray history hints)
- **Syntax highlighting** (color validation)

### Programming Languages
- **Go** via GVM (Go Version Manager)
- **Node.js** via NVM (Node Version Manager)
- **Rust** via Rustup
- **Python** 3.x with pip and venv

### Databases
- **PostgreSQL** 16.x
- **MySQL** 8.x

### Containers & Orchestration
- **Docker** Engine + Docker Compose
- **Podman** (rootless alternative)
- **Kubernetes** (kubectl, minikube, k9s, helm)

### CLI Tools
- jq, htop, tree, neovim
- ripgrep, fd, bat, tldr

---

## 🎯 Quick Start

### Option 1: Install Everything
```bash
cd initialSetup
chmod +x install-all.sh scripts/*.sh
./install-all.sh
```

### Option 2: Install Selectively
```bash
cd initialSetup/scripts
chmod +x *.sh

# Install only what you need
./01-system-update.sh
./02-install-zsh.sh
./03-install-version-managers.sh
./04-install-databases.sh
./05-install-docker.sh
./06-install-podman.sh
./07-install-kubernetes.sh
./08-install-cli-tools.sh
./09-install-python-tools.sh
./10-configure-git.sh
```

---

## 📁 Repository Structure

```
initialSetup/
├── install-all.sh              # Master installation script
├── scripts/                    # Modular installation scripts
│   ├── 01-system-update.sh
│   ├── 02-install-zsh.sh
│   ├── 03-install-version-managers.sh
│   ├── 04-install-databases.sh
│   ├── 05-install-docker.sh
│   ├── 06-install-podman.sh
│   ├── 07-install-kubernetes.sh
│   ├── 08-install-cli-tools.sh
│   ├── 09-install-python-tools.sh
│   └── 10-configure-git.sh
├── docs/                       # Documentation
│   ├── START-HERE.md
│   ├── QUICK-START.md
│   ├── SETUP-GUIDE.md
│   ├── CHEATSHEET.md
│   ├── VISUAL-GUIDE.md
│   └── INSTALLATION-REPORT.md
└── README.md                   # This file
```

---

## 🔧 Individual Scripts

### 01-system-update.sh
Updates system packages and installs build essentials.

### 02-install-zsh.sh
Installs Zsh, Oh My Zsh, autosuggestions, and syntax highlighting.

### 03-install-version-managers.sh
Installs GVM (Go), NVM (Node.js), and Rustup (Rust).

### 04-install-databases.sh
Installs and starts PostgreSQL and MySQL.

### 05-install-docker.sh
Installs Docker Engine, Docker Compose, and adds user to docker group.

### 06-install-podman.sh
Installs Podman as a Docker alternative.

### 07-install-kubernetes.sh
Installs kubectl, minikube, k9s, and Helm.

### 08-install-cli-tools.sh
Installs essential CLI tools (jq, htop, tree, ripgrep, fd, bat, neovim, tldr).

### 09-install-python-tools.sh
Installs Python development tools (pip, venv, dev headers).

### 10-configure-git.sh
Configures Git with user name and email.

---

## 📚 Post-Installation

### 1. Activate Shell Changes
```bash
# Log out and log back in, or:
chsh -s $(which zsh)
# Then log out and back in
```

### 2. Install Language Versions

#### Go
```bash
source ~/.gvm/scripts/gvm
gvm install go1.21.6 -B
gvm use go1.21.6 --default
go version
```

#### Node.js
```bash
source ~/.nvm/nvm.sh
nvm install --lts
nvm use --lts
node --version
```

#### Rust (already installed)
```bash
source ~/.cargo/env
rustc --version
```

### 3. Test Docker
```bash
docker run hello-world
```

### 4. Test Kubernetes
```bash
minikube start
kubectl get nodes
k9s  # Interactive Kubernetes UI
```

### 5. Secure MySQL
```bash
sudo mysql_secure_installation
```

---

## 🎨 Customization

### Add to ~/.zshrc
```bash
# Aliases
alias fd='fdfind'
alias bat='batcat'
alias docker='podman'  # If you prefer Podman
alias k='kubectl'
alias gs='git status'
alias ll='ls -lah'

# Load version managers
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
source "$HOME/.cargo/env"

# Autosuggestion color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
```

---

## 🐛 Troubleshooting

### Command not found
```bash
source ~/.zshrc
```

### Docker permission denied
```bash
# Log out and back in after installation
# Or run:
newgrp docker
```

### Kubernetes not starting
```bash
# Check virtualization
egrep -c '(vmx|svm)' /proc/cpuinfo  # Should be > 0

# Start minikube with specific driver
minikube start --driver=docker
```

---

## 📖 Documentation

- **[START-HERE.md](docs/START-HERE.md)** - Entry point
- **[QUICK-START.md](docs/QUICK-START.md)** - 5-minute guide
- **[SETUP-GUIDE.md](docs/SETUP-GUIDE.md)** - Detailed explanations
- **[CHEATSHEET.md](docs/CHEATSHEET.md)** - Command reference
- **[VISUAL-GUIDE.md](docs/VISUAL-GUIDE.md)** - Visual learning
- **[INSTALLATION-REPORT.md](docs/INSTALLATION-REPORT.md)** - Verification report

---

## 🎯 What You Get

After installation, you'll have:

✅ Modern shell with smart features  
✅ Multiple programming languages  
✅ Database systems  
✅ Container runtimes (Docker + Podman)  
✅ Kubernetes development environment  
✅ Essential developer tools  

---

## 🚀 Quick Commands

```bash
# Version managers
gvm list                    # List Go versions
nvm list                    # List Node versions
rustup update               # Update Rust

# Databases
sudo -u postgres psql       # PostgreSQL
sudo mysql                  # MySQL

# Containers
docker ps                   # List containers
podman ps                   # List Podman containers

# Kubernetes
kubectl get pods            # List pods
minikube status             # Check minikube
k9s                         # Interactive UI
helm list                   # List Helm releases

# CLI Tools
rg "search"                 # Fast search
fdfind filename             # Fast find
batcat file.js              # View with colors
jq '.' data.json            # Format JSON
```

---

## 🔄 Updating

To update individual components:

```bash
# Update system
./scripts/01-system-update.sh

# Update Oh My Zsh
omz update

# Update Rust
rustup update

# Update Docker
sudo apt update && sudo apt upgrade docker-ce

# Update Kubernetes tools
# Re-run the kubernetes script
./scripts/07-install-kubernetes.sh
```

---

## 🤝 Contributing

Feel free to:
- Add more installation scripts
- Improve existing scripts
- Update documentation
- Report issues

---

## 📝 License

MIT License - Feel free to use and modify!

---

## 👤 Author

**Amit Anand**
- Email: dropmaill.amit@gmail.com
- GitHub: [@homeamitanand-ra9](https://github.com/homeamitanand-ra9)

---

## ⭐ Star This Repo

If this helped you, please star the repository!

---

**Happy Coding! 🎉**
