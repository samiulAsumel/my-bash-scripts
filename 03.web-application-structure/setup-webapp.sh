#!/bin/bash
#=========================================
# Script Name: setup_webapp.sh
# Description: This script creates a directory structure for a web application.
# Author: Samiul A Sumel
#=========================================
#Date: 12/09/2025
#Version: 1.0
#=========================================
# Usage: ./setup_webapp.sh
#=========================================

#Purpose: Create a directory structure for a web application.

set -euo pipefail       #Safe mode:  exit on error, unset var, or pipe failure
IFS=$'\n\t'            #Set Internal Field Separator to newline and tab

BASE_DIR="/opt/webapp"

echo ">>> Creating directory structure..."

sudo mkdir -p \
	"$BASE_DIR/bin" \
	"$BASE_DIR/config" \
	"$BASE_DIR/data" \
	"$BASE_DIR/backup" \
	"$BASE_DIR/logs/archive" \
	"$BASE_DIR/logs/current"


echo ">>> Creating configuration script..."
sudo tee "$BASE_DIR/config/app.conf" > /dev/null << EOF
# Application Configuration File
database_host=localhost
log_level=INFO
data_dir=$BASE_DIR/data
EOF

echo ">>> Creating deployment script..."
sudo tee "$BASE_DIR/bin/deploy.sh" > /dev/null << 'EOF'
#!/bin/bash
#=========================================
# Deployment script for the web application
#Create a timestamped backup of the data directory
#=========================================

set -euo pipefail
IFS=$'\n\t'

BACKUP_DIR="/opt/webapp/backup/$(date +%Y%m%d_%H%M%S)"

echo ">>> Creating backup directory at $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

echo ">>> Backing up configuration..."
cp -rp /opt/webapp/config "$BACKUP_DIR/"

echo " >>> Backup created successfully at: $BACKUP_DIR"
EOF

echo ">>> Setting execute permissions on deployment script..."
sudo chmod +x "$BASE_DIR/bin/deploy.sh"

echo " Running initial test deployment..."
sudo $BASE_DIR/bin/deploy.sh

echo ">>> Current backup directories:"
ls -l "$BASE_DIR/backup"