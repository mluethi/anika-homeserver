# Anika 🧠🖥️

Anika ist ein modular aufgebautes, containerbasiertes HomeLab-System mit Single-Sign-On (SSO), zentraler Steuerung und integriertem Systemmonitoring – entwickelt für Selbsthoster und HomeLab-Enthusiasten.

## 🌟 Features
- Modularer Aufbau mit Docker Compose
- Dienste wie Gitea, Wiki.js, VS Code Server, Cockpit, Dashy, Syncthing u. a.
- Caddy als Reverse Proxy mit automatischem HTTPS (Let's Encrypt)
- Pocket ID für zentrale Authentifizierung (SSO)
- Dashy als Web-Dashboard mit direkter Steuerung der Dienste
- Systemüberwachung (Uptime, CPU, Speicher, Temperatur)
- Terminal-TUI zur Steuerung aller Dienste (`anika`)

## 🚀 Erste Schritte

```bash
chmod +x install.sh install-tui.sh
sudo ./install.sh
./install-tui.sh
```

## 🛡 Lizenz
Apache 2.0 – siehe [LICENSE](LICENSE)
