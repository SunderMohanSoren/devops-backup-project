#!/bin/bash

echo "🔁 Cron Triggered at $(date)" >> /var/log/cron.log
/app/scripts/backup.sh >> /var/log/cron.log 2>&1
