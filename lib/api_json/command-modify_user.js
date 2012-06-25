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
 *   - object containing the data about the session
 * @api public
 */
function render(err, res, internalJson, metaJson, sessionData) {
  'use strict';
  
  res.send(internalJson, { "Content-type": "application/json" }, 200);
  
  if (metaJson.command !== undefined && metaJson.command !== null && typeof(metaJson.command) === 'object') {
    metaJson.command.finish = new Date();
    metaJson.command.response = JSON.stringify(internalJson);
  }
  
  // Extend session and log meta data
  butrApiInternalLog.extendLogMeta(metaJson, sessionData);
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
  
  if (snippetJson.uuid !== undefined && snippetJson.uuid !== null && typeof(snippetJson.uuid) === 'string') {
    snippetInternal.uuid = snippetJson.uuid;
  }
  else {
    snippetInternal.uuid = '';
  }
  
  if (snippetJson.global_title_uuid !== undefined && snippetJson.global_title_uuid !== null && typeof(snippetJson.global_title_uuid) === 'string') {
    snippetInternal.global_title_uuid = snippetJson.global_title_uuid;
  }
  else {
    snippetInternal.global_title_uuid = '';
  }
  
  if (snippetJson.first_name !== undefined && snippetJson.first_name !== null && typeof(snippetJson.first_name) === 'string') {
    snippetInternal.first_name = snippetJson.first_name;
  }
  else {
    snippetInternal.first_name = '';
  }
  
  if (snippetJson.last_name !== undefined && snippetJson.last_name !== null && typeof(snippetJson.last_name) === 'string') {
    snippetInternal.last_name = snippetJson.last_name;
  }
  else {
    snippetInternal.last_name = '';
  }
  
  if (snippetJson.username !== undefined && snippetJson.username !== null && typeof(snippetJson.username) === 'string') {
    snippetInternal.username = snippetJson.username;
  }
  else {
    snippetInternal.username = '';
  }
  
  if (snippetJson.preferred_global_language_uuid !== undefined && snippetJson.preferred_global_language_uuid !== null && typeof(snippetJson.preferred_global_language_uuid) === 'string') {
    snippetInternal.preferred_global_language_uuid = snippetJson.preferred_global_language_uuid;
  }
  else {
    snippetInternal.preferred_global_language_uuid = '';
  }
  
  if (snippetInternal.last_name === '' || snippetInternal.first_name === ''
	|| snippetInternal.username === '' || snippetInternal.uuid === '') {
	// Invalid message
	return null;
  }
  
  return snippetInternal;
}

/**
 * Module exports.
 */
module.exports.render = render;
module.exports.convert = convert;