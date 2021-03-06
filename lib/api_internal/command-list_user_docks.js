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
var butrApiJsonCommandListUserDocks = require('../api_json/command-list_user_docks');
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
  
  var sqlString = sqlListUserDockPermissions(sessionUuid, transactionUuid, messageInternal.client_type);
  
  // Grab the global title configuration settings.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_SECURITY_DOCKS_PERMISSIONS, userUuid, function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackListUserDocks(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson, messageInternal.client_type);
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
function callbackListUserDocks(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson, clientType) {
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
  outJson.list_user_docks = [];
  
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
        
          if (jsonResult.rows[i].dock_name !== null
            && jsonResult.rows[i].dock_name !== undefined
            && jsonResult.rows[i].dock_name !== '') {
            item.dock_name = jsonResult.rows[i].dock_name;
          }
          else {
            item.dock_name = '';
          }
          
          if (jsonResult.rows[i].display_name !== null
            && jsonResult.rows[i].display_name !== undefined
            && jsonResult.rows[i].display_name !== '') {
            item.display_name = jsonResult.rows[i].display_name;
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
          
          if (jsonResult.rows[i].picture_path !== null
            && jsonResult.rows[i].picture_path !== undefined
            && jsonResult.rows[i].picture_path !== '') {
            item.picture_path = jsonResult.rows[i].picture_path;
          }
          else {
            item.picture_path = '';
          }
          
          if (jsonResult.rows[i]._table_uuid !== null
            && jsonResult.rows[i]._table_uuid !== undefined
            && jsonResult.rows[i]._table_uuid !== '') {
            item.uuid = jsonResult.rows[i]._table_uuid;
          }
          else {
            item.uuid = '';
          }
          
          item.items = [];
          
          outJson.list_user_docks.push(item);
        }
      }
      
      if (outJson.list_user_docks.length > 0) {
    	return listUserDockItems(res, metaJson, messageFormat, outJson, sessionData, clientType);
      }
      else {
    	if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    	  return butrApiJsonCommandListUserDocks.render(null, res, outJson, metaJson, sessionData);
    	}
      }
    }
  }
  
  // Store SQL finish in meta data if an error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandListUserDocks.render(err, res, outJson, metaJson, sessionData);
  }
}

/**
 * This executes the next part of the list_user_docks command.
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
 * @papam clientType
 *   - string containing the type of client
 * @api private
 */
function listUserDockItems(res, metaJson, messageFormat, messageInternal, sessionData, clientType) {
  'use strict';

  var sessionUuid = butrUtil.getSessionToken(sessionData);
  var transactionUuid = butrUtil.getTransactionToken(metaJson);
  var userUuid = butrUtil.getSessionUser(sessionData);
  
  var sqlString = sqlListUserDockItemPermissions(sessionUuid, transactionUuid, clientType);
  
  // Grab the global title configuration settings.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_SECURITY_DOCK_ITEMS_PERMISSIONS, userUuid, function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackListUserDockItems(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, messageInternal, clientType);
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
 * This callback continues assembling the final message.
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
 * @param messageInternal
 *   - object containing the output in the internal format.
 * @param clientType
 *   - string containing the client type.
 * @api private
 */
function callbackListUserDockItems(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, messageInternal, clientType) {
  'use strict';
  
  var item = {};
  var dockUuid = '';
  
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
        // Got some results so continue building up object to return.
        for(var i = 0; i < jsonResult.rows.length; i++) {
          item = {};
          dockUuid = '';
          
          if (jsonResult.rows[i].item_name !== null
            && jsonResult.rows[i].item_name !== undefined
            && jsonResult.rows[i].item_name !== '') {
            item.item_name = jsonResult.rows[i].item_name;
          }
          else {
            item.item_name = null;
          }
          
          if (jsonResult.rows[i].display_name !== null
            && jsonResult.rows[i].display_name !== undefined
            && jsonResult.rows[i].display_name !== '') {
            item.display_name = jsonResult.rows[i].display_name;
          }
          else {
            item.display_name = null;
          }
          
          if (jsonResult.rows[i].description !== null
            && jsonResult.rows[i].description !== undefined
            && jsonResult.rows[i].description !== '') {
            item.description = jsonResult.rows[i].description;
          }
          else {
            item.description = null;
          }
          
          if (jsonResult.rows[i].picture_path !== null
            && jsonResult.rows[i].picture_path !== undefined
            && jsonResult.rows[i].picture_path !== '') {
            item.picture_path = jsonResult.rows[i].picture_path;
          }
          else {
            item.picture_path = null;
          }
          
          if (jsonResult.rows[i].item_magic !== null
            && jsonResult.rows[i].item_magic !== undefined
            && jsonResult.rows[i].item_magic !== '') {
            item.item_magic = jsonResult.rows[i].item_magic;
          }
          else {
            item.item_magic = null;
          }
          
          if (jsonResult.rows[i].item_action !== null
            && jsonResult.rows[i].item_action !== undefined
            && jsonResult.rows[i].item_action !== '') {
            item.action = jsonResult.rows[i].item_action;
          }
          else {
            item.action = null;
          }
          
          if (jsonResult.rows[i]._table_uuid !== null
            && jsonResult.rows[i]._table_uuid !== undefined
            && jsonResult.rows[i]._table_uuid !== '') {
            item.uuid = jsonResult.rows[i]._table_uuid;
          }
          else {
            item.uuid = '';
          }
          
          if (jsonResult.rows[i].dock_uuid !== null
            && jsonResult.rows[i].dock_uuid !== undefined
            && jsonResult.rows[i].dock_uuid !== '') {
            dockUuid = jsonResult.rows[i].dock_uuid;
          } else {
        	dockUuid = '';
          }
          
          item.subitems = [];
          
          // Attach dockItem to the correct dock array element.
          if (dockUuid !== '') {
            for(var j = 0; j < messageInternal.list_user_docks.length; j++) {
              if (messageInternal.list_user_docks[j].uuid === dockUuid) {
                messageInternal.list_user_docks[j].items.push(item);
                break;
              }
            }
          }
        }
      }
      
      return listUserDockSubitems(res, metaJson, messageFormat, messageInternal, sessionData, clientType);
    }
  }
  
  // Store SQL finish in meta data if an error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }
  
  return listUserDockSubitems(res, metaJson, messageFormat, messageInternal, sessionData, clientType);
}

/**
 * This executes the final part of the list_user_docks command.
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
 *   - object containing the session data.
 * @param clientType
 *   - string containing the client type.
 * @api private
 */
function listUserDockSubitems(res, metaJson, messageFormat, messageInternal, sessionData, clientType) {
  'use strict';

  var sessionUuid = butrUtil.getSessionToken(sessionData);
  var transactionUuid = butrUtil.getTransactionToken(metaJson);
  var userUuid = butrUtil.getSessionUser(sessionData);
  
  var sqlString = sqlListUserDockSubitemPermissions(sessionUuid, transactionUuid, clientType);
  
  // Grab the global title configuration settings.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_SECURITY_DOCK_ITEMS_PERMISSIONS, userUuid, function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackListUserDockSubitems(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, messageInternal);
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
 * This callback continues assembling the final message.
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
function callbackListUserDockSubitems(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, messageInternal) {
  'use strict';
  
  var item = {};
  var dockUuid = '';
  var dockItemUuid = '';
  
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
        // Got some results so continue building up object to return.
        for(var i = 0; i < jsonResult.rows.length; i++) {
          item = {};
          dockUuid = '';
          dockItemUuid = '';
          
          if (jsonResult.rows[i].subitem_name !== null
            && jsonResult.rows[i].subitem_name !== undefined
            && jsonResult.rows[i].subitem_name !== '') {
            item.subitem_name = jsonResult.rows[i].subitem_name;
          }
          else {
            item.subitem_name = '';
          }
          
          if (jsonResult.rows[i].display_name !== null
            && jsonResult.rows[i].display_name !== undefined
            && jsonResult.rows[i].display_name !== '') {
            item.display_name = jsonResult.rows[i].display_name;
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
          
          if (jsonResult.rows[i].picture_path !== null
            && jsonResult.rows[i].picture_path !== undefined
            && jsonResult.rows[i].picture_path !== '') {
            item.picture_path = jsonResult.rows[i].picture_path;
          }
          else {
            item.picture_path = '';
          }
          
          if (jsonResult.rows[i].subitem_magic !== null
            && jsonResult.rows[i].subitem_magic !== undefined
            && jsonResult.rows[i].subitem_magic !== '') {
            item.magic = jsonResult.rows[i].subitem_magic;
          }
          else {
            item.magic = '';
          }
          
          if (jsonResult.rows[i].subitem_action !== null
            && jsonResult.rows[i].subitem_action !== undefined
            && jsonResult.rows[i].subitem_action !== '') {
            item.action = jsonResult.rows[i].subitem_action;
          }
          else {
            item.action = null;
          }
          
          if (jsonResult.rows[i]._table_uuid !== null
            && jsonResult.rows[i]._table_uuid !== undefined
            && jsonResult.rows[i]._table_uuid !== '') {
            item.uuid = jsonResult.rows[i]._table_uuid;
          }
          else {
            item.uuid = '';
          }
          
          if (jsonResult.rows[i].dock_uuid !== null
            && jsonResult.rows[i].dock_uuid !== undefined
            && jsonResult.rows[i].dock_uuid !== '') {
            dockUuid = jsonResult.rows[i].dock_uuid;
          }
          else {
        	dockUuid = '';
          }
          
          if (jsonResult.rows[i].dock_item_uuid !== null
            && jsonResult.rows[i].dock_item_uuid !== undefined
            && jsonResult.rows[i].dock_item_uuid !== '') {
            dockItemUuid = jsonResult.rows[i].dock_item_uuid;
          }
          else {
        	dockItemUuid = '';
          }
          
          // Attach dockSubitem to the correct dock array item.
          if (dockUuid !== '' && dockItemUuid !== '') {
            for(var j = 0; j < messageInternal.list_user_docks.length; j++) {
              if (messageInternal.list_user_docks[j].uuid === dockUuid) {
                for(var k = 0; k < messageInternal.list_user_docks[j].items.length; k++) {
                  if (messageInternal.list_user_docks[j].items[k].uuid === dockItemUuid) {
                    messageInternal.list_user_docks[j].items[k].subitems.push(item);
                    break;
                  }
                }
              }
            }
          }
        }
      }
      
      if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    	return butrApiJsonCommandListUserDocks.render(null, res, messageInternal, metaJson, sessionData);
      }
    }
  }
  
  // Store SQL finish in meta data if an error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandListUserDocks.render(err, res, messageInternal, metaJson, sessionData);
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
function sqlListUserDockPermissions(sessionUuid, transactionUuid, securityClient) {
  'use strict';
  
  return "CALL p_security_ListUserDockPermission('"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(securityClient)+"');";
}

/**
 * This builds the SQL query for listing user dock item permissions.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @param dockUuid
 *   - String containing the dock uuid.
 * @param securityClient
 *   - String containing the name of the client wanting the dock items.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlListUserDockItemPermissions(sessionUuid, transactionUuid, securityClient) {
  'use strict';
  
  return "CALL p_security_ListUserDockItemPermission('"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(securityClient)+"');";
}

/**
 * This builds the SQL query for listing user dock subitem permissions.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @param dockItemUuid
 *   - String containing the dock uuid.
  * @param securityClient
 *   - String containing the name of the client wanting the dock subitems.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlListUserDockSubitemPermissions(sessionUuid, transactionUuid, securityClient) {
  'use strict';
  
  return "CALL p_security_ListUserDockSubitemPermission('"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)
    +"', '"+butrDatabase.sanitiseSqlString(securityClient)+"');";
}

/**
 * Module exports.
 */
module.exports.execute = execute;