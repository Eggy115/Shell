#!/bin/ksh

funct_check_user()
{
  ID=$(/usr/ucb/whoami)
  if [ $ID != "root" ]; then
    echo "$ID, You must be root to run"
    exit 1
  fi
}

find_world_writable_dir()
{
  find / -type d -perm -o+w -ls 2> /dev/null 1> $OUTPUT_DIR/world.txt
}


################
# Main Program #
################

# Variable Settings

NARG=$# ; export NARG
DATE=`date +"%d-%B-%Y"` ; export DATE
OUTPUT_DIR=/admin/output ; export OUTPUT_DIR

# Oracle Environment

{
  funct_check_user
  find_world_writable_dir
}

## End of Program
