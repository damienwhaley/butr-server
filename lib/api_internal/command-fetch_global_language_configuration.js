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
var butrApiJsonCommandFetchGlobalLanguageConfiguration = require('../api_json/command-fetch_global_language_configuration');
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
  
  var sqlString = sqlFetchGlobalLanguageConfiguration(sessionUuid, transactionUuid, messageInternal.uuid);
  
  // Save the global configuration setting.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_CONFIGURATION_GLOBAL_LANGUAGES, messageInternal.uuid, function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackFetchGlobalLanguageConfiguration(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson);
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
function callbackFetchGlobalLanguageConfiguration(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson) {
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
  outJson.fetch_global_language_configuration = {};
  
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
          outJson.fetch_global_language_configuration.uuid = jsonResult.rows[0]._table_uuid;
        }
        else {
          outJson.fetch_global_language_configuration.uuid = '';
        }
          
        if (jsonResult.rows[0].name_label !== undefined
          && jsonResult.rows[0].name_label !== null
          && jsonResult.rows[0].name_label !== '') {
          outJson.fetch_global_language_configuration.name_label = jsonResult.rows[0].name_label;
        }
        else {
          outJson.fetch_global_language_configuration.name_label = '';
        }
        
        if (jsonResult.rows[0].display_label !== undefined
          && jsonResult.rows[0].display_label !== null
          && jsonResult.rows[0].display_label !== '') {
          outJson.fetch_global_language_configuration.display_label = jsonResult.rows[0].display_label;
        }
        else {
          outJson.fetch_global_language_configuration.display_label = '';
        }
        
        if (jsonResult.rows[0].description !== undefined
          && jsonResult.rows[0].description !== null
          && jsonResult.rows[0].description !== '') {
          outJson.fetch_global_language_configuration.description = jsonResult.rows[0].description;
        }
        else {
          outJson.fetch_global_language_configuration.description = '';
        }
        
        if (jsonResult.rows[0].language_code !== undefined
          && jsonResult.rows[0].language_code !== null
          && jsonResult.rows[0].language_code !== '') {
          outJson.fetch_global_language_configuration.language_code = jsonResult.rows[0].language_code;
        }
        else {
          outJson.fetch_global_language_configuration.language_code = '';
        }
        
        if (jsonResult.rows[0].language_family !== undefined
          && jsonResult.rows[0].language_family !== null
          && jsonResult.rows[0].language_family !== '') {
          outJson.fetch_global_language_configuration.language_family = jsonResult.rows[0].language_family;
        }
        else {
          outJson.fetch_global_language_configuration.language_family = '';
        }
        
        if (jsonResult.rows[0].country_uuid !== undefined
          && jsonResult.rows[0].country_uuid !== null
          && jsonResult.rows[0].country_uuid !== '') {
          outJson.fetch_global_language_configuration.country_uuid = jsonResult.rows[0].country_uuid;
        }
        else {
          outJson.fetch_global_language_configuration.country_uuid = '';
        }
        
        if (jsonResult.rows[0].weighting !== undefined
          && jsonResult.rows[0].weighting !== null
          && !isNaN(jsonResult.rows[0].weighting)) {
          outJson.fetch_global_language_configuration.weighting = jsonResult.rows[0].weighting;
        }
        else {
          outJson.fetch_global_language_configuration.weighting = '';
        }

        if (jsonResult.rows[0].country_name !== undefined
          && jsonResult.rows[0].country_name !== null
          && jsonResult.rows[0].country_name !== '') {
          outJson.fetch_global_language_configuration.country_name = jsonResult.rows[0].country_name;
        }
        else {
          outJson.fetch_global_language_configuration.country_name = '';
        }
        
        if (jsonResult.rows[0].country_display_name !== undefined
	      && jsonResult.rows[0].country_display_name !== null
	      && jsonResult.rows[0].country_display_name !== '') {
	      outJson.fetch_global_language_configuration.country_display_name = jsonResult.rows[0].country_display_name;
	    }
	    else {
	      outJson.fetch_global_language_configuration.country_display_name = '';
	    }

        if (jsonResult.rows[0].is_active !== undefined
          && jsonResult.rows[0].is_active !== null) {
          if (jsonResult.rows[0].is_active === 0) {
            outJson.fetch_global_language_configuration.is_active = 0;
          }
          else {
            outJson.fetch_global_language_configuration.is_active = 1;
          }
        }
        else {
          outJson.fetch_global_language_configuration.is_active = '';
        }
        
        if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
          return butrApiJsonCommandFetchGlobalLanguageConfiguration.render(null, res, outJson, metaJson, sessionData);
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
    outJson.fetch_global_language_configuration.uuid = '';
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandFetchGlobalLanguageConfiguration.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * This builds the SQL query for fetching a global language configuration option.
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
function sqlFetchGlobalLanguageConfiguration(sessionUuid, transactionUuid, tableUuid) {
  'use strict';
  
  return "CALL p_configuration_FetchGlobalLanguage(@i_SessionUuid='"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(tableUuid)
    +"');";
}

/**
 * Module exports.
 */
module.exports.execute = execute;