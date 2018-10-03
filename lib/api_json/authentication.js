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
var butrApiInternalAuthentication = require('../api_internal/authentication');
var butrConstants = require('../butr-constants');
var butrApiJsonHandler = require('./handler');

/**
 * This converts the authentication snippet from JSON to the internal format,
 * ensuring that only the valid fields are there.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @var snippetJson
 *   - The JSON snippet containing the authentication details.
 * @return snippetInternal
 *   - JSON object containing the authentication details in the internal format.
 * @api private
 */
function convertAuthenticationInternal(snippetJson) {
  'use strict';
  var snippetInternal = {};
  
  for (var key in snippetJson) {
    switch(key) {
    case 'api_key':
      snippetInternal[key] = snippetJson[key];
      break;
    case 'api_secret':
      snippetInternal[key] = snippetJson[key];
      break;
    case 'nonce':
      snippetInternal[key] = snippetJson[key];
      break;
    case 'method':
      snippetInternal[key] = snippetJson[key];
      break;
    case 'username':
      snippetInternal[key] = snippetJson[key];
      break;
    case 'password':
      snippetInternal[key] = snippetJson[key];
      break;
    case 'session_token':
      snippetInternal[key] = snippetJson[key];
      break;
    }
  }
  
  return snippetInternal;
}

/**
 * This checks the authentication details to make sure that they are valid, then
 * hands off to a handler to execute the message.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param res
 *   - Response object 
 * @param metaJson
 *   - JSON object containing meta data about the command.
 * @param authJson
 *   - JSON snippet containing the authentication details.
 * @param messageName
 *   - The name of the message to queue the callback.
 * @param messageJson
 *   - JSON snippet containing the message.
 * @api public
 */
function checkAuthentication(res, metaJson, authJson, messageName, messageJson) {
  'use strict';
  
  // Convert the authentication block to internal format.
  var authInternal = convertAuthenticationInternal(authJson);
  
  // Convert the message block to internal format.
  var messageInternal = butrApiJsonHandler.convertMessageInternal(messageName, messageJson);
  
  butrApiInternalAuthentication.checkAuthentication(res, metaJson, butrConstants.MESSAGE_FORMAT_JSON, authInternal, messageName, messageInternal);
}

/**
 * Module exports.
 */
module.exports.checkAuthentication = checkAuthentication;