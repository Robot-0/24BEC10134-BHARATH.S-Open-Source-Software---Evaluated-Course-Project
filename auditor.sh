#!/bin/bash
# Script 3: Python Directory & Permission Auditor
# Purpose: Auditing the physical footprint of Python 3

# Define an array of paths to audit
# We check the binary, the libraries, and general system folders
CHECK_PATHS=("/usr/bin/python3" "/usr/lib/python3" "/etc/python3" "/var/log" "/tmp")

echo "ID  | PATH               | PERMISSIONS | OWNER    | SIZE"
echo "------------------------------------------------------------"

index=1
for ENTRY in "${CHECK_PATHS[@]}"; do
    if [ -e "$ENTRY" ]; then
        # stat -c extracts specific metadata: %A (perms), %U (user)
        PERMS=$(stat -c "%A" "$ENTRY")
        OWNER=$(stat -c "%U" "$ENTRY")
        
        # du -sh gets human-readable size
        SIZE=$(du -sh "$ENTRY" 2>/dev/null | awk '{print $1}')
        
        # Print formatted row
        printf "%02d  | %-18s | %-11s | %-8s | %s\n" "$index" "$ENTRY" "$PERMS" "$OWNER" "$SIZE"
    else
        printf "%02d  | %-18s | %-11s | %-8s | %s\n" "$index" "$ENTRY" "NOT FOUND" "N/A" "0"
    fi
    ((index++))
done

echo "------------------------------------------------------------"
echo "Audit Note: Python libraries in /usr/lib are typically"
echo "read-only for standard users to ensure system stability."
