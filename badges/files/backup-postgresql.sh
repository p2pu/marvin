#!/bin/bash
BACKUP_PATH=/opt/backup/postgresql
LOG_HEADER="PostgreSQL_Backups"
TIMESTAMP=`date -u +"%Y-%m-%d"`

source /etc/backup-credentials.sh

/usr/bin/env logger -t $LOG_HEADER "Starting db dump"

DST_FILE=${BACKUP_PATH}/postgres_${DB_NAME}.sql
/usr/bin/env pg_dump -h 127.0.0.1 $DB_NAME -f $DST_FILE
if [ $? -ne 0 ]
then
  /usr/bin/env logger -t $LOG_HEADER "pg_dump failed with result: $?"
  #TODO send email to sysadmin
  exit
fi

/usr/bin/env gzip -qf $DST_FILE

#upload dumped file to amazon S3
/opt/aws_venv/bin/python /opt/active-memory/upload_rotate.py $S3_BUCKET $S3_PREFIX ${DST_FILE}.gz
if [ $? -ne 0 ]
then
  /usr/bin/env logger -t $LOG_HEADER "Upload to Amazon S3 failed, keeping file!"
  /bin/mv ${DST_FILE}.gz ${BACKUP_PATH}/postgres_${DB_NAME}-${TIMESTAMP}.sql.gz
  #TODO send email to sysadmin
  exit
fi

# Remove file if the upload succeeded
/bin/rm ${DST_FILE}.gz

logger -t $LOG_HEADER "db dump finished"
