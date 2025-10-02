#!/bin/bash
# File: system_explorer.sh
# Description: A simple system explorer script to navigate and manage files and directories.
# Author: Samiul A Sumel

echo "=== Red hat system Directory Explorer ==="

echo ""

# Function to show directory info

show_dir_info() {
	local dir="$1"
	echo "Directory:$dir"
	echo "Size: $(du -sh "$dir" 2>/dev/null | cut -f1)"
	echo "Files: $(find "$dir" -maxdepth 1 -type f 2>/dev/null | wc -l)"
	echo "Subdir: $(find "$dir" -maxdepth 1 -type d 2>/dev/null | wc -l) - 1)"
	echo "Most Recent File: $(find "$dir" -maxdepth 1 -type f -printf '%T@ %p\n' 2>/dev/null | sort -nr | head -1 | cut -d' ' -f2- | xargs -r basename)"
	echo ""
}


# Key System directories
directories=(
	"/var/log"
	"/etc/sysconfig"
	"/etc/systemd/system"
	"/var/www"
	"/opt"
	"/usr/local"
	"/tmp"
)


for dir in "${directories[@]}"; do
	if [ -d "$dir" ]; then
		show_dir_info "$dir"
	else
		echo "Directory $dir not found."
		echo ""
	fi
done

echo "Current location: $(pwd)"
echo "Disk usages of current directory: $(du -sh . 2>/dev/null)"
echo ""
