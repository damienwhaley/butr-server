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
  
  if (snippetJson.uuid !== undefined
	&& snippetJson.uuid !== null
	&& typeof(snippetJson.uuid) === 'string') {
    snippetInternal.uuid = snippetJson.uuid;
  }
  else {
    snippetInternal.uuid = '';
  }
  
  if (snippetJson.system_dock_type_uuid !== undefined
	&& snippetJson.system_dock_type_uuid !== null
	&& typeof(snippetJson.system_dock_type_uuid) === 'string') {
    snippetInternal.system_dock_type_uuid = snippetJson.system_dock_type_uuid;
  }
  else {
    snippetInternal.system_dock_type_uuid = '';
  }
  
  if (snippetJson.security_client_type_uuid !== undefined
	&& snippetJson.security_client_type_uuid !== null
	&& typeof(snippetJson.security_client_type_uuid) === 'string') {
    snippetInternal.security_client_type_uuid = snippetJson.security_client_type_uuid;
  }
  else {
    snippetInternal.security_client_type_uuid = '';
  }
  
  if (snippetJson.dock_tab_uuid !== undefined
	&& snippetJson.dock_tab_uuid !== null
	&& typeof(snippetJson.dock_tab_uuid) === 'string') {
    snippetInternal.dock_tab_uuid = snippetJson.dock_tab_uuid;
  }
  else {
    snippetInternal.dock_tab_uuid = '';
  }
  
  if (snippetJson.subtab_name !== undefined
	&& snippetJson.subtab_name !== null
	&& typeof(snippetJson.subtab_name) === 'string') {
    snippetInternal.subtab_name = snippetJson.subtab_name;
  }
  else {
    snippetInternal.subtab_name = '';
  }
  
  if (snippetJson.display_name !== undefined
	&& snippetJson.display_name !== null
	&& typeof(snippetJson.display_name) === 'string') {
    snippetInternal.display_name = snippetJson.display_name;
  }
  else {
    snippetInternal.display_name = '';
  }
  
  if (snippetJson.description !== undefined
	&& snippetJson.description !== null
	&& typeof(snippetJson.description) === 'string') {
    snippetInternal.description = snippetJson.description;
  }
  else {
    snippetInternal.description = '';
  }
  
  if (snippetJson.weighting !== undefined
	&& snippetJson.weighting !== null
	&& !isNaN(snippetJson.weighting)) {
    snippetInternal.weighting = snippetJson.weighting;
  }
  else {
    snippetInternal.weighting = '';
  }
  
  if (snippetJson.picture_path !== undefined
	&& snippetJson.picture_path !== null
	&& typeof(snippetJson.picture_path) === 'string') {
    snippetInternal.picture_path = snippetJson.picture_path;
  }
  else {
    snippetInternal.picture_path = '';
  }
  
  if (snippetJson.subtab_action !== undefined
	&& snippetJson.subtab_action !== null
	&& typeof(snippetJson.subtab_action) === 'string') {
    snippetInternal.subtab_action = snippetJson.subtab_action;
  }
  else {
    snippetInternal.subtab_action = '';
  }
  
  if (snippetJson.is_active !== undefined
	&& snippetJson.is_active !== null
	&& !isNaN(snippetJson.is_active)) {
    if (parseInt(snippetJson.is_active, 10) !== 1) {
      snippetInternal.is_active = 0;
    }
    else {
      snippetInternal.is_active = 1;
    }
  }
  else {
    snippetInternal.is_active = 0;
  }
  
  if (snippetJson.is_record_required !== undefined
	&& snippetJson.is_record_required !== null
	&& !isNaN(snippetJson.is_record_required)) {
    if (parseInt(snippetJson.is_record_required, 10) !== 1) {
      snippetInternal.is_record_required = 0;
    }
    else {
      snippetInternal.is_record_required = 1;
    }
  }
  else {
    snippetInternal.is_record_required = 0;
  }
  
  if (snippetInternal.subtab_name === ''
	|| snippetInternal.uuid === ''
	|| snippetInternal.dock_tab_uuid === ''
	|| snippetInternal.system_dock_type_uuid === ''
	|| snippetInternal.security_client_type_uuid === '') {
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