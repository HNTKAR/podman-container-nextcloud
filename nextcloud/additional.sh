#!/bin/sh
if [ ! -f /data/nextcloud/config/config.php ]; then
    rm -rf /data/nextcloud
    mv /usr/local/share/nextcloud /data/
    chmod -R 770 /data/nextcloud
    chown -R nginx:nginx /data/nextcloud
fi
