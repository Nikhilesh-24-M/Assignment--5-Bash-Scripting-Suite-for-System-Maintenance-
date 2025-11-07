# Wipro Capstone Project – Assignment 5 (LinuxOS & LSP)  
**Bash Scripting Suite for System Maintenance**

**Name:** Nikhilesh  
**GitHub:** [Nikhilesh-24-M](https://github.com/Nikhilesh-24-M)  
**Email:** nikhileshmohanta24ofc@gmail.com  
**Date:** November 08, 2025  
**Live Project:** https://github.com/Nikhilesh-24-M/Assignment--5-Bash-Scripting-Suite-for-System-Maintenance-

---

## Objective (As Per Assignment)
> **Write a suite of Bash scripts to automate system maintenance tasks such as backup, system updates, log monitoring, and combine them into a menu to execute them.**

---

## Day-wise Tasks (Exactly as in Assignment Table)

| Day | Task | Status | Implementation |
|-----|------|--------|----------------|
| **Day 1** | Write a script for automated system backup | Done | `scripts/backup.sh` – Uses `rsync` with timestamp |
| **Day 2** | Create a script to perform system updates and cleanup | Done | `scripts/update-clean.sh` – `apt update`, `upgrade`, `autoremove`, `autoclean` |
| **Day 3** | Develop a log monitoring script to alert on certain conditions | Done | `scripts/logwatch.sh` – Monitors `/var/log/syslog` for `error`, `fail`, `warning` |
| **Day 4** | Combine scripts into a maintenance suite with a menu to execute them | Done | `main.sh` – Interactive menu with 5 options |
| **Day 5** | Test scripts and add error handling and logging functionalities | Done | Full logging to `logs/`, input validation, exit codes |

---

## Project Structure (As Required)
wipro-capstone/
├── main.sh                     ← Day 4: Interactive menu to execute all scripts
├── scripts/
│   ├── backup.sh               ← Day 1: Automated backup using rsync
│   ├── update-clean.sh         ← Day 2: System update & cleanup
│   └── logwatch.sh             ← Day 3: Log monitoring with alerts
├── backups/                    ← Auto-generated timestamped backup folders
├── logs/                       ← All execution logs (backup.log, update.log, monitor.log)
├── README.md                   ← This documentation
└── .gitignore                  ← Excludes logs & backups from Git

---

## How to Run

```bash
cd ~/wipro-capstone
./main.sh
