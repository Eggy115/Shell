#!/bin/sh
# Password Manager

# Define password file path
PASSWORD_FILE="/var/lib/passwords.txt"

# Create password file if it doesn't exist
if [ ! -f "$PASSWORD_FILE" ]; then
    touch $PASSWORD_FILE
fi

# Check command line arguments
case "$1" in
    "add")
        # Add password
        echo "$2 $3" >> $PASSWORD_FILE
        ;;
    "get")
        # Get password
        grep "^$2 " $PASSWORD_FILE | awk '{print $2}'
        ;;
    "delete")
        # Delete password
        sed -i "/^$2 /d" $PASSWORD_FILE
        ;;
    *)
        # Invalid command
        echo "Invalid command: $1"
        echo "Usage: password.sh [add|get|delete] [name] [password]"
        exit 1
esac
