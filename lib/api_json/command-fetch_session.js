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

/**
 * This renders the internal object to the external JSON representation.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 *   - object containing any errors
 * @param res
 *   - object containing the HTTP response.
 * @param internalJson
 *   - object containing the internal representation of the response.
 * @param metaJson
 *   - object containing the metadata about the transaction.
 * @param sessionData
 *   - object containing the session data.
 * @api public
 */
function render(err, res, internalJson, metaJson, sessionData) {
  'use strict';
  
  res.send(internalJson, { "Content-type": "application/json" }, 200);
  
  if (metaJson.command !== undefined && metaJson.command !== null && typeof(metaJson.command) === 'object') {
    metaJson.command.finish = new Date();
    metaJson.command.response = JSON.stringify(internalJson);
  }
  
  // Log meta data
  butrApiInternalLog.logMeta(metaJson, sessionData);
}

/**
 * This converts the message from JSON to internal format.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param snippetJson
 *   - object containing the message in JSON format.
 * @returns object
 *   - containing the message converted to internal format.
 * @api public
 */
function convert(snippetJson) {
  'use strict';
  
  var snippetInternal = {};
  
  return snippetInternal;
}

/**
 * Module exports.
 */
module.exports.render = render;
module.exports.convert = convert;