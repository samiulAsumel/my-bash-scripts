#!/bin/bash

# Create verification script

echo "=== Task Verification ==="
echo "Current User: $(whoami)"
echo "Current directory: $(pwd)"
echo "Directory contents: $(ls -la | wc -l) items"
echo "Current date and time: $(date)"
echo "System uptime: $(uptime -p)"
echo "System load averages: $(uptime | awk -F'load average:' '{ print $2 }')"
echo "Last command status: $?"
echo "============================"
