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
  
  var outRest = '<?xml version="1.0" encoding="utf-8" ?>'
	+ '<butr>'
	+ '<authentication>'
	+ '<session_token>' + internalJson.authentication.token + '</session_token>'
	+ '</authentication>'
	+ '<result>'
	+ '<status>' + internalJson.result.status + '</status>'
	+ '<explanation>' + internalJson.result.explanation + '</explanation>'
	+ '</result>'
	+ '<ping>'
	+ '<message>' + internalJson.ping.message + '</message>'
	+ '</ping>'
    + '</butr>';
  
  res.send(outRest, { "Content-type": "text/xml" }, 200);
  
  if (metaJson.command !== undefined && metaJson.command !== null && typeof(metaJson.command) === 'object') {
    metaJson.command.finish = new Date();
    metaJson.command.response = outRest;
  }
  
  // Extend session and log meta data
  butrApiInternalLog.extendLogMeta(metaJson, sessionData);
}

/**
 * This converts the message from JSON to internal format.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param snippetRest
 *   - object containing the message in JSON format.
 * @returns object
 *   - containing the message converted to internal format.
 * @api public
 */
function convert(snippetRest) {
  'use strict';
  
  var snippetInternal = {};
  
  for (var i = 0; i < snippetRest.children.length; i++) {
    switch(snippetRest.children[i].name) {
      case 'content':
    	snippetInternal[snippetRest.children[i].name] = snippetRest.children[i].children[0].text;
        break;
    }
  }
  
  if (snippetInternal.content === undefined || snippetInternal.content === null) {
	snippetInternal.content = i18n.__('Did Greedo shoot first?');
  }
  
  return snippetInternal;
}

/**
 * Module exports.
 */
module.exports.render = render;
module.exports.convert = convert;