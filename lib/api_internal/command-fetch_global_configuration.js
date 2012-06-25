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
var butrApiJsonCommandFetchGlobalConfiguration = require('../api_json/command-fetch_global_configuration');
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
  
  var sqlString = sqlFetchGlobalConfiguration(sessionUuid, transactionUuid, messageInternal.uuid, messageInternal.magic);
  
  // Save the global configuration setting.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_CONFIGURATION_GLOBALS, messageInternal.uuid, function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackFetchGlobalConfiguration(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson);
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
function callbackFetchGlobalConfiguration(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson) {
  'use strict';
  
  var setting = '';
  var sessionUuid = butrUtil.getSessionToken(sessionData);
  var foundSetting = false;
  
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
  outJson.fetch_global_configuration = {};
  
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
          outJson.fetch_global_configuration.uuid = jsonResult.rows[0]._table_uuid;
        }
        else {
          outJson.fetch_global_configuration.uuid = '';
        }
          
        if (jsonResult.rows[0].name_label !== undefined
          && jsonResult.rows[0].name_label !== null
          && jsonResult.rows[0].name_label !== '') {
          outJson.fetch_global_configuration.name_label = jsonResult.rows[0].name_label;
        }
        else {
          outJson.fetch_global_configuration.name_label = '';
        }
        
        if (jsonResult.rows[0].display_label !== undefined
          && jsonResult.rows[0].display_label !== null
          && jsonResult.rows[0].display_label !== '') {
          outJson.fetch_global_configuration.display_label = jsonResult.rows[0].display_label;
        }
        else {
          outJson.fetch_global_configuration.display_label = '';
        }
        
        if (jsonResult.rows[0].description !== undefined
          && jsonResult.rows[0].description !== null
          && jsonResult.rows[0].description !== '') {
          outJson.fetch_global_configuration.description = jsonResult.rows[0].description;
        }
        else {
          outJson.fetch_global_configuration.description = '';
        }
        
        if (jsonResult.rows[0].magic !== undefined
          && jsonResult.rows[0].magic !== null
          && jsonResult.rows[0].magic !== '') {
          outJson.fetch_global_configuration.magic = jsonResult.rows[0].magic;
        }
        else {
          outJson.fetch_global_configuration.magic = '';
        }
        
        if (jsonResult.rows[0].text_setting !== undefined
          && jsonResult.rows[0].text_setting !== null
          && jsonResult.rows[0].text_setting !== '') {
          outJson.fetch_global_configuration.text_setting = jsonResult.rows[0].text_setting;
          if (foundSetting === false) {
            setting = jsonResult.rows[0].text_setting;
            foundSetting = true;
          }
        }
        else {
          outJson.fetch_global_configuration.text_setting = '';
        }
        
        if (jsonResult.rows[0].integer_setting !== undefined
          && jsonResult.rows[0].integer_setting !== null
          && !isNaN(jsonResult.rows[0].integer_setting)) {
          outJson.fetch_global_configuration.integer_setting = jsonResult.rows[0].integer_setting;
          if (foundSetting === false) {
            setting = jsonResult.rows[0].integer_setting;
            foundSetting = true;
          }
        }
        else {
          outJson.fetch_global_configuration.integer_setting = '';
        }
        
        if (jsonResult.rows[0].float_setting !== undefined
          && jsonResult.rows[0].float_setting !== null
          && !isNaN(jsonResult.rows[0].float_setting)) {
          outJson.fetch_global_configuration.float_setting = jsonResult.rows[0].float_setting;
          if (foundSetting === false) {
            setting = jsonResult.rows[0].float_setting;
            foundSetting = true;
          }
        }
        else {
          outJson.fetch_global_configuration.float_setting = '';
        }
 
        if (jsonResult.rows[0].datetime_setting !== undefined
          && jsonResult.rows[0].datetime_setting !== null
          && jsonResult.rows[0].datetime_setting !== '') {
          var dt = moment(jsonResult.rows[0].datetime_setting);
          if (dt !== undefined && dt !== null) {
            outJson.fetch_global_configuration.datetime_setting = dt.format('YYYY-MM-DD HH:mm:ss');
            if (foundSetting === false) {
              setting = dt.format('YYYY-MM-DD HH:mm:ss');
              foundSetting = true;
            }
          }
          else {
            outJson.fetch_global_configuration.datetime_setting = '';
          }
        }
        else {
          outJson.fetch_global_configuration.datetime_setting = '';
        }

        if (jsonResult.rows[0].uuid_setting !== undefined
          && jsonResult.rows[0].uuid_setting !== null
          && jsonResult.rows[0].uuid_setting !== '') {
          outJson.fetch_global_configuration.uuid_setting = jsonResult.rows[0].uuid_setting;
          if (foundSetting === false) {
            setting = jsonResult.rows[0].uuid_setting;
            foundSetting = true;
          }
        }
        else {
          outJson.fetch_global_configuration.uuid_setting = '';
        }

        if (jsonResult.rows[0].bit_setting !== undefined
          && jsonResult.rows[0].bit_setting !== null) {
          if (jsonResult.rows[0].bit_setting === 0) {
            outJson.fetch_global_configuration.bit_setting = 0;
          }
          else {
            outJson.fetch_global_configuration.bit_setting = 1;
          }
          
          if (foundSetting === false) {
            setting = outJson.fetch_global_configuration.bit_setting;
            foundSetting = true;
          }
        }
        else {
          outJson.fetch_global_configuration.bit_setting = null;
        }
        
        if (setting !== undefined && setting !== null) {
          outJson.fetch_global_configuration.effective_setting = setting;
        }
        else {
          outJson.fetch_global_configuration.effective_setting = null;
        }
        
        if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
          return butrApiJsonCommandFetchGlobalConfiguration.render(null, res, outJson, metaJson, sessionData);
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
    outJson.fetch_global_configuration.uuid = '';
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandFetchGlobalConfiguration.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * This builds the SQL query for fetching a global configuration option.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @param tableUuid
 *   - String containing the UUID of the record to fetch.
 * @param magic
 *   - String containing the magic of the record to fetch
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlFetchGlobalConfiguration(sessionUuid, transactionUuid, tableUuid, magic) {
  'use strict';
  
  return "CALL p_configuration_FetchGlobal(@i_SessionUuid='"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(tableUuid)
    +"', '"+butrDatabase.sanitiseSqlString(magic)
    +"');";
}

/**
 * Module exports.
 */
module.exports.execute = execute;