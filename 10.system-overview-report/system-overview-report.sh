#!/bin/bash
# system-overview-report.sh
# This script generates a comprehensive system overview report.

echo "=== System Overview Report === - $(date)"

# System basics
echo "1. System Identity:"
echo "Hostname: $(hostnamectl)"
echo "OS Version: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2)"
echo "Kernel Version: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "System Uptime: $(uptime -p)"
echo "Date & Time: $(date)"
echo "Current logged-in user: $(whoami)"
echo "Reboot history: $(last reboot | head  -5)"
echo "..............................................."

# Hardware information
echo "2. Hardware Information:"
echo "CPU Model: $(lscpu | grep 'Model name' | sed 's/Model name:[ \t]*//')"
echo "CPU Cores: $(nproc)"
echo "Total RAM: $(free -h | grep Mem | awk '{print $2}')"
echo "Used RAM: $(free -h | grep Mem | awk '{print $3}')"
echo "Free RAM: $(free -h | grep Mem | awk '{print $4}')"
echo "Total Disk Space: $(df -h / | awk 'NR==2 {print $2}')"
echo "Used Disk Space: $(df -h / | awk 'NR==2 {print $3}')"
echo "Free Disk Space: $(df -h / | awk 'NR==2 {print $4}')"
echo "Network Interface: $(ip -o -4 addr show | awk '{print $2 ": " $4}')"
echo "Default Gateway: $(ip route | grep default | awk '{print $3}')"
echo "DNS Servers: $(grep 'nameserver' /etc/resolv.conf | awk '{print $2}' | paste -s -d, -)"
echo "Virtualization Info: $(systemd-detect-virt)"
echo "..............................................."

# Resource usage
echo "3. Resource Usage:"
echo "CPU Load Average: $(uptime | awk -F'load average:' '{print $2}')"
echo "Memory Usage: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
echo "Disk usage by filesystem: $(df -h | awk 'NR>1 {print $1 ": " $3 "/" $2 " used (" $5 " used)"}')"
echo "Swap usage: $(free -h | grep Swap | awk '{print $3 "/" $2}')"
echo "Top 5 memory-consuming processes: $(ps aux --sort=-%mem | head -6)"
echo "................................................"

echo "System Overview report complete. Review the details above for system status."


