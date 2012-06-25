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

/**
 * Butr module dependencies.
 */
var butrConfig = require('../butr-config');
var butrConstants = require('../butr-constants');
var butrApiJsonError = require('../api_json/error');
var butrApiRestError = require('../api_rest/error');
var butrApiInternalPasser = require('./passer');

/**
 * This now checks the security of the user and what the message requires, then if this is OK,
 * it is passed to the message handler.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param res
 *   - object containing the response to be sent out.
 * @param metaJson
 *   - object containing the meta data about the message.
 * @param sessionData
 *   - object containing the session data.
 * @param messageFormat
 *   - constant containing the final message format
 * @param messageName
 *   - string containing the name of the message to be exeuted.
 * @param messageInternal
 *   - object containing the command part of the message 
 * @api public
 */
function checkSecurity(res, metaJson, sessionData, messageFormat, messageName, messageInternal) {
  'use strict';
  
  // Store the session token and user in the meta data.
  metaJson.session.token = sessionData.token;
  metaJson.session.user = sessionData.user.uuid;
  
  var canExecute = butrConstants.SECURITY_EXECUTE_DENIED;
  var messagePermissions = butrConfig.getMessagePermissions(messageName);
  
  if(sessionData.permissions !== undefined && sessionData.permissions !== null
    && typeof(sessionData.permissions) === 'object' && messagePermissions !== undefined
    && messagePermissions !== null && typeof(messagePermissions) == 'object') {    
    canExecute = canUserExecuteMessage(messageName, messagePermissions, sessionData.permissions);
  }
  
  // Denied access to message so render error.
  if (canExecute === butrConstants.SECURITY_EXECUTE_DENIED) {
    if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
      return butrApiJsonError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_NOT_ALLOWED, messageName, sessionData.token, metaJson, sessionData);
    }
    else if(messageFormat === butrConstants.MESSAGE_FORMAT_REST) {
      return butrApiRestError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_NOT_ALLOWED, messageName, sessionData.token, metaJson, sessionData);
    }
  }
  
  return butrApiInternalPasser.passMessage(res, metaJson, messageName, canExecute, messageFormat, messageInternal, sessionData); 
}

/**
 * This checks to see if the user can execute the message.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param messagePermission
 *   - array containing the permissions for the given message.
 * @param userPermission
 *   - JSON object containing the permissions the user has.
 * @returns int
 *   - the status code for the check
 * @api private
 */
function canUserExecuteMessage(messageName, messagePermission, userPermission) {
  'use strict';
  
  var userKey = '';
  var i;
  
  if (messagePermission !== undefined && messagePermission !== null
    && typeof(messagePermission) === 'object') {
    for(i = 0; i < messagePermission.length; i++) {
      if(messagePermission[i].unauthenticated === true) {
    	return butrConstants.SECURITY_EXECUTE_OK;
      }
      for(userKey in userPermission) {
        if (userPermission[userKey].permission === messagePermission[i].permission) {
          // Found match so check to see if we have to check the partition
          if(messagePermission[i].partition === true) {
            return butrConstants.SECURITY_EXECUTE_WITH_PARTITION_CHECK;
          }
          return butrConstants.SECURITY_EXECUTE_OK;
        }
      }
    }
  }
  
  // No matches so cannot execute command.
  return butrConstants.SECURITY_EXECUTE_DENIED;
}

/**
 * This builds the SQL to log the query which has been run.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @returns string
 *   - Contains the SQL to be executed.
 * @api private
 */
function sqlListMessagePermission() {
  'use strict';
  
  return "CALL p_security_ListMessagePermission();";
}

/**
 * Module exports.
 */
module.exports.checkSecurity = checkSecurity;