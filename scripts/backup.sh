# scripts/backup.sh
#!/bin/bash
LOG_FILE="$HOME/wipro-capstone/logs/backup.log"
BACKUP_DIR="$HOME/wipro-capstone/backups"
SOURCE="$HOME/wipro-capstone"  # ← FIXED: Now backs up project folder
echo "[$(date)] Starting backup..." >> "$LOG_FILE"
mkdir -p "$BACKUP_DIR"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
DEST="$BACKUP_DIR/backup_$TIMESTAMP"
if rsync -a --progress "$SOURCE/" "$DEST/" >> "$LOG_FILE" 2>&1; then
    echo "[$(date)] Backup successful: $DEST" | tee -a "$LOG_FILE"
else
    echo "[$(date)] Backup FAILED" | tee -a "$LOG_FILE"
    exit 1
fi