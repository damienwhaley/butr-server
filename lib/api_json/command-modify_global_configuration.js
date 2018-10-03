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
  
  if (snippetJson.name_label !== undefined && snippetJson.name_label !== null && typeof(snippetJson.name_label) === 'string') {
    snippetInternal.name_label = snippetJson.name_label;
  }
  else {
    snippetInternal.name_label = '';
  }
  
  if (snippetJson.display_label !== undefined && snippetJson.display_label !== null && typeof(snippetJson.display_label) === 'string') {
    snippetInternal.display_label = snippetJson.display_label;
  }
  else {
    snippetInternal.display_label = '';
  }
  
  if (snippetJson.description !== undefined && snippetJson.description !== null && typeof(snippetJson.desciption) === 'string') {
    snippetInternal.description = snippetJson.description;
  }
  else {
    snippetInternal.description = '';
  }
  
  if (snippetJson.magic !== undefined && snippetJson.magic !== null && typeof(snippetJson.magic) === 'string') {
    snippetInternal.magic = snippetJson.magic;
  }
  else {
    snippetInternal.magic = '';
  }
  
  if (snippetJson.text_setting !== undefined && snippetJson.text_setting !== null && typeof(snippetJson.text_setting) === 'string') {
    snippetInternal.text_setting = snippetJson.text_setting;
  }
  else {
    snippetInternal.text_setting = '';
  }
  
  if (snippetJson.integer_setting !== undefined && snippetJson.integer_setting !== null && typeof(snippetJson.integer_setting) === 'number') {
    snippetInternal.integer_setting = snippetJson.integer_setting;
  }
  else {
    snippetInternal.integer_setting = '';
  }
  
  if (snippetJson.float_setting !== undefined && snippetJson.float_setting !== null && typeof(snippetJson.float_setting) === 'number') {
    snippetInternal.float_setting = snippetJson.float_setting;
  }
  else {
    snippetInternal.float_setting = '';
  }
  
  if (snippetJson.datetime_setting !== undefined && snippetJson.datetime_setting !== null) {
    var dt = moment(snippetJson.datetime_setting);
    if (dt !== undefined && dt !== null && !isNaN(dt.valueOf())) {
      snippetInternal.datetime_setting = dt.format('YYYY-MM-DD HH:mm:ss');
    }
    else {
      snippetInternal.datetime_setting = '';
    }
  }
  else {
    snippetInternal.datetime_setting = '';
  }
  
  if (snippetJson.uuid_setting !== undefined && snippetJson.uuid_setting !== null && typeof(snippetJson.uuid_setting) === 'string') {
    snippetInternal.uuid_setting = snippetJson.uuid_setting;
  }
  else {
    snippetInternal.uuid_setting = '';
  }
  
  if (snippetJson.bit_setting !== undefined && snippetJson.bit_setting !== null && typeof(snippetJson.bit_setting) === 'number') {
    if (snippetJson.bit_setting === 0) {
      snippetInternal.bit_setting = 0;
    }
    else {
      snippetInternal.bit_setting = 1;
    }
  }
  else {
    snippetInternal.bit_setting = '';
  }
  
  // Here we clobber out everything else to make sure only one setting at a time.
  if (snippetInternal.text_setting !== '') {
    snippetInternal.integer_setting = '';
    snippetInternal.float_setting = '';
    snippetInternal.datetime_setting = '';
    snippetInternal.uuid_setting = '';
    snippetInternal.bit_setting = '';
  }
  else if (snippetInternal.integer_setting !== '') {
    snippetInternal.text_setting = '';
    snippetInternal.float_setting = '';
    snippetInternal.datetime_setting = '';
    snippetInternal.uuid_setting = '';
    snippetInternal.bit_setting = '';
  }
  else if (snippetInternal.float_setting !== '') {
    snippetInternal.text_setting = '';
    snippetInternal.integer_setting = '';
    snippetInternal.datetime_setting = '';
    snippetInternal.uuid_setting = '';
    snippetInternal.bit_setting = '';
  }
  else if (snippetInternal.datetime_setting !== '') {
    snippetInternal.text_setting = '';
    snippetInternal.integer_setting = '';
    snippetInternal.float_setting = '';
    snippetInternal.uuid_setting = '';
    snippetInternal.bit_setting = '';
  }
  else if (snippetInternal.uuid_setting !== '') {
    snippetInternal.text_setting = '';
    snippetInternal.integer_setting = '';
    snippetInternal.float_setting = '';
    snippetInternal.datetime_setting = '';
    snippetInternal.bit_setting = '';
  }
  else if (snippetInternal.bit_setting !== '') {
    snippetInternal.text_setting = '';
    snippetInternal.integer_setting = '';
    snippetInternal.float_setting = '';
    snippetInternal.datetime_setting = '';
    snippetInternal.uuid_setting = '';
  }
  
  if ((snippetInternal.text_setting === '' && snippetInternal.integer_setting === ''
	  && snippetInternal.float_setting === '' && snippetInternal.datetime_setting === ''
	  && snippetInternal.uuid_setting === '' && snippetInternal.bit_setting === '')
	|| snippetInternal.magic === '' || snippetInternal.uuid === '') {
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