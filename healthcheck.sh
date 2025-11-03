#!/bin/bash
# healthcheck.sh - System Health Monitoring Script

# Define log file name with timestamp
LOG_FILE="healthlog.txt"
TIMESTAMP=$("date")

# Start logging
echo "==================== System Health Report ====================" >> $LOG_FILE
echo "Report Generated On: $TIMESTAMP" >> $LOG_FILE
echo "===============================================================" >> $LOG_FILE

# 1. System Date and Time
echo "1. System Date and Time:" >> $LOG_FILE
date >> $LOG_FILE
echo "---------------------------------------------------------------" >> $LOG_FILE


# 2. System Uptime
echo "2. System Uptime:" >> $LOG_FILE
uptime >> $LOG_FILE
echo "---------------------------------------------------------------" >> $LOG_FILE

# 3. CPU Load
echo "3. CPU Load:" >> $LOG_FILE
uptime | awk -F'load average:' '{ print $2 }' >> $LOG_FILE
echo "---------------------------------------------------------------" >> $LOG_FILE

# 4. Memory Usage
echo "4. Memory Usage (in MB):" >> $LOG_FILE
free -m >> $LOG_FILE
echo "---------------------------------------------------------------" >> $LOG_FILE

# 5. Disk Usage
echo "5. Disk Usage:" >> $LOG_FILE
df -h >> $LOG_FILE
echo "---------------------------------------------------------------" >> $LOG_FILE

# 6. Top 5 Memory-Consuming Processes
echo "6. Top 5 Memory-Consuming Processes:" >> $LOG_FILE
ps aux --sort=-%mem | head -n 6 >> $LOG_FILE
echo "---------------------------------------------------------------" >> $LOG_FILE

# 7. Check if Services are Running
echo "7. Service Status:" >> $LOG_FILE
for service in nginx ssh
do
    if systemctl is-active --quiet $service
    then
        echo "$service is running" >> $LOG_FILE
    else
        echo "$service is NOT running" >> $LOG_FILE
    fi
done
echo "---------------------------------------------------------------" >> $LOG_FILE

echo "Report completed successfully!" >> $LOG_FILE
echo "===============================================================" >> $LOG_FILE
echo "" >> $LOG_FILE