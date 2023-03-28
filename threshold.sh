#!/bin/sh

THRESHOLD_CPU=90
THRESHOLD_MEM=90
MAILTO="user@example.com"

while true; do
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
    MEM_USAGE=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')

    if [ $(echo "$CPU_USAGE > $THRESHOLD_CPU" | bc) -eq 1 ]; then
        echo "High CPU usage: $CPU_USAGE%" | mail -s "CPU Alert" "$MAILTO"
    fi

    if [ $(echo "$MEM_USAGE > $THRESHOLD_MEM" | bc) -eq 1 ]; then
        echo "High memory usage: $MEM_USAGE%" | mail -s "Memory Alert" "$MAILTO"
    fi

    sleep 5
done
