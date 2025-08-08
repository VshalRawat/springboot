#!/bin/bash
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Directory to scan (default is / if none given)
SCAN_DIR="${1:-/}"

echo "$TIMESTAMP - Scanning $SCAN_DIR for largest files..." | tee -a large_files_report.log

# Find top 10 largest files
find "$SCAN_DIR" -type f -exec du -h {} + 2>/dev/null \
    | sort -hr \
    | head -n 10 \
    | tee -a large_files_report.log
