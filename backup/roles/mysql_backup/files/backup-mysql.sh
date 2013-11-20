#!/bin/bash
BACKUP_PATH=/opt/backup/mysql
LOG_HEADER="MySQL_Backups"
TIMESTAMP=`date -u +"%Y-%m-%d"`

source /etc/backup-credentials.sh

/usr/bin/env logger -t $LOG_HEADER "Starting dump"

DST_FILE=${BACKUP_PATH}/mysql_full.sql
/usr/bin/env mysqldump -A -u$DB_USER -p$DB_PASS > $DST_FILE
if [ $? -ne 0 ]
then
  /usr/bin/env logger -t $LOG_HEADER "mysqldump failed with result: $?"
  #TODO send email to sysadmin
  exit
fi

/usr/bin/env gzip -qf $DST_FILE

#upload dumped file to amazon S3
source /opt/aws_venv/bin/activate
upload_rotate.py $S3_BUCKET $S3_PREFIX ${DST_FILE}.gz
res=$?
deactivate
if [ $res -ne 0 ]
then
  /usr/bin/env logger -t $LOG_HEADER "upload to Amazon S3 failed, keeping file!"
  /bin/mv ${DST_FILE}.gz ${BACKUP_PATH}/mysql_full-${TIMESTAMP}.sql.gz
  #TODO send email to sysadmin
  exit
fi

# Remove file if the upload succeeded
/bin/rm ${DST_FILE}.gz
