#!/bin/sh

touch /tmp/cron

for line in "${@}"; do
  echo "${line}" >> /tmp/cron
done

mv -f /tmp/cron /var/spool/cron/crontabs/root
chmod 600 /var/spool/cron/crontabs/root
crond -f -d 0
