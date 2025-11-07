#!/bin/bash

SCRIPTS="$HOME/wipro-capstone/scripts"
LOGS="$HOME/wipro-capstone/logs"
mkdir -p "$LOGS"

while true; do
    clear

    echo "Bash Scripting Suite for System 
Maintenance "
    echo "1. Backup Documents"
    echo "2. Update & Clean System"
    echo "3. Monitor System Logs"
    echo "4. View All Logs"
    echo "5. Exit"
    echo "=================================="
    read -p "Choose [1-5]: " opt

    case $opt in
        1) 
            echo "Running Backup..."
            bash "$SCRIPTS/backup.sh"
            ;;
        2) 
            echo "Running System Update..."
            bash "$SCRIPTS/update-clean.sh"
            ;;
        3) 
            echo "Monitoring Logs..."
            bash "$SCRIPTS/logwatch.sh"
            ;;
        4) 
            echo "Opening logs..."
            if ls "$LOGS"/* 1> /dev/null 2>&1; then
                less +G "$LOGS"/*
            else
                echo "No logs yet. Run other options first."
            fi
            ;;
        5) 
            echo "Thank you! Suite exiting..."
            exit 0
            ;;
        *) 
            echo "Invalid option! Try again."
            sleep 1
            ;;
    esac

    echo -e "\nPress Enter to continue..."
    read
done
