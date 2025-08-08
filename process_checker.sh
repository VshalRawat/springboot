#!/bin/bash
# Script to check and log running processes

# Accept process name from argument or default to 'nginx'
PROCESS_NAME=${1:-nginx}

# Get current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Count matching processes (excluding the grep command itself)
PROCESS_COUNT=$(ps aux | grep "$PROCESS_NAME" | grep -v grep | wc -l)

# Log the output
echo "$TIMESTAMP - Process '$PROCESS_NAME' running count: $PROCESS_COUNT" >> process_log.txt

# Also display on screen
echo "Process '$PROCESS_NAME' running count: $PROCESS_COUNT"
