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

/**
 * Butr module dependencies.
 */
var butrConstants = require('../butr-constants');
var butrApiJsonCommandModifyUser = require('../api_json/command-modify_user');
var butrUtil = require('../butr-util');
var butrDatabase = require('../butr-database');
var butrReplication = require('../butr-replication');

/**
 * This executes the modify_user command.
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
  
  var sqlString = sqlModifyUser(sessionUuid, transactionUuid, messageInternal.uuid, messageInternal.global_title_uuid, messageInternal.first_name, messageInternal.last_name, messageInternal.username, messageInternal.preferred_global_language_uuid);
  
  // Execute the stored procedure.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_PURGE, butrConstants.DATABASE_TABLE_USER_USERS, messageInternal.uuid, function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackModifyUser(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson);
  });
  
  // Store SQL start in meta data
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    if (sqlString !== undefined && sqlString !== null && typeof(sqlString) === 'string') {
      metaJson.sql.queryString.push(sqlString);
      metaJson.sql.start.push(new Date());
      metaJson.sql.isCacheable.push(false);
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
function callbackModifyUser(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson) {
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
  outJson.modify_user = {};
  
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
        // Got some results so grab the uuid of the new record.
        
        if (jsonResult.rows[0]._table_uuid !== undefined && jsonResult.rows[0]._table_uuid !== null && jsonResult.rows[0]._table_uuid !== '') {
          outJson.modify_user.uuid = jsonResult.rows[0]._table_uuid;
          
          // Queue up command for replication
          butrReplication.queueTransaction(metaJson);
        }
        else {
          outJson.result.status = butrConstants.MESSAGE_RESULT_ERROR;
          outJson.result.explanation = i18n.__('Could not modify record.');
          outJson.modify_user.uuid = '';
        }
        
        if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
          return butrApiJsonCommandModifyUser.render(null, res, outJson, metaJson, sessionData);
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
    outJson.modify_user.uuid = '';
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandModifyUser.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * This builds the SQL query for adding a user.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @param nameLabel
 *   - String continaing the name_label for the record.
 * @param displayLabel
 *   - String containing the display_label for the record.
 * @param description
 *   - String containing the description for the record.
 * @param languageCode
 *   - String containing the language_code for the record.
 * @param languageFamily
 *   - String containing the language_family for the record.
 * @param countryUuid
 *   - String containing the uuid for the country for the record.
 * @param weighting
 *   - Integer containing the weighting for the record.
 * @param isActive
 *   - Integer denoting the boolean for the is_active for the record.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlModifyUser(sessionUuid, transactionUuid, tableUuid, globalTitleUuid, firstName, lastName, username, preferredGlobalLanguageUuid) {
  'use strict';
  
  return "CALL p_user_ModifyUser('"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(tableUuid)
    +"', '"+butrDatabase.sanitiseSqlString(globalTitleUuid)
    +"', '"+butrDatabase.sanitiseSqlString(firstName)
    +"', '"+butrDatabase.sanitiseSqlString(lastName)
    +"', '"+butrDatabase.sanitiseSqlString(username)
    +"', '"+butrDatabase.sanitiseSqlString(preferredGlobalLanguageUuid)+"');";
}

/**
 * Module exports.
 */
module.exports.execute = execute;