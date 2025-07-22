#!/bin/bash
OUT=status.json
IP=$(hostname -I | awk '{print $1}')
TIME=$(date +"%Y-%m-%d %H:%M:%S")
UPTIME=$(uptime -p)
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%
MEM=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
DISK=$(df -h / | awk 'END{print $3 "/" $2}')
TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null | awk '{print $1/1000 "°C"}')
[ -z "$TEMP" ] && TEMP="N/A"

cat <<EOF > $OUT
{
  "time": "$TIME",
  "uptime": "$UPTIME",
  "ip": "$IP",
  "cpu": "$CPU",
  "mem": "$MEM",
  "disk": "$DISK",
  "temp": "$TEMP"
}
EOF
