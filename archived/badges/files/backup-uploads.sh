#!/bin/bash
BACKUP_PATH=/opt/backup/uploads
LOG_HEADER="Badges_uploads_backup"
TIMESTAMP=`date -u +"%Y-%m-%d"`

source /etc/backup-credentials.sh

/usr/bin/env logger -t $LOG_HEADER "Starting dump"

DST_FILE=${BACKUP_PATH}/uploads.tar.gz

/usr/bin/env tar -czf $DST_FILE -C /opt/badges/badges uploads/

#upload dumped file to amazon S3
/opt/aws_venv/bin/python /opt/active-memory/upload_rotate.py $S3_BUCKET $S3_PREFIX $DST_FILE
if [ $? -ne 0 ]
then
  /usr/bin/env logger -t $LOG_HEADER "upload to Amazon S3 failed, keeping file!"
  /bin/mv ${DST_FILE} ${BACKUP_PATH}/uploads-${TIMESTAMP}.tar.gz
  #TODO send email to sysadmin
  exit
fi

# Remove file if the upload succeeded
/bin/rm ${DST_FILE}

#logger -t $LOG_HEADER "Result of zip $DST_FILE: $?"
