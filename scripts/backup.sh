#!/bin/bash
BACKUP_DIR=backup_$(date +%Y%m%d_%H%M%S)
mkdir -p "$BACKUP_DIR"

echo "Backing up volumes..."

docker run --rm -v gitea_data:/volume -v "$PWD/$BACKUP_DIR":/backup alpine tar czf /backup/gitea_data.tar.gz -C /volume .
docker run --rm -v wikijs_data:/volume -v "$PWD/$BACKUP_DIR":/backup alpine tar czf /backup/wikijs_data.tar.gz -C /volume .
docker run --rm -v code_data:/volume -v "$PWD/$BACKUP_DIR":/backup alpine tar czf /backup/code_data.tar.gz -C /volume .
docker run --rm -v caddy_data:/volume -v "$PWD/$BACKUP_DIR":/backup alpine tar czf /backup/caddy_data.tar.gz -C /volume .
docker run --rm -v caddy_config:/volume -v "$PWD/$BACKUP_DIR":/backup alpine tar czf /backup/caddy_config.tar.gz -C /volume .

echo "Backup completed in $BACKUP_DIR"
