#!/bin/bash
# A simple script to track and display navigation history in the terminal.

history_file="$HOME/.nav_history"

# Function to log directory change
log_nav() {
	echo "$(date '+%Y-%m-%d %H:%M:%S') - $(pwd)" >> "$history_file"
}

# Function to display navigation history
show_history() {
	echo "=== Navigation History ==="
	if [ -f "$history_file" ]; then
		tail -20 "$history_file"
	else
		echo "No history found yet"
	fi
}

# Function to show most visited directories
show_popular() {
	echo "=== Most Visited Directories ==="
	if [ -f "$history_file" ]; then
		awk -F' - ' '{print $2}' "$history_file" | sort | uniq -c | sort -nr | head -10
	else
		echo "No history found yet"
	fi
}

# Main logic
case "$1" in
	"log")
		log_nav
		;;
	"history")
		show_history
		;;
	"popular")
		show_popular
		;;
	*)
		echo "Usage: $0 {log|history|popular}"
		echo "log     - Log current directory"
		echo "history - Show recent navigation"
		echo "popular - Show most visited directories"
		;;
esac
