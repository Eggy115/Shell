#!/bin/ksh
################
# Main Program #
################

# Variable Settings

NARG=$# ; export NARG
DATE=`date +"%d-%B-%Y"` ; export DATE

# Oracle Environment

while true;
do;
  netstat -tn > first;
  sleep 1;
  netstat -tn > second;
  diff first second;
done

## End of Program
