#!/bin/sh
# System Resource Monitor

# Define warning thresholds
CPU_WARNING=80
RAM_WARNING=80

# Loop indefinitely
while true
do
    # Get system resource usage
    CPU_USAGE=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}' | cut -d "." -f 1)
    RAM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d "." -f 1)

    # Check for high resource usage
    if [ "$CPU_USAGE" -ge "$CPU_WARNING" ]; then
        echo "CPU usage is high: $CPU_USAGE%"
    fi
    if [ "$RAM_USAGE" -ge "$RAM_WARNING" ]; then
        echo "RAM usage is high: $RAM_USAGE%"
    fi

    # Sleep for 1 minute
    sleep 60
done
