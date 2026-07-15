#!/bin/bash
while true; do
    echo "$(date) - CPU: $(top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}')% | MEM: $(free | awk '/Mem/{printf \"%.2f\", $3/$2 * 100.0}')" >> /var/log/system_metrics.log
    sleep 60 # Log every 60 seconds
done