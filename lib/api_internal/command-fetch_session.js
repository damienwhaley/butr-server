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

/**
  * Contributed module dependencies.
  */
var i18n = require('i18n');
var moment = require('moment');

/**
 * Butr module dependencies.
 */
var butrConstants = require('../butr-constants');
var butrApiJsonCommandFetchSession = require('../api_json/command-fetch_session');
var butrUtil = require('../butr-util');
var butrDatabase = require('../butr-database');
var butrReplication = require('../butr-replication');
var butrRedis = require('../butr-redis');

/**
 * This executes the fetch_session command.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param res
 *   - object containing the HTTP response.
 * @param metaJson
 *   - object containing the meta data about the command.
 * @param messageFormat
 *   - constant containing the message output format
 * @param messageInternal
 *   - object containing the message as it was requested.
 * @param sessionData
 *   - object containing the session data
 * @api public
 */
function execute(res, metaJson, messageFormat, messageInternal, sessionData) {
  'use strict';

  var outJson = {};
  var sessionUuid = butrUtil.getSessionToken(sessionData);
  var transactionUuid = butrUtil.getTransactionToken(metaJson);
  
  var sqlString = sqlSessionFetch(sessionUuid, transactionUuid);
    
  // Fetch the session details.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_SECURITY_SESSIONS, messageInternal.uuid, function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackFetchSession(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson);
  });
  
  // Store SQL start in meta data
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    if (sqlString !== undefined && sqlString !== null && typeof(sqlString) === 'string') {
      metaJson.sql.queryString.push(sqlString);
      metaJson.sql.start.push(new Date());
      metaJson.sql.isCacheable.push(true);
    }
  }
}

/**
 * This callback handles the output of the database and outputting based on this.
 * @param err
 *   - object containing any errors.
 * @param tableName
 *   - constant containing the database table name
 * @param uuid
 *   - string containing the uuid of the database table name
 * @param sqlQuery
 *   - string containing the sql which was executed.
 * @param jsonResult
 *   - object containing the results from the database.
 * @param res
 *   - object containing the HTTP response.
 * @param metaJson
 *   - object containing the meta data about the command.
 * @param sessionData
 *   - object containing the session data.
 * @param messageFormat
 *   - constant containing the message output format.
 * @param outJson
 *   - object containing the output in the internal format.
 * @api private
 */
function callbackFetchSession(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson) {
  'use strict';
  
  var sessionUuid = butrUtil.getSessionToken(sessionData);
  
  // Set output language
  var sessionLanguage = butrUtil.getSessionLanguage(sessionData);
  if (sessionLanguage !== '') {
    i18n.setLocale(sessionLanguage);
  }
  
  outJson.authentication = {};
  outJson.authentication.session_token = sessionUuid;
  
  outJson.result = {};
  outJson.result.status = butrConstants.MESSAGE_RESULT_OK;
  outJson.result.explanation = '';
  outJson.fetch_session = {};
  
  if (!err) {
    if (jsonResult !== undefined && jsonResult !== null && typeof(jsonResult) === 'object') {
      
      // Store SQL finish in meta data
      if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
        metaJson.sql.finish.push(new Date());
        if (jsonResult.resultFromCache !== undefined && jsonResult.resultFromCache !== null && typeof(jsonResult.resultFromCache) === 'boolean') {
          metaJson.sql.resultFromCache.push(jsonResult.resultFromCache);
        }
        else {
          metaJson.sql.resultFromCache.push(false);
        }
      } 
      
      if (jsonResult.rows.length > 0) {
        // Got results so return the session data.
        
        if (jsonResult.rows[0].token !== undefined && jsonResult.rows[0].token !== null && jsonResult.rows[0].token !== '') {          
          var newSessionData = {};
          
          if (jsonResult.rows[0].data !== undefined && jsonResult.rows[0].data !== null && typeof(jsonResult.rows[0].data) === 'string') {
            try {
              newSessionData = JSON.parse(jsonResult.rows[0].data);
            }
            catch (e)
            {
              // Do nothing
            }
            
            if (jsonResult.rows[0].expiry !== undefined && jsonResult.rows[0].expiry !== null && jsonResult.rows[0].expiry !== '') {
              var sessionExpiry = moment.utc(jsonResult.rows[0].expiry, 'YYYY-MM-DD HH:mm:ss');
              
              if (sessionExpiry !== undefined && sessionExpiry !== null) {
                newSessionData.expiry = sessionExpiry.format('YYYY-MM-DD HH:mm:ss');
              }
            }
            if (jsonResult.rows[0].session_length !== undefined && jsonResult.rows[0].session_length !== null && !isNaN(jsonResult.rows[0].session_length)) {
              newSessionData.session_length = jsonResult.rows[0].session_length;
            } 
          }
          outJson.fetch_session.data = newSessionData;
          
          if (butrDatabase.getNoSqlEngine() === 'redis') {
            // Save key to redis
            butrRedis.setKey(sessionUuid, JSON.stringify(newSessionData));
          }
          
        }
        else {
          outJson.result.status = butrConstants.MESSAGE_RESULT_ERROR;
          outJson.result.explanation = i18n.__('Could not find record.');
          outJson.fetch_session.data = {};
        }
        
        if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
          return butrApiJsonCommandFetchSession.render(null, res, outJson, metaJson, sessionData);
        }
      }
    }
  }
  
  // Store SQL finish in meta data if an error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }
  
  if (err || jsonResult === null || jsonResult === undefined) {
    outJson.result.status = butrConstants.MESSAGE_RESULT_ERROR;
    outJson.result.explanation = i18n.__('Could not execute command.');
    outJson.fetch_session.data = {};
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandFetchSession.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * This builds the SQL query for fetching the session.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionToken
 *   - The session token being searched on.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlSessionFetch(sessionToken, transactionUuid) {
  'use strict';
  
  if (sessionToken === null || sessionToken === undefined || sessionToken === '') {
    return '';
  }
  
  return "CALL p_security_FetchSession('"+butrDatabase.sanitiseSqlString(sessionToken)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)+"');";
}

/**
 * Module exports.
 */
module.exports.execute = execute;