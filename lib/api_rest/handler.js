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

/**
 * This converts the message to the internal
 * @param messageName
 * @param snippetJson
 * @returns
 */
function convertMessageInternal(messageName, snippetJson) {
  'use strict';
  var snippetInternal = {};
  
  switch (messageName) {
  case 'ping':
    var butrApiRestCommandPing = require('./command-ping');
    snippetInternal = butrApiRestCommandPing.convert(snippetJson);
    break;
  default:
    snippetInternal.content = i18n.__('I don\'t know what the %s command is.', messageName);
    break;
  }
  
  return snippetInternal;
}

/**
 * Module exports
 */
module.exports.convertMessageInternal = convertMessageInternal;