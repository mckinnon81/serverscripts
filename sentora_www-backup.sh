#!/bin/bash
# Script Name: sentora_www-backup.sh
# Author Name: Matt McKinnon
# Date: 7th June 2016
# Description:
# This script will:
#   Backup your public_html folder under /var/sentora/hostdata/DOMAIN_NAME/public_html


#find domains

find /var/sentora/hostdata/* -maxdepth 0 -type d  | awk -F/ '{print $5}'


