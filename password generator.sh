#!/bin/sh
# Password Generator

# Generate random password
PASSWORD=$(openssl rand -base64 16)

# Print password
echo "Generated password: $PASSWORD"
