#!/bin/ksh


LOG=/tmp/backuplog

echo "backup for `date` commencing..." > $LOG
mt -f /dev/rmt/0 rewind
ufsdump 0uf /dev/rmt/0cn / >> $LOG
ufsdump 0uf /dev/rmt/0cn /usr >> $LOG
ufsdump 0uf /dev/rmt/0cn /opt >> $LOG
ufsdump 0uf /dev/rmt/0cn /export/home  >> $LOG
echo "Backup has now completed" >> $LOG
