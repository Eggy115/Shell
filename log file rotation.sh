#!/bin/sh
# Log File Rotation

# Define log file
LOG_FILE="/var/log/myapp.log"

# Check if log file is too large
if [ $(stat -c %s "$LOG_FILE") -gt 1000000 ]; then
    # Create backup of log file
    mv "$LOG_FILE" "$LOG_FILE.$(date +%Y-%m-%d_%H-%M-%S)"

    # Create new log file
    touch "$LOG_FILE"

    # Print success message
    echo "Log file rotated!"
fi
