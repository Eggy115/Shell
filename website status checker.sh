#!/bin/sh
# Website Status Checker

# Define website URL
URL="https://example.com"

# Check website status
if curl --output /dev/null --silent --head --fail "$URL"; then
    echo "Website is up!"
else
    echo "Website is down!"
fi
