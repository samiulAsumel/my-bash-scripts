#!/bin/bash

# ============================================================
# Enterprise File System Navigation Mastery
# Author: Samiul A Sumel
# ============================================================

echo "Welcome to the Enterprise File System Navigation Mastery Script!"
echo "This script will guide you through essential file system navigation commands."
echo "Let's get started!"

# Created professional Practice Environment
sudo mkdir -p /opt/company/{web,db,logs,backup,configs,scripts,temp}
sudo mkdir -p /opt/company/web/{html,cgi-bin,ssl}
sudo mkdir -p /opt/company/db/{mysql,postgresql,backups}
sudo mkdir -p /opt/company/logs/{nginx,apache,mysql,application}

#Set corporate permissions
sudo chown alma:alma /opt/company
sudo chmod 755 /opt/company
sudo chmod 750 /opt/company/web/ssl

echo "Enterprise directories created under /opt/company with appropriate permissions."