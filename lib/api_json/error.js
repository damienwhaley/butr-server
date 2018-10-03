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
var butrApiInternalLog = require('../api_internal/log');
var butrUtil = require('../butr-util');

/**
 * Renders the authentication error to the gateway.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 *   - Error object containing details of error.
 * @param res
 *   - Response object to render the results out to.
 * @param reason
 *   - The constant which defines the type of error.
 * @param messageName
 *   - The name of the message to be executed.
 * @param sessionToken
 *   - The UUID of the current session.
 * @param metaJson
 *   - object containing the meta data for the transaction.
 * @param sessionData
 *   - object containing the data about the session.
 * @api public
 */
function renderAuthenticationError(err, res, reason, messageName, sessionToken, metaJson, sessionData) {
  'use strict';
  
  var outJson = {};
  outJson.authentication = {};
  if (sessionToken !== undefined && sessionToken !== null && typeof(sessionToken) === 'string') {
    outJson.authentication.session_token = sessionToken;
  }
  else {
    outJson.authentication.session_token = '';
  }
  outJson.result = {};
  outJson.result.status = butrConstants.MESSAGE_RESULT_ERROR;
  
  switch(reason) {
  case butrConstants.SECURITY_ERROR_DUPLICATE_NONCE:
    outJson.result.explanation = i18n.__('Access to Butr was denied because a duplicate nonce was used.');
    break;
  case butrConstants.SECURITY_ERROR_SESSION_CREATE_FAILED:
    outJson.result.explanation = i18n.__('Access to Butr was denied because the session could not be created.');
    break;
  case butrConstants.SECURITY_ERROR_SESSION_NOT_FOUND:
    outJson.result.status = butrConstants.MESSAGE_RESULT_EXPIRED;
    outJson.result.explanation = i18n.__('Access to Butr was denied because the session token provided is not valid.');
    break;
  case butrConstants.SECURITY_ERROR_REGISTRATION_NOT_FOUND:
    outJson.result.explanation = i18n.__('Access to Butr was denied because the api registration provided could not be found.');
    break;
  case butrConstants.SECURITY_ERROR_USER_NOT_FOUND:
    outJson.result.explanation = i18n.__('Access to Butr was denied because the user provided could not be found.');
    break;
  case butrConstants.SECURITY_ERROR_NOT_ALLOWED:
    outJson.result.explanation = i18n.__('Sorry, you are not allowed to execute the command.');
    break;
  case butrConstants.SECURITY_ERROR_UNKNOWN_COMMAND:
    outJson.result.explanation = i18n.__('Sorry, I do not understand that command.');
    break;
  default:
	outJson.result.explanation = '';
    break;
  }
  
  if (messageName !== undefined && messageName !== null && messageName !== '') {
    outJson[messageName] = {};
  }
  
  res.send(outJson, { "Content-type": "application/json" }, 200);
  
  if (metaJson.command !== undefined && metaJson.command !== null && typeof(metaJson.command) === 'object') {
    metaJson.command.finish = new Date();
    metaJson.command.response = JSON.stringify(outJson);
  }
  
  // Log meta data
  butrApiInternalLog.logMeta(metaJson, sessionData);
}

/**
 * Renders the format error to the gateway.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 *   - Error object containing details of error.
 * @param res
 *   - Response object to render the results out to.
 * @param metaJson
 *   - Object containing the meta data for the command.
 * @param sessionData
 *   - Object containing the data for the session.
 * @api public
 */
function renderFormatError(err, res, metaJson, sessionData) {
  'use strict';
  
  var sessionUuid = butrUtil.getSessionToken(sessionData);
  var outJson = {};
  outJson.authentication = {};
  outJson.authentication.session_token = sessionUuid;
  outJson.result = {};
  outJson.result.status = butrConstants.MESSAGE_RESULT_ERROR;
  outJson.result.explanation = i18n.__('Sorry, this does not look like a properly formatted JSON message.');
  
  res.send(outJson, { "Content-type": "application/json" }, 200);
  
  if (metaJson.command !== undefined && metaJson.command !== null && typeof(metaJson.command) === 'object') {
    metaJson.command.finish = new Date();
    metaJson.command.response = JSON.stringify(outJson);
  }
  
  // Log meta data
  butrApiInternalLog.logMeta(metaJson, sessionData);
}

/**
 * Renders the format error to the gateway.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 *   - Error object containing details of error.
 * @param res
 *   - Response object to render the results out to.
 * @param messageName
 *   - String containing the name of the message.  
 * @param metaJson
 *   - Object containing the meta data for the command.
 * @param sessionData
 *   - Object containing the data for the session.
 * @api public
 */
function renderMessageError(err, res, messageName, metaJson, sessionData) {
  'use strict';
  
  var sessionUuid = butrUtil.getSessionToken(sessionData);
  var outJson = {};
  outJson.authentication = {};
  outJson.authentication.session_token = sessionUuid;
  outJson.result = {};
  outJson.result.status = butrConstants.MESSAGE_RESULT_ERROR;
  outJson.result.explanation = i18n.__('Sorry, this message is missing some expected fields.');
  
  if (messageName !== undefined && messageName !== null && messageName !== '') {
	outJson[messageName] = {};
  }
  
  res.send(outJson, { "Content-type": "application/json" }, 200);
  
  if (metaJson.command !== undefined && metaJson.command !== null && typeof(metaJson.command) === 'object') {
    metaJson.command.finish = new Date();
    metaJson.command.response = JSON.stringify(outJson);
  }
  
  // Log meta data
  butrApiInternalLog.logMeta(metaJson, sessionData);
}

/**
 * Module exports.
 */
module.exports.renderAuthenticationError = renderAuthenticationError;
module.exports.renderFormatError = renderFormatError;
module.exports.renderMessageError = renderMessageError;