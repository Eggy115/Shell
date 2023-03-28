#!/bin/sh
# SSH Login Checker

# Check for failed SSH logins
if grep -q "Failed password" /var/log/auth.log; then
    # Send email notification
    mail -s "SSH login failure" user@example.com < /dev/null

    # Print success message
    echo "SSH login failure detected and email notification sent!"
fi
