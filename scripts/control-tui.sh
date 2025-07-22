#!/bin/bash

set -e

APPS=(
  "gitea"
  "wiki"
  "vscode"
  "cockpit"
  "dashy"
  "status"
  "caddy"
  "pocketid"
)

print_menu() {
  echo "========== 🖥️  Anika Control Panel =========="
  echo "Wähle eine Option:"
  echo
  echo "  0) ALLE starten"
  echo "  1) ALLE stoppen"
  echo "  2) ALLE neustarten"
  echo "  3) ALLE upgraden"
  echo
  i=4
  for app in "${APPS[@]}"; do
    echo "  $i) Starte $app"
    echo "  $((i+1))) Stoppe $app"
    echo "  $((i+2))) Neustarte $app"
    echo "  $((i+3))) Upgrade $app"
    ((i+=4))
  done
  echo
  echo "  q) Beenden"
  echo "============================================"
}

run_compose_cmd() {
  target="$1"
  cmd="$2"

  fpath=""
  if [[ -f "apps/anika/$target/docker-compose.yml" ]]; then
    fpath="apps/anika/$target/docker-compose.yml"
  elif [[ -f "infra/$target/docker-compose.yml" ]]; then
    fpath="infra/$target/docker-compose.yml"
  fi

  if [[ -n "$fpath" ]]; then
    docker-compose -f "$fpath" $cmd
  else
    echo "❌ $target nicht gefunden"
  fi
}

while true; do
  print_menu
  read -p "Deine Wahl: " choice

  case "$choice" in
    0)
      for app in "${APPS[@]}"; do run_compose_cmd "$app" "up -d"; done ;;
    1)
      for app in "${APPS[@]}"; do run_compose_cmd "$app" "down"; done ;;
    2)
      for app in "${APPS[@]}"; do run_compose_cmd "$app" "restart"; done ;;
    3)
      for app in "${APPS[@]}"; do run_compose_cmd "$app" "pull && docker-compose -f apps/anika/$app/docker-compose.yml up -d"; done ;;
    q|Q)
      echo "👋 Auf Wiedersehen!"
      exit 0 ;;
    *)
      index=$((choice - 4))
      group=$((index / 4))
      action=$((index % 4))
      if [[ $group -ge 0 && $group -lt ${#APPS[@]} ]]; then
        case $action in
          0) run_compose_cmd "${APPS[$group]}" "up -d" ;;
          1) run_compose_cmd "${APPS[$group]}" "down" ;;
          2) run_compose_cmd "${APPS[$group]}" "restart" ;;
          3) run_compose_cmd "${APPS[$group]}" "pull && docker-compose -f apps/anika/${APPS[$group]}/docker-compose.yml up -d" ;;
        esac
      else
        echo "❌ Ungültige Auswahl"
      fi
      ;;
  esac
  echo
done
