#!/bin/bash

export NODE_ENV=test
cd /var/lib/jenkins/jobs/butr-server/workspace
scripts/butr_test.sh start &
sleep 5
node_modules/mocha/bin/mocha tests/mocha/*-test.js
sleep 5
node_modules/forever/bin/forever stop server.js
