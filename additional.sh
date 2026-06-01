#!/bin/sh
if [ ! -d /data/nextcloud ]; then
    mv /usr/local/share/nextcloud /data/nextcloud
    chmod -R 770 /data/nextcloud
    chown -R nginx:${GROUP} /data/nextcloud
fi

