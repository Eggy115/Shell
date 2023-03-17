#!/bin/ksh

funct_check_params()
{
  if [ ${NARG} -ne 1 ]; then
    echo "Monitor Slice Failed : You need to enter the slice you want to monitor" >> $LOGFILE
    exit 1
  fi
}

funct_check_slice()
{
  AVAIL=`df -k ${SLICE}| cut -f1 -d"l"| awk '{ print $4 }'` ; export AVAIL
  echo "Slice \t\t GB Used"
  echo "===== \t\t ======="
  while [[ 1 == 1 ]];
  do
    du -ks ${SLICE} | awk '{ print $2 "\t" $1/(1024*1024) }' 
    sleep 30
    echo " Space left in KB on ${SLICE} :" ${AVAIL} 
  done
}

################
# Main Program #
################

# Variable Settings

NARG=$# ; export NARG
DATE=`date +"%d-%B-%Y"` ; export DATE
SLICE=$1 ; export SLICE

# Oracle Environment

{
  funct_check_params
  funct_check_slice
}

## End of Script

