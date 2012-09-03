#!/bin/bash

export NODE_ENV=production

if [ -z $1 ]
then
  echo "Usage: $0 {start|stop}"
  exit 0
fi

cd /home/damien/Projects/node.js/butr

echo "Starting Butr"
node_modules/forever/bin/forever $1 server.js
