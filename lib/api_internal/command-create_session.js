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
var butrDatabase = require('../butr-database');
var butrConstants = require('../butr-constants');
var butrApiJsonCommandCreateSesion = require('../api_json/command-create_session');
var butrUtil = require('../butr-util');
var butrRedis = require('../butr-redis');

/**
 * This executes the create_session command.
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
  
  var languageCode = '';
  var sessionToken = '';
  var isDifferent = false;
  
  var outJson = {};
  outJson.authentication = {};
  
  sessionToken = butrUtil.getSessionToken(sessionData);
  outJson.authentication.session_token = sessionToken;
  
  outJson.result = {};
  outJson.result.status = butrConstants.MESSAGE_RESULT_OK;
  outJson.result.explanation = '';
  outJson.create_session = {};
  
  if (messageInternal.language !== undefined && messageInternal.language !== null
    && messageInternal.language !== '' && typeof(messageInternal.language) === 'string') {
    switch(messageInternal.language.toLowerCase()) {
    case 'en-au':
      languageCode = 'en-AU';
      break;
    case 'en':
      languageCode = 'en';
      break;
    case 'se':
      languageCode = 'se';
      break;
    case 'fr':
      languageCode = 'fr';
      break;
    case 'de':
      languageCode = 'de';
      break;
    case '':
      // Do nothing
      break;
    default:
      languageCode = '';
      outJson.result.status = butrConstants.MESSAGE_RESULT_WARNING;
      outJson.result.explanation = i18n.__('Could not change to requested language, so using %s instead.', sessionData.language);
      break;
    }
    
    if (languageCode !== '') {
      
      if (sessionData.language !== undefined && sessionData.language !== null && sessionData.language !== '') {
        if (languageCode !== sessionData.language) {
          isDifferent = true;
        }
      }
      sessionData.language = languageCode;
      outJson.create_session.language = languageCode;
      i18n.setLocale(languageCode);
    }
  }
  
  outJson.result.status = butrConstants.MESSAGE_RESULT_OK;
  
  if (isDifferent === true) {
    var stringifiedData = JSON.stringify(sessionData);
    
    if (butrDatabase.getNoSqlEngine() === 'redis') {
      // Save the key to redis
      butrRedis.setKey(sessionToken, stringifiedData);
    }
    
    var sqlString = sqlSessionModify(sessionToken, languageCode, stringifiedData, metaJson.command.transaction);
    
    // Modify the session in the database
    butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_NONE, butrConstants.DATABASE_TABLE_NONE, '0', function (err, tableName, uuid, sqlQuery, jsonResult) {
      'use strict';
        
      callbackModifySession(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson);
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
  else {
    if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
      return butrApiJsonCommandCreateSesion.render(null, res, outJson, metaJson, sessionData);
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
 * @returns
 */
function callbackModifySession(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson) {
  'use strict';
  
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
        if(jsonResult.rows[0].token !== null && jsonResult.rows[0].token !== undefined && jsonResult.rows[0].token !== '') {
          // Language change good, so output 
          if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
            return butrApiJsonCommandCreateSesion.render(null, res, outJson, metaJson, sessionData);
          }
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
    outJson.result.status = butrConstants.MESSAGE_RESULT_WARNING;
    outJson.result.explanation = i18n.__('Could not change to requested language, so using %s instead.', sessionData.language);
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandCreateSesion.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * This builds the SQL query for modifying the session.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionToken
 *   - The session token being searched on.
 * @param languageCode
 *   - String containing the new language code.
 * @param sessionData
 *   - object containing the session data.
 * @param transactionUuid
 *   - String containing the UUID of the transaction.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlSessionModify(sessionToken, languageCode, sessionData, transactionUuid) {
  'use strict';
  
  if(sessionToken === null || sessionToken === undefined || sessionToken === '') {
    return '';
  }
  
  if(languageCode === null || languageCode === undefined || languageCode === '') {
    return '';
  }
  
  if(transactionUuid === null || transactionUuid === undefined || transactionUuid === '') {
    return '';
  }
  
  return "CALL p_security_ModifySession('"+butrDatabase.sanitiseSqlString(sessionToken)
    +"', '"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(sessionToken)
    +"', '"+butrDatabase.sanitiseSqlString(sessionData)
    +"', '"+butrDatabase.sanitiseSqlString(languageCode)+"');";
}

/**
 * Module exports.
 */
module.exports.execute = execute;