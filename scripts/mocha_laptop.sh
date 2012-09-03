#!/bin/bash

export NODE_ENV=laptop
cd /home/damien/Projects/node.js/butr
scripts/butr_laptop.sh start &
sleep 5
node_modules/mocha/bin/mocha --reporter spec --ui bdd tests/mocha/*-test.js
sleep 5
node_modules/forever/bin/forever stop server.js
