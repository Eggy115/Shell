#!/bin/ksh


#################################
# Start of procedures/functions #
#################################

funct_check_params()
{
if [ ${NARG} -ne 2 ]; then
echo "Not Enough Parameters Passed - Please Supply Username and Password for connection to the database" 
exit 1
fi
}

funct_get_tablespace()
{
${ORACLE_HOME}/bin/sqlplus -s / << EOF
SET LINESIZE 200
SET PAUSE OFF
SET HEADING OFF
SET TERMOUT OFF
SET FEEDBACK OFF
SET ECHO OFF

COLUMN tablespace_name FORMAT A30

SPOOL $LOG_FILE

SELECT tablespace_name 
FROM dba_tablespaces;

SPOOL OFF

EXIT
EOF
}

funct_coalesce()
{
for NAME in $(cat $LOG_FILE)
do
${ORACLE_HOME}/bin/sqlplus -s / << EOF
ALTER TABLESPACE $NAME COALESCE;
EOF
done
}

################
# Main Program #
################

# Variable Settings

NARG=$#
DBAUSER=$1
DBAPASS=$2
DATE=`date +"%d-%b-%Y"`
LOG_FILE="/admin/output/coalesce.lst"

# Oracle Environment

ORATAB_LOC=/etc/oratab ; export ORATAB_LOC
ORACLE_SID=$2 ; export ORACLE_SID
ORACLE_HOME=`sed /#/d ${ORATAB_LOC} | grep $ORACLE_SID | awk -F: '{print $2}'` ; export ORACLE_HOME

{
touch $LOG_FILE
#funct_check_params
funct_get_tablespace
funct_coalesce >> /admin/output/tblsspc.lst
}

## End of Script


