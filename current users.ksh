#!/bin/ksh

funct_get_users()
{
sqlplus -s / as sysdba<< EOF
SET PAUSE OFF
SET PAGESIZE 200
SET LINESIZE 200
COLUMN username FORMAT A15
SPOOL $INFILE
select s.username, osuser, status, server as "Connect Type",
to_char(logon_time,'fmHH24:MI:SS AM') as "Logon Time",
sid, s.serial#, p.spid as "UNIX Proc"
from v\$session s, v\$process p
where s.paddr = p.addr
and s.username is not null
order by status, s.username, s.program, logon_time;
spool off
EXIT
EOF
}

funct_mail_file()
{
mailx -s " Current Users " $SALIST < $INFILE
}

################
# Main Program #
################

# Variable Settings

INFILE=/tmp/current_users.lst
SALIST='dba@whatever.com'

# Oracle Environment

ORATAB_LOC=/etc/oratab ; export ORATAB_LOC
ORACLE_HOME=`sed /#/d ${ORATAB_LOC} | grep $ORACLE_SID | awk -F: '{print $2}'` ; export ORACLE_HOME

{
	funct_get_users
	funct_mail_file
}

## End of Script


