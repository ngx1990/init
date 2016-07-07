#!/bin/bash
# This script run at 00:00
# 老版本切割Nginx日志

# The Nginx logs path
logs_path="/usr/local/nginx/logs/"

#mkdir -p ${logs_path}$(date -d "yesterday" +"%Y")/$(date -d "yesterday" +"%m")/
mv ${logs_path}access.log ${logs_path}access_$(date -d "yesterday" +"%Y%m%d").log
kill -USR1 `cat /usr/local/nginx/logs/nginx.pid`