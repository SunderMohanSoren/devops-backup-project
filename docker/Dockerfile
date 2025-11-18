FROM ubuntu:22.04

# Install needed tools
RUN apt update && apt install -y tar gzip bash cron

# Create app directories
RUN mkdir -p /app/scripts /app/data /app/backups

# Copy scripts
COPY scripts/backup.sh /app/scripts/backup.sh
COPY scripts/cron-backup.sh /app/scripts/cron-backup.sh

# Cron schedule file
COPY docker/crontab.txt /etc/cron.d/backup-cron

# Cron permissions
RUN chmod 0644 /etc/cron.d/backup-cron
RUN crontab /etc/cron.d/backup-cron

# Make scripts executable
RUN chmod +x /app/scripts/backup.sh
RUN chmod +x /app/scripts/cron-backup.sh

# Create log file
RUN touch /var/log/cron.log

# Start cron + tail logs
CMD cron && tail -f /var/log/cron.log
FROM ubuntu:22.04

# Install tools
RUN apt update && apt install -y tar gzip bash

# Create app directories
RUN mkdir -p /app/scripts /app/data /app/backups

# Copy backup script
COPY scripts/backup.sh /app/scripts/backup.sh

# Make script executable
RUN chmod +x /app/scripts/backup.sh

# Default command
CMD ["/app/scripts/backup.sh"]
