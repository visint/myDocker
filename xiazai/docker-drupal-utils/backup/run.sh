#!/bin/sh

cd ${DRUPAL_ROOT}

# TODO: Support Drupal 7
PUBLIC_FOLDER=$(drush ev "echo Drupal\Core\StreamWrapper\PublicStream::basePath();")
PRIVATE_FOLDER=$(drush ev "echo Drupal\Core\StreamWrapper\PrivateStream::basePath();")

# TODO: Support multisite config.
echo "Backup database"
drush sql-dump --skip-tables-key=common > /var/backups/${SITE_FOLDER}.sql
echo "Backup public files"
tar -zcvf /var/backups/${SITE_FOLDER}_public.tar.gz -C ${PUBLIC_FOLDER} .

# TODO: Check if folder exists.
echo "Backup private files"
tar -zcvf /var/backups/${SITE_FOLDER}_private.tar.gz -C ${PRIVATE_FOLDER} .
