#!/bin/bash
set -e
if [[ "$#" -eq 0 ]];then
  (/usr/local/SecoClient/promote/SecoClientPromoteService.sh start )&
  cd /usr/local/SecoClient/ && ./SecoClient
else
  exec "$@"
fi
