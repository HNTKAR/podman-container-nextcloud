#!/bin/sh
php nextcloud/occ maintenance:install \
    --admin-user=admin \
    --admin-pass=password \
    --database=mysql \
    --database-user=nextcloud \
    --database-pass=password \
    --database-name=nextcloud \
    --database-host=db
php nextcloud/occ config:system:set trusted_domains 0 --value "*"
php nextcloud/occ config:system:set redis host --value 'db'
php nextcloud/occ config:system:set redis port --type=integer --value 6379
php nextcloud/occ config:system:set redis dbindex --type=integer --value 0
php nextcloud/occ config:system:set redis timeout --type=float --value 1.5
php nextcloud/occ config:system:set redis read_timeout --type=float --value 1.5
php nextcloud/occ config:system:set memcache.local --value '\OC\Memcache\APCu'
php nextcloud/occ config:system:set memcache.distributed --value '\OC\Memcache\Redis'
php nextcloud/occ config:system:set memcache.locking --value '\OC\Memcache\Redis'
php nextcloud/occ config:system:set maintenance_window_start --value 17
php nextcloud/occ config:system:set default_phone_region --value 'JP'
php nextcloud/occ config:system:set serverid --value 0
php nextcloud/occ maintenance:repair --include-expensive
php nextcloud/occ app:disable app_api

