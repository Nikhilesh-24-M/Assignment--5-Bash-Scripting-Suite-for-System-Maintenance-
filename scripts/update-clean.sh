#!/bin/bash

# Bash Script: System Update & Cleanup
# Day 2 Task

LOG="$HOME/wipro-capstone/logs/update.log"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting system update & cleanup..." >> "$LOG"

sudo apt update >> "$LOG" 2>&1
sudo apt upgrade -y >> "$LOG" 2>&1
sudo apt autoremove -y >> "$LOG" 2>&1
sudo apt autoclean >> "$LOG" 2>&1

echo "[$(date '+%Y-%m-%d %H:%M:%S')] System update & cleanup completed." | tee -a "$LOG"
