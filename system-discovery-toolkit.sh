#!/bin/bash

# Create system report directory
mkdir -p ~/system-reports
cd ~/system-reports

# Generate comprehensive system report
cat > system-report.txt <<EOF
===  XYZ system audit report ===
Generated: $(date)
Administrator: $(whoami)

=== System Identification ===
Hostname: $(hostname -f)
IP Address: $(ip route get 1 | head -1 | cut -d' ' -f7)

=== Operating System ===
$(cat /etc/redhat-release)
Kernel: $(uname -r)
Architecture: $(uname -m)

=== hardware Resources ===
CPU Info: $(lscpu | grep "Model name" | cut -d':' -f2 | xargs)
CPU Cores: $(nproc)
Total Memory: $(free -h | awk 'NR==2{print $2}')
Available Memory: $(free -h | awk 'NR==2{print $7}')

=== Storage Utilization ===
$(df -h | head -1)
$(df -h | grep -E '/$|/boot|/home' | head -5)

=== Active Sessions ===
$(who | wc -l) Users currently logged in: 
$(who)

=== Report End ===
EOF

# Display the report
cat system-report.txt