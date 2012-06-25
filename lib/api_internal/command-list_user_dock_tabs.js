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
var butrApiJsonCommandListUserDockTabs = require('../api_json/command-list_user_dock_tabs');
var butrUtil = require('../butr-util');

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
  var userUuid = butrUtil.getSessionUser(sessionData);
  
  var sqlString = sqlListUserDockTabPermissions(sessionUuid, transactionUuid, messageInternal.client_type);
  
  // Grab the global title configuration settings.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_SECURITY_DOCKS_PERMISSIONS, userUuid, function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackListUserDockTabs(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson, messageInternal.client_type);
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
 * This callback starts assembling the final message.
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
 * @param clientType
 *   - string containing the client type.
 * @api private
 */
function callbackListUserDockTabs(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson, clientType) {
  'use strict';
  
  var item = {};
  var sessionUuid = butrUtil.getSessionToken(sessionData);
  
  // Set output language
  var sessionLanguage = butrUtil.getSessionLanguage(sessionData);
  if (sessionLanguage !== '') {
    i18n.setLocale(sessionLanguage);
  }
  
  // format the results.
  outJson.authentication = {};
  outJson.authentication.session_token = sessionUuid;
  
  outJson.result = {};
  outJson.result.status = butrConstants.MESSAGE_RESULT_OK;
  outJson.result.explanation = '';
  outJson.list_user_dock_tabs = [];
  
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
        // Got some results so build up object to return.
        for(var i = 0; i < jsonResult.rows.length; i++) {
          item = {};
        
          if (jsonResult.rows[i].tab_name !== null
            && jsonResult.rows[i].tab_name !== undefined
            && jsonResult.rows[i].tab_name !== '') {
            item.tab_name = jsonResult.rows[i].tab_name;
          }
          else {
            item.tab_name = '';
          }
          
          if (jsonResult.rows[i].display_name !== null
            && jsonResult.rows[i].display_name !== undefined
            && jsonResult.rows[i].display_name !== '') {
            item.display_label = jsonResult.rows[i].display_name;
          }
          else {
            item.display_name = '';
          }
          
          if (jsonResult.rows[i].description !== null
            && jsonResult.rows[i].description !== undefined
            && jsonResult.rows[i].description !== '') {
            item.description = jsonResult.rows[i].description;
          }
          else {
            item.description = '';
          }
          
          if (jsonResult.rows[i].icon !== null
            && jsonResult.rows[i].icon !== undefined
            && jsonResult.rows[i].icon !== '') {
            item.icon = jsonResult.rows[i].icon;
          }
          else {
            item.icon = '';
          }
          
          if (jsonResult.rows[i].tab_action !== null
	        && jsonResult.rows[i].tab_action !== undefined
	        && jsonResult.rows[i].tab_action !== '') {
	        item.action = jsonResult.rows[i].tab_action;
	      }
	      else {
	        item.action = 'javascript:void(0);';
	      }
          
          if (jsonResult.rows[i]._table_uuid !== null
            && jsonResult.rows[i]._table_uuid !== undefined
            && jsonResult.rows[i]._table_uuid !== '') {
            item.uuid = jsonResult.rows[i]._table_uuid;
          }
          else {
            item.uuid = '';
          }
          
          if (jsonResult.rows[i].dock_items_uuid !== null
            && jsonResult.rows[i].dock_items_uuid !== undefined
            && jsonResult.rows[i].dock_items_uuid !== '') {
            item.dock_items_uuid = jsonResult.rows[i].dock_items_uuid;
          }
          else {
            item.dock_items_uuid = '';
          }
          
          if (jsonResult.rows[i].dock_subitems_uuid !== null
            && jsonResult.rows[i].dock_subitems_uuid !== undefined
            && jsonResult.rows[i].dock_subitems_uuid !== '') {
            item.dock_subitems_uuid = jsonResult.rows[i].dock_subitems_uuid;
          }
          else {
            item.dock_subitems_uuid = '';
          }
          
          outJson.list_user_dock_tabs.push(item);
        }
      }
      
      if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
        return butrApiJsonCommandListUserDockTabs.render(null, res, outJson, metaJson, sessionData);
      }
    }
  }
  
  // Store SQL finish in meta data if an error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }

  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandListUserDockTabs.render(err, res, outJson, metaJson, sessionData);
  }
}

/**
 * This builds the SQL query for listing user dock permissions.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @param securityClient
 *   - String containing the name of the client wanting the docks.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlListUserDockTabPermissions(sessionUuid, transactionUuid, securityClient) {
  'use strict';
  
  return "CALL p_security_ListUserDockTabPermission('"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(securityClient)+"');";
}

/**
 * Module exports.
 */
module.exports.execute = execute;