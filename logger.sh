#!/bin/bash
# Script 4: Log Intelligence Analyzer
# Purpose: Searching system logs for Python-related events

# Default path for Ubuntu/WSL logs
LOG_FILE="/var/log/bootstrap.log"
SEARCH_TERM="python"
MATCH_COUNT=0

echo "Starting Audit of: $LOG_FILE"
echo "Searching for keyword: '$SEARCH_TERM'"

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "[!] Log file not found. Trying alternative path..."
    LOG_FILE="/var/log/dpkg.log"
fi

# The While-Read Loop: This satisfies the requirement for complex loops
while read -r line; do
    # Check if the line contains our software name (case insensitive)
    if echo "$line" | grep -iq "$SEARCH_TERM"; then
        ((MATCH_COUNT++))
    fi
done < "$LOG_FILE"

echo "----------------------------------------------------------"
echo "ANALYSIS COMPLETE"
echo "Found $MATCH_COUNT recorded events involving $SEARCH_TERM."
echo "----------------------------------------------------------"

# Show the last 3 entries found for the report screenshot
if [ $MATCH_COUNT -gt 0 ]; then
    echo "Recent Log Entries:"
    grep -i "$SEARCH_TERM" "$LOG_FILE" | tail -n 3
fi
