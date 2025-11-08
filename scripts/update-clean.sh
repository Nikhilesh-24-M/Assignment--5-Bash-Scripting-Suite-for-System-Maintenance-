#!/bin/bash
LOG="$HOME/wipro-capstone/logs/update.log"
mkdir -p "$(dirname "$LOG")"

echo "===========================================" >> "$LOG"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] SYSTEM UPDATE STARTED" >> "$LOG"
echo "===========================================" >> "$LOG"

# Disable IPv6 temporarily to avoid timeout errors
echo "[$(date)] Disabling IPv6 for apt (common fix for campus Wi-Fi)..." >> "$LOG"
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1 >> "$LOG" 2>&1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1 >> "$LOG" 2>&1

echo "[$(date)] Running: sudo apt update" | tee -a "$LOG"
sudo apt update >> "$LOG" 2>&1 || echo "[WARNING] apt update had errors (often IPv6) but may still work" | tee -a "$LOG"

echo "[$(date)] Running: sudo apt upgrade -y" | tee -a "$LOG"
sudo apt upgrade -y >> "$LOG" 2>&1

echo "[$(date)] Running: sudo apt autoremove -y" | tee -a "$LOG"
sudo apt autoremove -y >> "$LOG" 2>&1

echo "[$(date)] Running: sudo apt autoclean" | tee -a "$LOG"
sudo apt autoclean >> "$LOG" 2>&1

# Re-enable IPv6
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0 >> "$LOG" 2>&1

echo "===========================================" >> "$LOG"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] SYSTEM UPDATE COMPLETED SUCCESSFULLY!" | tee -a "$LOG"
echo "===========================================" >> "$LOG"
