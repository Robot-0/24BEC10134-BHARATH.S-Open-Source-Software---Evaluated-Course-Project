#!/bin/bash
# Script 1: System Identity Executive
# Purpose: Document the environment for the OSS Audit

STUDENT_NAME="[BHARATH.S 24BEC10134]"
SOFTWARE_CHOICE="Python"

# Gathering system data using specialized commands
KERNEL_ID=$(uname -sr)
CURRENT_USER=$(whoami)
UPTIME_DUR=$(uptime -p | sed 's/up //')
OS_NAME=$(grep '^PRETTY_NAME' /etc/os-release | cut -d'=' -f2 | tr -d '"')
STAMP=$(date "+%A, %d %B %Y | %T")

echo "----------------------------------------------------------"
printf "%-20s | %s\n" "AUDIT SUBJECT" "$SOFTWARE_CHOICE"
printf "%-20s | %s\n" "STUDENT" "$STUDENT_NAME"
echo "----------------------------------------------------------"
printf "%-20s : %s\n" "Operating System" "$OS_NAME"
printf "%-20s : %s\n" "Kernel Version" "$KERNEL_ID"
printf "%-20s : %s\n" "Active Session" "$CURRENT_USER"
printf "%-20s : %s\n" "System Uptime" "$UPTIME_DUR"
printf "%-20s : %s\n" "Current Timestamp" "$STAMP"
echo "----------------------------------------------------------"
echo "LEGAL NOTE: This system operates under the GNU General"
echo "Public License (GPL), ensuring your four freedoms."
echo "----------------------------------------------------------"
