#!/bin/bash
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Extract only the number from Use% column
USAGE=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [ "$USAGE" -gt 80 ]; then
    echo "$TIMESTAMP - WARNING: Disk usage is ${USAGE}%" | tee -a disk_report.log
else
    echo "$TIMESTAMP - Disk usage normal: ${USAGE}%" | tee -a disk_report.log
fi
