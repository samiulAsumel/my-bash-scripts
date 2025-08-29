# Filesystem Documentation Script

A Bash script to document and analyze the filesystem structure and disk usage on Linux systems. This script creates organized reports of critical directories and summarizes the disk usage, helping system administrators and learners understand the filesystem hierarchy.

---

## Features

- Creates a dedicated directory `~/labs/filesystem-docs` for storing documentation.
- Documents the root (`/`) directory structure.
- Explores and logs the contents of critical directories: `/etc`, `/var`, `/usr`, `/home`, `/root`, `/boot`, `/tmp`.
- Captures disk usage information using `df -h`.
- Counts total directories and files in `/etc` for quick reference.

---

## Prerequisites

- Linux system
- Bash shell
- Standard Linux utilities: `ls`, `df`, `find`, `wc`, `mkdir`, `echo`

---

