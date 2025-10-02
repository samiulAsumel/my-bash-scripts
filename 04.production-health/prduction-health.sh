  1 #!/bin/bash 
  3 # Ticket: DevOps-001 - Production Readiness Check

  5 # Task: Production Health Check (Like Senior DevOps Engineer)

  7 {
  8         echo "=== Production Health Report ==="
  9         echo "Generated: $(date)"
 10         echo "Engineer: $(whoami)"
 11         echo "System: $(cat /etc/os-release | grep PRETTY_NAME)"
 12         echo ""
 13         echo "=== Critical Metrics ==="
 14         echo "Uptime: $(uptime -p)"
 15         echo "Load average: $(uptime | awk -F'load average:' '{print $2}')"
 16         echo "Memory Usage: $(free -h | awk 'NR==2{print $3"/"$2}')"
 17         echo "Disk Usage: $(df -h / | awk 'NR==2{print $3"/"$2}')"
 18         echo ""
 19         echo "=== Security Status ==="
 20         echo "Firewall: $(sudo firewall-cmd --state 2>/dev/null || echo "Not Installed")"
 21         echo "SELinux: $(sestatus | grep 'Current mode')"
 22         echo "SSH Root Login: $(sudo grep PermitRootLogin /etc/ssh/sshd_config)"
 23         echo ""
 24         echo "=== Recommendations ==="
 25         echo "1. Monitor disk space weekly"
 26         echo "2. Review firewall rules monthly"
 27         echo "3. Update system packages quarterly"
 28 } | tee "/opt/company/logs/production_health_$(date +%y%m%d).log"
 29 
 30 echo "Production Ticket Completed - Senior Level"