#!/bin/sh

DOMAIN="example.com"

openssl s_client -connect "$DOMAIN":443 < /dev/null 2> /dev/null | openssl x509 -noout -enddate
