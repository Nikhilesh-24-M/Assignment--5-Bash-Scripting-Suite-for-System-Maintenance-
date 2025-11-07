#!/bin/bash

# Bash Script: Automated Backup
# Day 1 Task

LOG="$HOME/wipro-capstone/logs/backup.log"
SRC="$HOME/wipro-capstone"  
DEST="$HOME/wipro-capstone/backups"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting backup of $SRC..." >> "$LOG"

mkdir -p "$DEST"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_PATH="$DEST/backup_$TIMESTAMP"

if rsync -a --delete --progress "$SRC/" "$BACKUP_PATH/" >> "$LOG" 2>&1; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] SUCCESS: Backup saved to $BACKUP_PATH" | tee -a "$LOG"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] FAILED: Backup error. See log." | tee -a "$LOG"
    exit 1
fi
