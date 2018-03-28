#!/bin/sh

cd ${DRUPAL_ROOT}

# TODO: Support Drupal 7
PUBLIC_FOLDER=$(drush ev "echo Drupal\Core\StreamWrapper\PublicStream::basePath();")
PRIVATE_FOLDER=$(drush ev "echo Drupal\Core\StreamWrapper\PrivateStream::basePath();")

# TODO: Check if files exist
# TODO: Support multisite config.
echo "Restore database"
drush sql-cli < /var/backups/${SITE_FOLDER}.sql
echo "Restore public files"
tar -zxvf /var/backups/${SITE_FOLDER}_public.tar.gz -C ${PUBLIC_FOLDER}

# TODO: Check if folder exists.
echo "Restore private files"
tar -zxvf /var/backups/${SITE_FOLDER}_private.tar.gz -C ${PRIVATE_FOLDER}
