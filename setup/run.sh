#!/bin/sh

if [ "$1" = "reset" ]; then
    echo "deleting old data..."
    rm -rf /data/nextcloud
    mariadb -u root -h $DB_HOST -p$DB_PASSWORD < /usr/local/share/deleteDB.sql
    echo "Done."
else
    echo "setting up nextcloud..."
    mariadb -u root -h $DB_HOST -p$DB_PASSWORD < /usr/local/share/createDB.sql
    php nextcloud/occ maintenance:install \
        --admin-user=admin \
        --admin-pass=password \
        --database=mysql \
        --database-user=nextcloud \
        --database-pass=password \
        --database-name=nextcloud \
        --database-host=db
    php nextcloud/occ config:system:set trusted_domains 1 --value "*"
    echo "Done."
fi
