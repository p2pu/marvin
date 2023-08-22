#!/usr/bin/env bash
set -e
BACKUP_PATH="/var/docker-volumes/etherpad/backups"
docker exec -i {{POSTGRES_CONTAINER}} pg_dump -Fc -U {{PG_ADMIN_USER}} -w {{DB_NAME}} > $BACKUP_PATH/{{DB_NAME}}-$(date -u +"%Y-%m-%d").dump
ln -f $BACKUP_PATH/{{DB_NAME}}-$(date -u +"%Y-%m-%d").dump $BACKUP_PATH/{{DB_NAME}}.dump

docker run -i --rm -w /var/backup --env-file /root/backup.env  -v $BACKUP_PATH:/var/backup python:3 bash -c "pip install s3-backup-rotate && upload_rotate.py {{BACKUP_BUCKET_NAME}} {{BACKUP_KEY_PREFIX}} /var/backup/{{DB_NAME}}.dump"

rm $BACKUP_PATH/*.dump
