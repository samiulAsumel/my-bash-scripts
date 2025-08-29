# 🛡️ Enterprise System Audit Script

A **comprehensive system audit tool** written in **Bash** for Linux environments (tested on Red Hat–based systems).  
This script collects critical **system, security, hardware, and performance information** for compliance, troubleshooting, and administration tasks.

---

## 📋 Features

The script generates a timestamped audit report with the following details:

- **System Identification**
  - OS release, kernel version, architecture
  - Uptime and last boot time

- **Network Configuration**
  - Primary and all IP addresses
  - Active network interfaces
  - Top active network connections

- **Hardware Resources**
  - CPU model, cores, and architecture
  - Memory and storage usage
  - Block device details

- **User and Security**
  - Currently logged-in users
  - Total users and groups
  - Last 5 logins

- **Services and Processes**
  - Running and failed services
  - Top processes by CPU and memory usage

- **Security Status**
  - SELinux, firewall, and SSH service status

- **System File Verification**
  - Permissions of `/etc/passwd`, `/etc/shadow`, `/etc/group`
  - Recently modified configuration files

- **Performance Metrics**
  - Load averages
  - Disk I/O (via `iostat`, if available)
  - Memory usage summary

- **Log File Status**
  - Sizes of system, auth, and journal logs
  - Recent critical messages from `journalctl`

---



Make the script executable: chmod +x system-audit.sh
Run the script: ./system-audit.sh
View the report: system_audit_<hostname>_<timestamp>.txt
