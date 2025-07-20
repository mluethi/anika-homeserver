![Anika Logo](assets/logo-anika.png)

# Anika

Anika is a modular, container-based HomeLab system with single sign-on (SSO), centralized control, and integrated system monitoring — designed for self-hosters and HomeLab enthusiasts.

## 🌟 Features

- Modular structure using Docker Compose
- Includes services like Gitea, Wiki.js, VS Code Server, Cockpit, Dashy, Syncthing, and more
- Caddy as reverse proxy with automatic HTTPS (Let's Encrypt)
- Pocket ID for centralized authentication (SSO)
- Dashy as web dashboard with control over all services
- System monitoring (uptime, CPU, memory, temperature, etc.)
- Terminal TUI for managing all services (`anika` command)

## 🚀 Getting Started

```bash
chmod +x install.sh install-tui.sh
sudo ./install.sh
./install-tui.sh
```

## 🛡 Lizenz
Apache 2.0 – see [LICENSE](LICENSE)
