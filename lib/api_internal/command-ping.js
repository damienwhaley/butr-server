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
var butrApiJsonCommandPing = require('../api_json/command-ping');
var butrApiRestCommandPing = require('../api_rest/command-ping');
var butrUtil = require('../butr-util');

/**
 * This executes the ping command.
 * @param res
 * @param metaJson
 * @param messageFormat
 * @param messageInternal
 * @param sessionData
 *   - Object containing the session data
 */
function execute(res, metaJson, messageFormat, messageInternal, sessionData) {
  'use strict';
  
  var sessionUuid = butrUtil.getSessionToken(sessionData);
  var outJson = {};
  outJson.authentication = {};
  
  if (sessionUuid !== undefined && sessionUuid !== null && typeof(sessionUuid) === 'string') {
    outJson.authentication.session_token = sessionUuid;
  }
  else {
    outJson.authentication.session_token = '';
  }
  outJson.result = {};
  outJson.result.status = butrConstants.MESSAGE_RESULT_OK;
  outJson.result.explanation = '';
  outJson.ping = {};
  outJson.ping.message = i18n.__('Han shot first.');
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandPing.render(null, res, outJson, metaJson, sessionData);
  }
  else if(messageFormat === butrConstants.MESSAGE_FORMAT_REST) {
    return butrApiRestCommandPing.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * Module exports.
 */
module.exports.execute = execute;