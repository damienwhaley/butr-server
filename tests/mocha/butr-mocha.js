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
var fs = require('fs');
var path = require('path');

/**
 * Custom module dependencies.
 */

var _configApp = {};

/* This loads the app settings from the filesystem.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @api private
 */
function loadAppSettings() {
  'use strict';
  
  var _filePath = path.normalize('./config/settings.json');
  var _configAppString = '';
  
  switch(process.env.NODE_ENV) {
    case 'production':
	  _filePath = path.normalize('./config/production.json');
	  break;
    case 'test':
	  _filePath = path.normalize('./config/test.json');
	  break;
    case 'development':
	  _filePath = path.normalize('./config/development.json');
	  break;
	default:
	  _filePath = path.normalize('./config/settings.json');
	  break;
  }
  
  try {
    _configAppString = fs.readFileSync(_filePath, 'utf8');
    _configApp = JSON.parse(_configAppString);
  } catch(e) {
    _configApp = {};
  }
}

loadAppSettings();

/**
 * Module exports
 */
module.exports.AppSettings = _configApp;