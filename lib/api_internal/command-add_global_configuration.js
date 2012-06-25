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
var butrApiJsonCommandAddGlobalConfiguration = require('../api_json/command-add_global_configuration');
var butrUtil = require('../butr-util');
var butrDatabase = require('../butr-database');
var butrReplication = require('../butr-replication');

/**
 * This executes the list_user_docks command.
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
  
  var sqlString = sqlAddGlobalConfiguration(sessionUuid, transactionUuid, messageInternal.name_label, messageInternal.display_label, messageInternal.magic, messageInternal.description, messageInternal.text_setting, messageInternal.integer_setting, messageInternal.float_setting, messageInternal.datetime_setting, messageInternal.uuid_setting, messageInternal.bit_setting);
  
  // Execute the query.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_PURGE, butrConstants.DATABASE_TABLE_CONFIGURATION_GLOBALS, '0', function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackAddGlobalConfiguration(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson);
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
function callbackAddGlobalConfiguration(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson) {
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
  outJson.add_global_configuration = {};
  
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
          outJson.add_global_configuration.uuid = jsonResult.rows[0]._table_uuid;
          
          // Queue up command for replication
          butrReplication.queueTransaction(metaJson);
        }
        else {
          outJson.result.status = butrConstants.MESSAGE_RESULT_ERROR;
          outJson.result.explanation = i18n.__('Could not add record.');
          outJson.add_global_configuration.uuid = '';
        }
        
        if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
          return butrApiJsonCommandAddGlobalConfiguration.render(null, res, outJson, metaJson, sessionData);
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
    outJson.add_global_configuration.uuid = '';
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandAddGlobalConfiguration.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * This builds the SQL query for adding a global configuration option.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @param nameLabel
 *   - String continaing the name_label for the record.
 * @param displayLabel
 *   - String containing the display_label for the record.
 * @param magic
 *   - String containing the magic code for the record.
 * @param description
 *   - String containing the description for the record.
 * @param textSetting
 *   - String containing the text_setting for the record.
 * @param integerSetting
 *   - Integer containing the integer_setting for the record.
 * @param floatSetting
 *   - Float containing the float_setting for the record.
 * @param datetimeSetting
 *   - Date containing the datetime_setting for the record.
 * @param uuidSetting
 *   - String containing the uuid_setting for the record.
 * @param bitSetting
 *   - Integer containing the bit_setting for the record.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlAddGlobalConfiguration(sessionUuid, transactionUuid, nameLabel, displayLabel, magic, description, textSetting, integerSetting, floatSetting, datetimeSetting, uuidSetting, bitSetting) {
  'use strict';
  
  return "CALL p_configuration_AddGlobal('"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(nameLabel)
    +"', '"+butrDatabase.sanitiseSqlString(displayLabel)
    +"', '"+butrDatabase.sanitiseSqlString(magic)
    +"', '"+butrDatabase.sanitiseSqlString(textSetting)
    +"', "+butrDatabase.sanitiseSqlInteger(integerSetting, null)
    +", "+butrDatabase.sanitiseSqlFloat(floatSetting, null)
    +", '"+butrDatabase.sanitiseSqlDateTime(datetimeSetting, false)
    +"', '"+butrDatabase.sanitiseSqlString(uuidSetting)
    +"', "+butrDatabase.sanitiseSqlBoolean(bitSetting)
    +", '"+butrDatabase.sanitiseSqlString(description)+"');";
}

/**
 * Module exports.
 */
module.exports.execute = execute;