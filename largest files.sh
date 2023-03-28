#!/bin/sh

find . -type f -exec ls -s {} \; | sort -rn | head -n 10
