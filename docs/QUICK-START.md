# 🚀 Quick Start Guide

## You're 3 Steps Away from Coding!

### Step 1: Restart Your Session (1 minute)
```bash
# Log out and log back in
# OR simply restart your computer
```

This activates Zsh as your default shell.

---

### Step 2: Install Language Versions (5 minutes)

Open a new terminal and run these commands:

#### Install Go
```bash
source ~/.gvm/scripts/gvm
gvm install go1.21.6 -B
gvm use go1.21.6 --default
go version
```

#### Install Node.js
```bash
source ~/.nvm/nvm.sh
nvm install --lts
nvm use --lts
node --version
```

#### Verify Rust (already installed)
```bash
source ~/.cargo/env
rustc --version
```

---

### Step 3: Try Your New Tools! (2 minutes)

#### Test Zsh Autosuggestions
```bash
# Type: git st
# You'll see gray text suggesting "git status"
# Press → (right arrow) to accept it!
```

#### Test a Database
```bash
# PostgreSQL
sudo -u postgres psql
# Inside psql:
# \l              (list databases)
# \q              (quit)

# MySQL
sudo mysql
# Inside mysql:
# SHOW DATABASES;
# EXIT;
```

#### Test Podman
```bash
podman run --rm hello-world
```

#### Test CLI Tools
```bash
# Pretty print JSON
echo '{"name":"John","age":30}' | jq

# Search files
rg "function" .

# View file with syntax highlighting
batcat README.md

# Show directory tree
tree -L 2
```

---

## 🎨 Customize Your Shell

Add these to `~/.zshrc`:

```bash
# Useful aliases
alias fd='fdfind'
alias bat='batcat'
alias docker='podman'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'

# Make autosuggestions more visible
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Load version managers automatically
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
source "$HOME/.cargo/env"
```

Then reload:
```bash
source ~/.zshrc
```

---

## 🎯 Your First Projects

### Go Web Server
```bash
mkdir hello-go && cd hello-go
go mod init hello
cat > main.go << 'EOF'
package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello from Go!")
    })
    fmt.Println("Server running on http://localhost:8080")
    http.ListenAndServe(":8080", nil)
}
EOF
go run main.go
```

### Node.js Express API
```bash
mkdir hello-node && cd hello-node
npm init -y
npm install express
cat > index.js << 'EOF'
const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.json({ message: 'Hello from Node!' });
});

app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});
EOF
node index.js
```

### Rust CLI Tool
```bash
cargo new hello-rust
cd hello-rust
cargo run
```

### PostgreSQL Database
```bash
sudo -u postgres psql
```
```sql
CREATE DATABASE myapp;
\c myapp
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);
INSERT INTO users (name, email) VALUES ('John', 'john@example.com');
SELECT * FROM users;
\q
```

### Run Nginx in Container
```bash
podman run -d -p 8080:80 --name mynginx nginx
# Visit http://localhost:8080
podman stop mynginx
podman rm mynginx
```

---

## 📖 Need Help?

- **Commands:** See [CHEATSHEET.md](CHEATSHEET.md)
- **Detailed Guide:** See [SETUP-GUIDE.md](SETUP-GUIDE.md)
- **Visual Guide:** See [VISUAL-GUIDE.md](VISUAL-GUIDE.md)
- **Installation Report:** See [INSTALLATION-REPORT.md](INSTALLATION-REPORT.md)

---

## 🆘 Quick Troubleshooting

### Command not found?
```bash
source ~/.zshrc
```

### Rust not found?
```bash
source ~/.cargo/env
```

### NVM not working?
```bash
source ~/.nvm/nvm.sh
```

### GVM not working?
```bash
source ~/.gvm/scripts/gvm
```

---

## ✅ Verification Checklist

Run these to verify everything works:

```bash
# Shell
zsh --version

# Languages (after installing versions)
go version
node --version
rustc --version
python3 --version

# Databases
psql --version
mysql --version

# Containers
podman --version

# Tools
jq --version
rg --version
fdfind --version
batcat --version
```

---

## 🎉 You're Ready!

Your development environment is fully set up. Start building amazing things!

**Pro Tips:**
1. Use `tldr <command>` for quick examples
2. Use `Ctrl+R` to search command history
3. Use `→` to accept Zsh autosuggestions
4. Keep CHEATSHEET.md open for reference

Happy coding! 🚀
