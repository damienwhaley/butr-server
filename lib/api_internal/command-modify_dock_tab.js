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
var butrApiJsonCommandModifyDockTab = require('../api_json/command-modify_dock_tab');
var butrUtil = require('../butr-util');
var butrDatabase = require('../butr-database');
var butrReplication = require('../butr-replication');

/**
 * This executes the modify_dock_tab command.
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
  
  var sqlString = sqlModifyDockTab(sessionUuid,
	transactionUuid, messageInternal.uuid, messageInternal.security_client_type_uuid,
	messageInternal.system_dock_type_uuid, messageInternal.tab_name,
	messageInternal.display_name, messageInternal.description,
	messageInternal.weighting, messageInternal.picture_path, messageInternal.tab_action,
	messageInternal.magic, messageInternal.is_record_equired, messageInternal.is_active);
  
  // Save the global configuration setting.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_PURGE,
    butrConstants.DATABASE_TABLE_SYSTEM_DOCK_TABS, messageInternal.uuid, function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackModifyDockTab(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson);
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
function callbackModifyDockTab(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson) {
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
  outJson.modify_dock_tab = {};
  
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
          outJson.modify_dock_tab.uuid = jsonResult.rows[0]._table_uuid;
          
          // Queue up command for replication
          butrReplication.queueTransaction(metaJson);
        }
        else {
          outJson.result.status = butrConstants.MESAGE_STATUS_ERROR;
          outJson.result.explanation = i18n.__('Could not modify record.');
          outJson.modify_dock_tab.uuid = '';
        }
        
        if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
          return butrApiJsonCommandModifyDockTab.render(null, res, outJson, metaJson, sessionData);
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
    outJson.modify_dock_tab.uuid = '';
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandModifyDockTab.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * This builds the SQL query for modifying a dock tab.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @param securityClientTypeUuid
 *   - String containing the UUID for the security_client_type of the record.
 * @param systemDockTypeUuid
 *   - String containing the uuid of the type of dock item.
 * @param tabName
 *   - String containing the tab_name for the record.
 * @param displayName
 *   - String containing the display_name for the record.
 * @param description
 *   - String containing the description for the record.
 * @param weighting
 *   - Integer containing the weighting of the dock.
 * @param picturePath
 *   - String containing the address of the picture_path for the dock tab.
 * @param tabAction
 *   - String containing the tab_action for the dock tab.
 * @param magic
 *   - String containing the magic for the dock tab.
 * @param isRecordRequired
 *   - Integer denoting the boolean for the is_record_required for the record.
 * @param isActive
 *   - Integer denoting the boolean for the is_active for the record.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlModifyDockTab(sessionUuid, transactionUuid, tableUuid, securityClientTypeUuid,
  systemDockTypeUuid, tabName, displayName, description, weighting, picturePath,
  tabAction, magic, isRecordRequired, isActive) {
  'use strict';
  
  return "CALL p_system_ModifyDockTab('"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(tableUuid)
    +"', '"+butrDatabase.sanitiseSqlString(securityClientTypeUuid)
    +"', '"+butrDatabase.sanitiseSqlString(systemDockTypeUuid)
    +"', '"+butrDatabase.sanitiseSqlString(tabName)
    +"', '"+butrDatabase.sanitiseSqlString(displayName)
    +"', '"+butrDatabase.sanitiseSqlString(description)
    +"', "+butrDatabase.sanitiseSqlInteger(weighting)
    +", '"+butrDatabase.sanitiseSqlString(picturePath)
    +"', '"+butrDatabase.sanitiseSqlString(tabAction)
    +"', '"+butrDatabase.sanitiseSqlString(magic)
    +"', "+butrDatabase.sanitiseSqlBoolean(isRecordRequired)
    +"', "+butrDatabase.sanitiseSqlBoolean(isActive)+");";
}

/**
 * Module exports.
 */
module.exports.execute = execute;