#!/bin/bash

# Create documentation directory
mkdir -p ~/labs/filesystem-docs

# Document root directory structure
ls -la / > root-directory.txt
echo "Root Directory Analysis - $(date)" >> root-directory.txt

# Explore and document critical directories
for dir in /etc /var /usr /home /root /boot /tmp; do
    echo "=== $dir ===" >> ~/labs/filesystem-docs/filesystem-analysis.txt
    ls -la $dir | head -n 10 >> ~/labs/filesystem-docs/filesystem-analysis.txt
    echo "" >> ~/labs/filesystem-docs/filesystem-analysis.txt
done

# Document disc usage
df -h > disk-usage.txt
echo "Total directory in /etc: $(find /etc -type d | wc -l)" >> filesystem-analysis.txt
echo "Total files in /etc: $(find /etc -type f | wc -l)" >> filesystem-analysis.txt
