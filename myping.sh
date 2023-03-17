#!/bin/bash

funct_check_params()
{
        if [ ${NARG} -ne 1 ]; then
                echo "myping failed : Not enough Parameters passed, you need to add an IP address"
                exit 1
        fi
}

funct_SunOS()
{
	ping -s $IP | while read pong; do echo "$(date +%F_%T) -- $pong"; done
}

funct_Linux()
{
	ping $IP | while read pong; do echo "$(date +%F_%T) -- $pong"; done
}
        
################
# Main Program #
################

# Variable Settings

NARG=$#
IP=$1

{
        funct_check_params 
	if [[ `uname -s` == 'Linux' ]]; then
	  funct_Linux
	elif [[ `uname -s` == 'SunOS' ]]; then
	  funct_SunOS
	fi
}

## End of Script

