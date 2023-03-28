#!/bin/sh

echo "Top processes by CPU usage:"
ps -eo pid,%cpu,%mem,args --sort=-%cpu | head -n 10

echo "Top processes by memory usage:"
ps -eo pid,%cpu,%mem,args --sort=-%mem | head -n 10
