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
var butrApiJsonCommandCheckSessionAlive = require('../api_json/command-check_session_alive');
var butrApiJsonError = require('../api_json/error');
var butrUtil = require('../butr-util');
var butrRedis = require('../butr-redis');
var butrDatabase = require('../butr-database');

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
  var sessionExpiry = null;
  var sessionExpiryOutput = null;
  
  if (sessionData !== undefined && sessionData !== null && typeof(sessionData) === 'object') {
    if (sessionData.expiry !== undefined && sessionData.expiry !== null) {
      sessionExpiry = moment.utc(sessionData.expiry, 'YYYY-MM-DD HH:mm:ss');
      sessionExpiryOutput = sessionData.expiry;
    }
  }
  
  var currentTime = moment.utc();
  
  if (sessionExpiry.diff(currentTime, 'seconds') <= 0) {
    // Session has expired.
    
    if (butrDatabase.getNoSqlEngine() === 'redis') {
      // Remove the session data
      butrRedis.deleteKey(sessionUuid);
    }
    
    if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
      return butrApiJsonError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_SESSION_NOT_FOUND, 'check_session_alive', sessionUuid, metaJson, sessionData);
    }
  }
  
  // Format the results
  outJson.authentication = {};
  outJson.authentication.session_token = sessionUuid;
  
  outJson.result = {};
  outJson.result.status = butrConstants.MESSAGE_RESULT_OK;
  outJson.result.explanation = '';
  
  outJson.check_session_alive = {};
  outJson.check_session_alive.expiry = sessionExpiryOutput;
  outJson.check_session_alive.server_time = currentTime.utc().format('YYYY-MM-DD HH:mm:ss');
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandCheckSessionAlive.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * Module exports.
 */
module.exports.execute = execute;