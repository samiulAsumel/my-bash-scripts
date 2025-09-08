#!/bin/bash
echo "=== System Information Report ==="
echo  "Hostname: $(hostname)"
echo "OS Release:$(cat /etc/redhat-release)"
echo "Kernel Version: $(uname -r)"
echo  "Uptime: $(uptime  -p)"
echo "Architecture:  $(uname -m)"
echo "CPU Cores: $(nproc)"
echo "Memory: $(free -h | grep Mem | awk '{print $2}')"
echo "Disk Usage: $(df -h  / | tail  -1 | awk '{print $5}')"
echo "IP Address: $(hostname -I | awk '{print $1}')"

echo "=== End of System Summary ==="