#!/bin/bash

export NODE_ENV=test
cd /var/lib/jenkins/jobs/butr-server/workspace
/usr/local/bin/npm install
#mysql -u root -pDBPASS < install/00_schema.sql
