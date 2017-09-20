#!/bin/sh
cd /mnt/markdown
mkdocs build
rm -rf /usr/share/nginx/html/portal/site
cp /mnt/markdown/site /usr/share/nginx/html/portal/ -a

