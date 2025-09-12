#!/bin/bash
echo "===System Performance Report==="
echo"Load Average: $(uptime | awk -F'load average:' '{print $2}')"
echo "Memory Usage:"
free -m  | grep -E "(Mem | Swap)"
echo "Top 5 CPU processes:"
ps  aux --sort=-%cpu | head -6
echo "Top 10  Memory processes:"
echo "Top 5 CPU processes:"
ps aux --sort=-%cpu | head -6
echo "Disk I/O:"
iostat -x 1 1 | tail -n +4
echo "Network Usage:"
ifstat -t 1 1 | tail -n +3
echo "=============================="