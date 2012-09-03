#!/bin/bash

export NODE_ENV=laptop

if [ -z $1 ]
then
  echo "Usage: $0 {start|stop}"
  exit 0
fi

cd /home/damien/Projects/node.js/butr

if [[ "$1" -eq "start" ]]
then
  echo "Removing Logs"
  rm logs/*.log
  
  echo "Restarting Memcached"
  sudo service memcached restart
  
  echo "Flushing Redis Keys"
  redis-cli flushall
  
  echo "Starting Butr"
fi

node_modules/forever/bin/forever $1 server.js

