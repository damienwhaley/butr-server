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
 * Contributes module dependencies.
 */
var cluster = require('cluster');
var i18n = require('i18n');

/**
 * Butr module dependencies.
 */
var butrConstants = require('./butr-constants');
var butrLog = require('./butr-log');
var butrConfig = require('./butr-config');
var butrDatabase = require('./butr-database');
var butrError = require('./butr-error');
var butrGateway = require('./butr-gateway');

/**
 * This bootstraps the application and configures all the modules ready for use.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param appSettings
 * @api public
 */
function bootstrap(appSettings, callback) {
  'use strict';
  
  var _isValidConfiguration = false;

  // Configure the internationalisation settings
  i18n.configure({
    locales: ['en-AU', 'en', 'se', 'fr', 'de']
  });
  if (appSettings.Language !== '') {
    i18n.setLocale(appSettings.Language);
  }
  else {
    i18n.setLocale('en');
  }  
  appSettings.Language = i18n.getLocale();

  // Configure the logging module
  butrLog.configureLogging(appSettings);
  
  // Validate the basic configuration details
  _isValidConfiguration = butrConfig.validateAppSettings(appSettings);

  if (_isValidConfiguration === false) {
    butrLog.writeLog(butrConstants.LOG_LEVEL_EMERGENCY, i18n.__('Invalid configuration detected. Butr cannot start and will be shutdown.'));
    shutdown();
    return process.exit(butrConstants.EXIT_INVALID_CONFIGURATION);
  }
  
  // Configure the error module
  butrError.configureError();
  
  // Configure the database module
  butrDatabase.configureDatabase(appSettings);
  
  // Load permissions and global settings from the database
  butrConfig.loadDatabaseSettings(completeBootstrap, callback);
};

/**
 * This function completes the boostrap process after grabbing settings from the database.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param appSettings
 *   - JSON object containing the application settings.
 * @param callback
 *   - Function to call on the completion of the bootstrap.
 * @api private
 */
function completeBootstrap(appSettings, callback){
  'use strict';
  
  // Configure the gateway module
  butrGateway.configureGateway(appSettings);
  
  if (cluster.isMaster) {
	butrLog.writePidFile(process.pid);
  }
  
  // Print out settings.
  if (appSettings.Logging.Level <= butrConstants.LOG_LEVEL_DEBUG) {
    if (cluster.isMaster) {
      butrConfig.printAppSettings();
      butrConfig.printMessagePermissions();
      butrConfig.printGlobalSettings();
    }
  }
  
  if (callback !== undefined && callback !== null && typeof(callback) === 'function') {
    return callback();
  }
}

/**
 * This shuts down any connections to other servers and cleans up.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @api public
 */
function shutdown() {
  'use strict';
  butrLog.writeLog(butrConstants.LOG_LEVEL_EMERGENCY, i18n.__('A signal has been caught for process %s been caught and Butr is shutting down.', process.pid));
  butrDatabase.databaseClose();
  butrLog.removePidFile();
  butrLog.writeLog(butrConstants.LOG_LEVEL_EMERGENCY, i18n.__('Shutdown has completed for process %s.', process.pid));
  process.exit(butrConstants.EXIT_SIGINT);
};

/**
 * Module exports
 */
module.exports.bootstrap = bootstrap;
module.exports.shutdown = shutdown;
