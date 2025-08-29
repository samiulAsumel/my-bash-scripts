# System Audit Report Script

A simple Bash script to generate a comprehensive system audit report for Linux systems (Red Hat-based distributions). This script collects system information, hardware resources, storage usage, and active user sessions, and saves it to a neatly formatted report file.

---

## Features

- Creates a dedicated directory `~/system-reports` for storing reports.
- Captures essential system details:
  - Hostname and IP address
  - Operating system and kernel version
  - CPU model, cores, and memory usage
- Monitors storage utilization for `/`, `/boot`, and `/home`.
- Lists active user sessions and the number of users currently logged in.
- Generates a timestamped report for easy tracking.

---

## Prerequisites

- Linux system (tested on Red Hat/CentOS)
- Bash shell
- Standard Linux utilities: `whoami`, `hostname`, `ip`, `lscpu`, `free`, `df`, `who`, `uname`, `cat`, `awk`, `grep`, `xargs`

---

