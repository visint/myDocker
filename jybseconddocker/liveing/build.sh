#!/bin/sh
mkdocs build
rm -rf /usr/share/nginx/html/portal/site
cp /mnt/liveing/site /usr/share/nginx/html/portal/ -a

