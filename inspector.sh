#!/bin/bash
# Script 2: FOSS Package & License Inspector
# Focus: Python 3 Audit

TARGET="python3"

echo "=========================================="
echo "  AUDITING PACKAGE: $TARGET"
echo "=========================================="

# Check if the package is installed using the dpkg-query tool
if dpkg-query -W -f='${Status}' "$TARGET" 2>/dev/null | grep -q "ok installed"; then
    echo "[STATUS] Verified: $TARGET is present on this system."
    echo "------------------------------------------"
    echo "Technical Metadata:"
    # This pulls the specific Version and Homepage from the official repository
    apt-cache show "$TARGET" | grep -E 'Version|Homepage|Priority' | head -n 3
else
    echo "[ERROR] $TARGET is not installed. Audit cannot proceed."
    exit 1
fi

echo "------------------------------------------"
echo "PHILOSOPHICAL ALIGNMENT:"

# Using a case statement to provide a tailored "philosophy" note
case $TARGET in
    python3)
        echo "Project: The Python Software Foundation"
        echo "Ethos: 'Beautiful is better than ugly. Simple is better than complex.'"
        echo "License: PSF License (Permissive/Open)"
        ;;
    gcc)
        echo "Project: GNU Compiler Collection"
        echo "Ethos: The bedrock of the Free Software movement."
        ;;
    *)
        echo "Project: General Open Source Contributor"
        echo "Ethos: Shared code for the collective good."
        ;;
esac
echo "=========================================="
