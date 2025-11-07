#!/bin/bash

# Bash Script: Log Monitoring
# Day 3 Task

LOG="$HOME/wipro-capstone/logs/monitor.log"
SYSLOG="/var/log/syslog"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting log monitoring..." >> "$LOG"

if tail -n 100 "$SYSLOG" 2>/dev/null | grep -iE "(error|fail|warning|critical|panic|kernel)" > /tmp/alerts.tmp; then
    COUNT=$(wc -l < /tmp/alerts.tmp)
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ALERT: $COUNT critical messages found!" | tee -a "$LOG"
    echo "----- Recent Critical Messages -----" >> "$LOG"
    cat /tmp/alerts.tmp >> "$LOG"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] No critical issues found in last 100 lines." >> "$LOG"
fi

rm -f /tmp/alerts.tmp
