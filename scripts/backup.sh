#!/bin/bash
LOG="$HOME/wipro-capstone/logs/backup.log"
DATE=$(date "+%Y-%m-%d_%H-%M-%S")
SOURCE="$HOME/Documents"
DEST="$HOME/Backups"

mkdir -p "$DEST"
tar -czf "$DEST/backup_$DATE.tar.gz" "$SOURCE" >> "$LOG" 2>&1
echo "$(date): Backup completed successfully." >> "$LOG"
echo "Backup done! Check $LOG for details."
