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
var butrApiJsonCommandFetchRole = require('../api_json/command-fetch_role');
var butrUtil = require('../butr-util');
var butrDatabase = require('../butr-database');

/**
 * This executes the fetch_global_configuration command.
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
  
  var sqlString = sqlFetchRole(sessionUuid, transactionUuid, messageInternal.uuid);
  
  // Execute the query.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE,
	butrConstants.DATABASE_TABLE_SECURITY_ROLES, messageInternal.uuid,
	function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackFetchRole(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson);
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
 * This callback handles the saving of the database and outputting based on this.
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
function callbackFetchRole(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson) {
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
  outJson.fetch_role = {};
  
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
        // Got some results so prepare them for presentation.
        
        if (jsonResult.rows[0]._table_uuid !== undefined
          && jsonResult.rows[0]._table_uuid !== null
          && jsonResult.rows[0]._table_uuid !== '') {
          outJson.fetch_role.uuid = jsonResult.rows[0]._table_uuid;
        }
        else {
          outJson.fetch_role.uuid = '';
        }
          
        if (jsonResult.rows[0].role_name !== undefined
          && jsonResult.rows[0].role_name !== null
          && jsonResult.rows[0].role_name !== '') {
          outJson.fetch_role.role_name = jsonResult.rows[0].role_name;
        }
        else {
          outJson.fetch_role.role_name = '';
        }
        
        if (jsonResult.rows[0].partition_uuid !== undefined
          && jsonResult.rows[0].partition_uuid !== null
          && jsonResult.rows[0].partition_uuid !== '') {
          outJson.fetch_role.partition_uuid = jsonResult.rows[0].partition_uuid;
        }
        else {
          outJson.fetch_role.partition_uuid = '';
        }
        
        if (jsonResult.rows[0].partition_name !== undefined
          && jsonResult.rows[0].partition_name !== null
          && jsonResult.rows[0].partition_name !== '') {
          outJson.fetch_role.partition_name = jsonResult.rows[0].partition_name;
        }
        else {
          outJson.fetch_role.partition_name = '';
        }
        
        if (jsonResult.rows[0].description !== undefined
          && jsonResult.rows[0].description !== null
          && jsonResult.rows[0].description !== '') {
          outJson.fetch_role.description = jsonResult.rows[0].description;
        }
        else {
          outJson.fetch_role.description = '';
        }

        if (jsonResult.rows[0].is_active !== undefined
          && jsonResult.rows[0].is_active !== null) {
          if (jsonResult.rows[0].is_active === 0) {
            outJson.fetch_role.is_active = 0;
          }
          else {
            outJson.fetch_role.is_active = 1;
          }
        }
        else {
          outJson.fetch_role.is_active = '';
        }
        
        if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
          return butrApiJsonCommandFetchRole.render(null, res, outJson, metaJson, sessionData);
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
    outJson.fetch_role.uuid = '';
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandFetchRole.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * This builds the SQL query for fetching a role.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @param tableUuid
 *   - String containing the UUID of the record to fetch.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlFetchRole(sessionUuid, transactionUuid, tableUuid) {
  'use strict';
  
  return "CALL p_security_FetchRole(@i_SessionUuid='"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(tableUuid)
    +"');";
}

/**
 * Module exports.
 */
module.exports.execute = execute;