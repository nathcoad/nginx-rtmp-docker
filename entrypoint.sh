#!/bin/sh

# Set up config file
cp -v /nginx.conf /etc/nginx/nginx.conf
sed -i -e "s/PASSWORDTOKEN/${PASSWORD}/" /etc/nginx/nginx.conf

# Adjust permissions for video files
chmod 777 /hls
chmod 777 /recordings

# Start nginx
nginx -g "daemon off;"