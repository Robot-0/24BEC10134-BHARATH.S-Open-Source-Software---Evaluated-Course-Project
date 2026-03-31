#!/bin/bash
# Script 5: The Open Source Manifesto Generator
# Purpose: Creating a personalized philosophy record

echo "----------------------------------------------------------"
echo "WELCOME, OSS CONTRIBUTOR. LET US DEFINE YOUR VALUES."
echo "----------------------------------------------------------"

# Interactive 'read' commands to gather user input
read -p "Enter your favorite Python library (e.g., NumPy, Django): " FAVORITE_LIB
read -p "In one word, what does Open Source mean to you? " CORE_VALUE
read -p "What is your next goal in your coding journey? " NEXT_GOAL

# Setting up variables for the file
TIMESTAMP=$(date "+%Y-%m-%d %H:%M")
OUTPUT_FILE="my_manifesto.txt"

# Using a 'Here Document' block to redirect text into a new file
cat << EOF > $OUTPUT_FILE
==========================================================
              OPEN SOURCE MANIFESTO
==========================================================
Generated on: $TIMESTAMP
Student: $(whoami)

I believe that software should be $CORE_VALUE above all else.
By utilizing the power of Python and tools like $FAVORITE_LIB,
I am contributing to a global culture of transparency.

My immediate mission is to $NEXT_GOAL.
----------------------------------------------------------
EOF

echo "----------------------------------------------------------"
echo "[SUCCESS] Your personal values have been saved to $OUTPUT_FILE"
echo "Displaying your manifesto below:"
echo "----------------------------------------------------------"

# Display the newly created file content
cat $OUTPUT_FILE
