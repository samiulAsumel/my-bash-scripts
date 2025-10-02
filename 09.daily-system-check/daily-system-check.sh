#!/bin/bash
# daily-system-check.sh
# This script performs a daily system health check and generates a report.

echo "=== Daily System Health Report === - $(date)"

# System basics
echo "1. System Identity:"
echo "Hostname: $(hostnamectl)"
echo "User: $(whoami)"
echo "OS: $(cat /etc/os-release | grep PRETTY_NAME | cut  -d= -f2)"
echo "Kernel: $(uname -r)"
echo "..............................................."

# Resource check
echo "2. Resource Status:"
echo "Uptime: $(uptime -p)"
echo "Load: $(uptime | awk -F'load average:' '{print $2}')"
echo "Memory: $(free -h | grep Mem: | awk '{print $3 "/" $2 " used"}')"
echo "Disk: $(df -h / | awk 'NR==2 {print $3 "/" $2 " used (" $5 " used)"}')"
echo "Root FS: $(df -h / | tail -1 | awk '{print $5}') full"
echo "..............................................."

# Service status (basic services)
echo "3. Key Service Status:"
if systemctl is-active sshd >/dev/null 2>&1; then
	echo "SSH: Running"
else
	echo "SSH: Stopped"
fi

# Network check
echo "4. Network Status:"
echo "IP Address: $(hostname -I 2>/dev/null | awk '{print $2}')"
echo "Default Gateway: $(ip route | grep default | awk '{print $3}')"
echo "DNS Servers: $(grep 'nameserver' /etc/resolv.conf | awk '{print $2}' | paste -s -d, -)" 
ping -c 5 8.8.8.8 >/dev/null 2>$1 && echo "Internet: Connected" || echo "Internet: Disconnected"
echo "..............................................."

# Recent logins
echo "5. Recent Logins:"
last -n 3 | head -3
echo "..............................................."

# Failed login attempts
echo "6. Failed Login Attempts:"
sudo lastb -n 3 | head -3
echo "..............................................."

echo "Daily check complete. Review the report above for any issues."