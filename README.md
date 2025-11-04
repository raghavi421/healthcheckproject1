#Healthcheck-project. <br>
#healthcheck.sh - System health monitoring script.<br>

Overview 
   This project provides a simple,portable shell script(healthcheck.sh) that collects basic system health information and logs it to a file(healthlog.txt).
   <br>
This project mainly includes
 1. System date and time
 2. Uptime and CPU load(from uptime)
 3. memory usage(free -m)
 4. Disk usage(df -h)
 5. Top 5 memory consuming processes(ps aux --sort=-%mem | head -n 6)
 6. service checks for a configurable list of services(e.g. nginx,ssh) <br><br>
 
In this first we create project directory(Healthcheckproject)<br><br>
Then we create a Script file mention all the topics. Then we save the file and execute a file in terminal. we received a healthlog.txt file information. <br><br>
After that we send file into github




