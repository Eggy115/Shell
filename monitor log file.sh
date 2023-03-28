tail -f /path/to/log/file | grep --line-buffered "ERROR MESSAGE" | while read line; do echo "$line" | mail -s "Error Alert" user@example.com; done
