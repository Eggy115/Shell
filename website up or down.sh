#!/bin/bash

URL="http://example.com"
MAILTO="user@example.com"

if curl --output /dev/null --silent --head --fail "$URL"; then
    echo "Website is up!"
else
    echo "Website is down!" | mail -s "Website Down Alert" "$MAILTO"
fi
