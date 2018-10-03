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
var butrLog = require('../butr-log');
var butrUtil = require('../butr-util');

/**
 * This extends the length of a session after a command has been executed, and this
 * is a fire and forget.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param metaJson
 *   - object containing the meta data
 * @param sessionData
 *   - object containing the session data
 * @api public
 */
function extendLogMeta(metaJson, sessionData) {
  'use strict';
  
  var sessionUuid = butrUtil.getSessionToken(sessionData);
  var transactionUuid = butrUtil.getTransactionToken(metaJson);
  
  if (sessionUuid === undefined || sessionUuid === null || sessionUuid === '') {
	// Don't even try to extend an invalid session.
	return logMeta(metaJson, sessionData);
  }
  
  var sqlString = sqlExtendSession(sessionUuid, transactionUuid);
  
  // Extend the session in the database
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_NONE, butrConstants.DATABASE_TABLE_NONE, '0', function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackExtendSession(err, tableName, uuid, sqlQuery, jsonResult, metaJson, sessionData);
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
 * This callback handles the extending of a session.
 * @author Damien Whaley <damien@whalebonestudios.com>
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
 * @param metaJson
 *   - object containing the metadata for the transaction.
 * @param sessionData
 *   - object containing the session data.
 * @api private
 */
function callbackExtendSession(err, tableName, uuid, sqlQuery, jsonResult, metaJson, sessionData) {
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
      if (metaJson.command !== undefined && metaJson.command !== null && typeof(metaJson.command) === 'object') {
        metaJson.command.finish = new Date();
      }
      
      if (jsonResult.rows.length > 0) {
        // Got some results so session has been extended.
        
        if (jsonResult.rows[0].token !== undefined && jsonResult.rows[0].token !== null && jsonResult.rows[0].token !== '') {
          return logMeta(metaJson, sessionData);
        }
      }
    }
  }
  
  // Store SQL finish in meta data if an error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }
  if (metaJson.command !== undefined && metaJson.command !== null && typeof(metaJson.command) === 'object') {
    metaJson.command.finish = new Date();
  }
  
  var sessionUuid = butrUtil.getSessionToken(sessionData);
  
  // Write to the log that the session could not be extended and continue
  butrLog.writeLog(butrConstants.LOG_LEVEL_WARNING, i18n.__('Could not extend session %s.', sessionUuid));
  logMeta(metaJson, sessionData);
}

/**
 * This function is the stub to log the meta data into various places. This is a
 * fire and forget function.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param metaJson
 *   - the object containing the meta data about the command.
 * @param sessionData
 *   - the object containing the data for the session.
 * @api public
 */
function logMeta(metaJson, sessionData) {
  'use strict';
  
  if (metaJson !== undefined && metaJson !== null && typeof(metaJson) === 'object') {
    // Record end time of command.
    if (metaJson.command !== undefined && metaJson.command !== null && typeof(metaJson.command) === 'object') {
      metaJson.command.finish = new Date();
    }
    
    // Save the message in and out to the database system (and maybe file system too).
    logMessage(metaJson.session.token, metaJson.command.transaction,
      metaJson.command.name, metaJson.session.user, metaJson.command.start,
      metaJson.command.finish, metaJson.command.request, metaJson.command.response);
    
    // Loop through the sql queries
    for (var i = 0; i < metaJson.sql.queryString.length; i++) {
      logSqlQuery(metaJson.session.token, metaJson.command.transaction,
        metaJson.sql.queryString[i], metaJson.session.user,  metaJson.sql.start[i],
        metaJson.sql.finish[i], metaJson.sql.isCacheable[i], metaJson.sql.resultFromCache[i]);
    }
    
    // Write the message log to the file system
    butrLog.writeMessageLog(metaJson.command.request, metaJson.command.response);
  }
}

/**
 * This logs the SQL query to the logging table in the database. This is fire and forget.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sesisonUuid
 *   - UUID containing the session token.
 * @param transactionUuid
 *   - UUID containing the transaciton identifier.
 * @param sqlQuery
 *   - string containing the query which was executed.
 * @param userUuid
 *   - UUID containing the identifier for the user who execute the query
 * @param queryStart
 *   - the timestamp the query began on
 * @param queryFinish
 *   - the timestamp the query finished executing on
 * @param isCacheable
 *   - boolean denoting whether the query is cacheable
 * @param resultFromCache
 *   - boolean denoting the results came from the cache and not the database
 * @api private  
 */
function logSqlQuery(sessionUuid, transactionUuid, sqlQuery, userUuid, queryStart, queryFinish, isCacheable, resultFromCache) {
  'use strict';
  
  var executionTime = queryFinish - queryStart;

  var sqlString = sqlLogSqlQuery(sessionUuid, transactionUuid, sqlQuery,
   queryStart, userUuid, executionTime, isCacheable, resultFromCache);
  
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_NONE, butrConstants.DATABASE_TABLE_NONE, '', null);
}

/**
 * This logs the message to the logging table in the database. This is fire and forget.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sesisonUuid
 *   - UUID containing the session token.
 * @param transactionUuid
 *   - UUID containing the transaciton identifier.
 * @param messageName
 *   - string containing the message which was executed.
 * @param userUuid
 *   - UUID containing the identifier for the user who execute the query
 * @param messageStart
 *   - the timestamp the message began on
 * @param messageFinish
 *   - the timestamp the message finished executing on
 * @param request
 *   - string containing the request
 * @param response
 *   - string containing the response
 * @api private  
 */
function logMessage(sessionUuid, transactionUuid, messageName, userUuid, messageStart, messageFinish, request, response) {
  'use strict';
  
  var executionTime = messageFinish - messageStart;

  var sqlString = sqlLogMessage(sessionUuid, transactionUuid, messageName,
   messageStart, userUuid, executionTime, request, response);
  
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_NONE, butrConstants.DATABASE_TABLE_NONE, '', null);
}

/**
 * This builds the SQL to log the query which has been run.
 * @param sessionUuid
 *   - UUID containing the session token.
 * @param transactionUuid
 *   - UUID containing the transaction for the given session.
 * @param sqlQuery
 *   - String containing the query to be executed.
 * @param queryTimestamp
 *   - date containing the timestamp the query was run
 * @param userUuid
 *   - UUID containing the id of the user.
 * @param executionTime
 *   - integer containing the number of miliseconds to execute the command.
 * @param isChacheable
 *   - boolean indicating whether the query can be cached.
 * @param resultFromCache
 *   - boolean indicating whether the query result came from the cache.  
 * @returns string
 *   - Contains the SQL to be executed.
 * @api private
 */
function sqlLogSqlQuery(sessionUuid, transactionUuid, sqlQuery, queryTimestamp, userUuid, executionTime, isCacheable, resultFromCache) {
  'use strict';
  
  if (sqlQuery === undefined || sqlQuery === null || sqlQuery === '' || typeof(sqlQuery) !== 'string') {
    return '';
  }
  
  return "CALL p_system_LogQuery('"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(transactionUuid)+"', '"
    +butrDatabase.sanitiseSqlString(sqlQuery)+"', '"
    +butrDatabase.sanitiseSqlDateTime(queryTimestamp, true)+"', '"
    +butrDatabase.sanitiseSqlString(userUuid)+"', "
    +butrDatabase.sanitiseSqlInteger(executionTime, 0)+", "
    +butrDatabase.sanitiseSqlBoolean(isCacheable)+", "
    +butrDatabase.sanitiseSqlBoolean(resultFromCache)+");";
}

/**
 * This builds the SQL to log the messgae which has been run.
 * @param sessionUuid
 *   - UUID containing the session token.
 * @param transactionUuid
 *   - UUID containing the transaction for the given session.
 * @param messageName
 *   - String containing the query to be executed.
 * @param messageTimestamp
 *   - date containing the timestamp the message was run
 * @param userUuid
 *   - UUID containing the id of the user.
 * @param executionTime
 *   - integer containing the number of milliseconds to execute the command.
 * @param request
 *   - string containing the request
 * @param response
 *   - string containing the response.  
 * @returns string
 *   - Contains the SQL to be executed.
 * @api private
 */
function sqlLogMessage(sessionUuid, transactionUuid, messageName, messageTimestamp, userUuid, executionTime, request, response) {
  'use strict';
  
  if (messageName === undefined || messageName === null || typeof(messageName) !== 'string') {
    messageName = '';
  }
  
  return "CALL p_system_LogMessage('"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(transactionUuid)+"', '"
    +butrDatabase.sanitiseSqlString(messageName)+"', '"
    +butrDatabase.sanitiseSqlDateTime(messageTimestamp, true)+"', '"
    +butrDatabase.sanitiseSqlString(userUuid)+"', "
    +butrDatabase.sanitiseSqlInteger(executionTime, 0)+", '"
    +butrDatabase.sanitiseSqlString(request)+"', '"
    +butrDatabase.sanitiseSqlString(response)+"');";
}

/**
 * This builds the SQL query for extending the session.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlExtendSession(sessionUuid, transactionUuid) {
  'use strict';
  
  return "CALL p_security_ExtendSession('"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(sessionUuid)+"');";
}

/**
 * Module exports.
 */
module.exports.logMeta = logMeta;
module.exports.extendLogMeta = extendLogMeta;