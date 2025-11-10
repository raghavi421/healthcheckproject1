**Healthcheck_Project**

**Title:**Healthcheck_Project

** Overview**
The Healthcheck Project is a simple Shell Script that monitors your system’s health.
It collects key system information such as:
Current date and time
System uptime
CPU load
Memory and disk usage
Top memory-consuming processes
Status of important services (like nginx, ssh)
The script also logs the results into a file called healthlog.txt for tracking and auditing.


**Code**
#!/bin/bash
# healthcheck.sh - System Health Monitoring Script

LOG_FILE="$HOME/healthlog.txt"         # log saved in your home directory
SERVICES=("nginx" "ssh")               # services to check
TOP_N=5                                # top 5 memory-consuming processes

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

{
  echo "==============================================================="
  echo "SYSTEM HEALTH REPORT"
  echo "Report Generated On: $TIMESTAMP"
  echo "==============================================================="

  echo -e "\n Date & Time:"
  date

  echo -e "\n System Uptime and Load:"
  uptime

  echo -e "\n Memory Usage (MB):"
  free -m

  echo -e "\n Disk Usage:"
  df -h

  echo -e "\n Top $TOP_N Memory Consuming Processes:"
  ps aux --sort=-%mem | head -n $((TOP_N + 1))

  echo -e "\n Service Status Check:"
  for service in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$service"; then
      echo " $service is running"
    else
      echo " $service is NOT running"
    fi
  done

  echo "==============================================================="
  echo "End of Report"
  echo "==============================================================="

} >> "$LOG_FILE"

echo " System health report generated successfully in: $LOG_FILE"



**  Output **


===============================================================
SYSTEM HEALTH REPORT
Report Generated On: 2025-11-10 10:30:45
===============================================================

 Date & Time:
Mon Nov 10 10:30:45 IST 2025

 System Uptime and Load:
10:30:45 up 1:05, 2 users, load average: 0.15, 0.10, 0.05

 Memory Usage (MB):
              total        used        free      shared  buff/cache   available
Mem:           7900        2100        4300         200        1500        5300

 Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   25G   25G  50% /

 Top 5 Memory Consuming Processes:
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root       102  0.5  2.0  93400 16200 ?        Ss   10:00   0:02 gnome-shell
...

Service Status Check:
 nginx is running
 ssh is running

===============================================================
End of Report
===============================================================

 System health report generated successfully in: /home/user/healthlog.txt

 After that healthcheckproject file and healthlog file moved to github repo.
