#!/bin/sh

exec "$@" | python /usr/local/src/app/send-mail.py $EMAIL_SENDER $ADMIN_EMAIL "[$DOMAIN] $(date -u +"%Y-%m-%d")"
