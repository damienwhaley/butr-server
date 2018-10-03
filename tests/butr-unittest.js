/*
 * Butr Universal Travel Reservations
 * A bleeding edge business management system for the travel industry.
 * 
 * Copyright (C) 2012 Whalebone Studios and contributors.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

'use strict';

// TODO: fix the database unit tests
// TODO: test the redis ones

/**
 * Contributed module dependencies.
 */

/**
 * Butr module dependencies
 */
var butrConstants = require('../lib/butr-constants');
var butrError = require('../lib/butr-error');
var butrDatabase = require('../lib/butr-database');
var butrMemcached = require('../lib/butr-memcached');
var butrMysql = require('../lib/butr-mysql');
var butrRedis = require('../lib/butr-redis');

/**
 * this runs the high level test combining the caching in front of the queries
 * @api public
 */
function databaseTest() {
  var sqlQuery = 'SELECT \'Database No Cache 2\' as col1, 12234 as col2, NOW() as col3 UNION SELECT \'second row\', 5678, NOW() UNION SELECT \'third row\', 1000011, NOW()';
  
  //butrDatabase.executeSqlQuery(sqlQuery, butrConstants.DATABASE_CACHE_NONE, butrConstants.DATABASE_TABLE_NONE, '0', printDatabaseResult);
  butrDatabase.executeSqlQuery(sqlQuery, butrConstants.DATABASE_CACHE_MEMCACHED, butrConstants.DATABASE_TABLE_NONE, '0', printDatabaseResult);
  //butrDatabase.executeSqlQuery(sqlQuery, butrConstants.DATABASE_CACHE_REDIS, butrConstants.DATABASE_TABLE_NONE, '0', printDatabaseResult);
  
  butrDatabase.executeSqlQuery(sqlQuery, butrConstants.DATABASE_CACHE_MEMCACHED, butrConstants.DATABASE_TABLE_NONE, '0', printDatabaseResult);
  //butrDatabase.executeSqlQuery(sqlQuery, butrConstants.DATABASE_CACHE_REDIS, butrConstants.DATABASE_TABLE_NONE, '0', printDatabaseResult);
};

/**
 * This runs the unit tests on the databas items
 * @api public
 */
function databaseUnitTest() {

  if (butrDatabase.getSqlEngine() === 'mysql-pool') {
    butrMysql.executeQuery('SELECT \'MySQL Pool = Hello, World!\' AS hello', butrConstants.MEMCACHED_TABLENONE, '0', printMysqlResult);
    
    for(var i = 0; i < 10; ++i) {
      butrMysql.executeQuery('SELECT \'MySQL Pool Counting\', '+i+' AS i', butrConstants.MEMCACHED_TABLENONE, '0', printMysqlResult);
    }
  }
  
  if (butrDatabase.getSqlEngine() === 'mysql') {
    butrMysql.executeQuery('SELECT \'MySQL = Hello, World!\' AS hello', butrConstants.MEMCACHED_TABLENONE, '0', printMysqlResult);
    
    for(var i = 0; i < 10; ++i) {
      butrMysql.executeQuery('SELECT \'MySQL Counting\', '+i+' AS i', butrConstants.MEMCACHED_TABLENONE, '0', printMysqlResult);
    }
  }
  
  if (butrDatabase.getNoSqlEngine() === 'redis') {
    butrRedis.setKey("string key", "string val");
    butrRedis.setHashKey("hash key", "hashtest 1", "some value");
    butrRedis.setHashKey(["hash key", "hashtest 2", "some other value"]);
    
    butrRedis.fetchKey("string key",
      function (err, replies, key, callback) {
        console.log('redis: ' + replies.length + " replies:");
        replies.forEach(function (reply, i) {
            console.log('redis :    ' + i + ": " + reply);
        });
      },
      function(err, result) { console.log(result); });};
    /*
    _redisConnection.hkeys("hash key", function (err, replies) {
      if (err) {
        butrError.logError(err, butrConstants.LOG_LEVEL_WARNING, 'BUTR-DATABASE_REDISERROR');
      } else {
        console.log('redis: ' + replies.length + " replies:");
        replies.forEach(function (reply, i) {
            console.log('redis :    ' + i + ": " + reply);
        });
      }
    });
    */
  
  if (butrDatabase.getCacheEngine() === 'memcached') {
    butrMemcached.setKey(undefined, butrConstants.DATABASE_TABLE_BOOKING, 'uuid', 'SELECT 1', '1');    
    butrMemcached.setKey(undefined, butrConstants.DATABASE_TABLE_BOOKING, 'uuid', 'SELECT 3', '3');    
    butrMemcached.setKey(undefined, butrConstants.DATABASE_TABLE_BOOKING, 'uuid', 'SELECT \'Damien Was Here\'', 'Damien Was Here');    
    butrMemcached.setKey(undefined, butrConstants.DATABASE_TABLE_BOOKING, 'uuid', 'SELECT 4', '4'); 
    butrMemcached.fetchKey('SELECT 1', butrConstants.DATABASE_TABLE_NONE, 'uuid', printMemcachedResult);    
    butrMemcached.deleteKey('SELECT 1'); 
    butrMemcached.fetchKey('SELECT 1', butrConstants.DATABASE_TABLE_NONE, 'uuid', printMemcachedResult);
    butrMemcached.fetchKey('SELECT \'Damien Was Here\'', butrConstants.DATABASE_TABLE_NONE, 'uuid', printMemcachedResult);      
    butrMemcached.fetchKey('SELECT 3', butrConstants.DATABASE_TABLE_NONE, 'uuid', printMemcachedResult);        
    butrMemcached.fetchKey('SELECT 4', butrConstants.DATABASE_TABLE_NONE, 'uuid', printMemcachedResult);     
  }
  
};


/**
 * this prints the memcached unit test result
 * @param err
 * @param result
 * @param sqlQuery
 * @api private
 */
function printMemcachedResult(err, result, sqlQuery) {
  if (err) {
    console.log('print memcached result (err): '+sqlQuery+' - '+err);
  }
  if (result) {
    console.log('print memcached result (result): '+sqlQuery);
    console.dir(result);
  }
  if (!result) {
    console.log('print memcached result (!result): '+sqlQuery);
  }  
}

/**
 * This prints the mysql unit test result
 * @param err
 * @param rows
 * @param fields
 * @param sqlQuery
 * @api private
 */
function printMysqlResult(err, rows, fields, sqlQuery) {
  if (err) {
    console.log('print mysql result (err): '+sqlQuery+' - '+err);
  }
  if (rows || fields) {
    var fields_out = '';
    var rows_out = '';
    
    if (rows) {
      rows_out = ' (rows:'+rows.length+')';
    }
    if (fields) {
      fields_out = ' (fields:'+fields.length+')';
    }
    
    console.log('print mysql result '+rows_out+fields_out+': '+sqlQuery);
  }
  if (!rows) {
    console.log('print mysql result (!rows): '+sqlQuery);
  }
  if (!fields) {
    console.log('print mysql result (!fields): '+sqlQuery);
  }
}

/**
 * This prints the redis unit test result
 * @param err
 * @param rows
 * @param fields
 * @param sqlQuery
 */
function printRedisTest(err, rows, fields, sqlQuery) {
  if (err) {
    console.log('print redis result (err): '+sqlQuery+' - '+err);
  }
  if (rows || fields) {
    var fields_out = '';
    var rows_out = '';
    
    if (rows) {
      rows_out = ' (rows:'+rows.length+')';
    }
    if (fields) {
      fields_out = ' (fields:'+fields.length+')';
    }  
    
    console.log('print redis result '+rows_out+fields_out+': '+sqlQuery);
  }
  if (!rows) {
    console.log('print redis result (!rows): '+sqlQuery);
  }
  if (!fields) {
    console.log('print redis result (!fields): '+sqlQuery);
  }  
}

/**
 * This prints the database unit test result
 * @param err
 * @param tableName
 * @param uuid
 * @param sqlQuery
 * @param jsonResult
 * @api private
 */
function printDatabaseResult(err, tableName, uuid, sqlQuery, jsonResult) {
  if (err) {
    console.log('print database result (err): '+sqlQuery+' - ');
    console.dir(err);
  }
  if (jsonResult !== undefined && jsonResult !== null) {
    console.dir(jsonResult);
  }  
}

/**
 * Module exports
 */
module.exports.databaseTest = databaseTest;
module.exports.databaseUnitTest = databaseUnitTest;