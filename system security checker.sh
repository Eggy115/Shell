#!/bin/sh
# System Security Checker

# Check for root privilege
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root!"
    exit 1
fi

# Check for SSH security settings
SSHD_CONFIG="/etc/ssh/sshd_config"
if ! grep -q "^PasswordAuthentication no" $SSHD_CONFIG; then
    echo "Password authentication is enabled in SSH configuration!"
fi
if ! grep -q "^PermitRootLogin no" $SSHD_CONFIG; then
    echo "Root login is enabled in SSH configuration!"
fi

# Check for firewall settings
if ! ufw status | grep -q "Status: active"; then
    echo "Firewall is not active!"
fi

# Check for system updates
if [ "$(apt-get -s upgrade | grep "upgraded," | awk '{print $1}')" != "0" ]; then
    echo "System updates are available!"
fi
