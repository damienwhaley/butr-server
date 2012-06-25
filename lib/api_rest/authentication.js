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
var butrApiRestHandler = require('./handler');

/**
 * This converts the authentication snippet from REST to the internal format,
 * ensuring that only the valid fields are there.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @var snippetRest
 *   - The JSON snippet containing the authentication details in REST format.
 * @return object
 *   - JSON object containing the authentication details in the internal format.
 * @api private
 */
function convertAuthenticationInternal(snippetRest) {
  'use strict';
  var snippetInternal = {};
  
  for (var i = 0; i < snippetRest.children.length; i++) {
  switch(snippetRest.children[i].name) {
    case 'api_key':
      snippetInternal[snippetRest.children[i].name] = snippetRest.children[i].children[0].text;
      break;
    case 'api_secret':
      snippetInternal[snippetRest.children[i].name] = snippetRest.children[i].children[0].text;
      break;
    case 'nonce':
      snippetInternal[snippetRest.children[i].name] = snippetRest.children[i].children[0].text;
      break;
    case 'method':
      snippetInternal[snippetRest.children[i].name] = snippetRest.children[i].children[0].text;
      break;
    case 'username':
      snippetInternal[snippetRest.children[i].name] = snippetRest.children[i].children[0].text;
      break;
    case 'password':
      snippetInternal[snippetRest.children[i].name] = snippetRest.children[i].children[0].text;
      break;
    case 'session_token':
      snippetInternal[snippetRest.children[i].name] = snippetRest.children[i].children[0].text;
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
function checkAuthentication(res, metaJson, authRest, messageName, messageRest) {
  'use strict';
  
  // Convert the authentication block to internal format.
  var authInternal = convertAuthenticationInternal(authRest);
  
  // Convert the message block to internal format.
  var messageInternal = butrApiRestHandler.convertMessageInternal(messageName, messageRest);
  
  butrApiInternalAuthentication.checkAuthentication(res, metaJson, butrConstants.MESSAGE_FORMAT_REST, authInternal, messageName, messageInternal);
}

/**
 * Module exports.
 */
module.exports.checkAuthentication = checkAuthentication;