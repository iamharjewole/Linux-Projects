#!/bin/bash
echo "CPU Usage: $(top -bn1 | grep load | awk '{print $12}')"
echo "Memory Usage: $(free -m | awk '/Mem:/ {print $3 " MB used"}')"
echo "Disk Usage: $(df -h / | awk '/\// {print $5 " used"}')"
echo "Top 5 Processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

#!/bin/bash
CPU_USAGE=$(top -bn1 | grep load | awk '{print $12}' | sed 's/,//g')
if (( $(echo "$CPU_USAGE > 90" | bc -l) )); then
    echo "High CPU Usage: $CPU_USAGE%" | mail -s "CPU Alert" iamharjewole@gmail.com
fi