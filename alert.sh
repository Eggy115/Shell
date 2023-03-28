#!/bin/sh

SERVICE="ssh"
MAILTO="user@example.com"

if ! nc -z localhost 22; then
    echo "Service $SERVICE is down!" | mail -s "Service Down Alert" "$MAILTO"
fi
