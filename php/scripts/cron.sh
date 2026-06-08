#!/bin/sh
if [ -f /data/nextcloud/config/config.php ]; then
    if su php -c "php /data/nextcloud/cron.php"; then
        echo "$(date) Cron ran successfully."
    else
        echo "$(date) Cron failed."
        exit 1
    fi
else
    echo "$(date) Cron skipped because Nextcloud is not installed yet."
fi
