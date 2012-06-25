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
var cluster = require('cluster');
var i18n = require('i18n');
var fs = require('fs');
var os = require('os');
var path = require('path');
var moment = require('moment');
var uuid = require('node-uuid');

/**
 * Butr module dependencies
 */
var butrConstants = require('./butr-constants');
var butrLog = require('./butr-log');
var butrDatabase = require('./butr-database');
var butrInit = require('./butr-init');

var _configApp = {};
var _configSystem = {};
var _configPermission = {};

/**
 * This loads the app settings from the filesystem.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @api private
 */
function loadAppSettings() {
  'use strict';
  
  var _filePath = path.normalize('./config/settings.json');
  var _configAppString = '';
  
  try {
    _configAppString = fs.readFileSync(_filePath, 'utf8');
    _configApp = JSON.parse(_configAppString);
  } catch(e) {
    _configApp = {};
  }
}

/**
 * The entry to load the database settings.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param callback
 * @api public
 */
function loadDatabaseSettings(callback, finalCallback) {
  'use strict';
  
  loadMessagePermissions(callback, finalCallback);
}

/**
 * This loads the message permissions into a JSON object.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param callback
 * @param finalCallback
 * @api public
 */
function loadMessagePermissions(callback, finalCallback) {
  'use strict';
  
  var sqlString = sqlListMessagePermission();
  
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_NONE, butrConstants.DATABASE_TABLE_NONE, '0', function(err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
    
    callbackLoadMessagePermissions(err, jsonResult, callback, finalCallback);
  });
}

/**
 * This callback handles the output from the database query.
 * @param err
 * @param jsonResult
 * @param callback
 * @param finalCallback
 */
function callbackLoadMessagePermissions(err, jsonResult, callback, finalCallback) {
  'use strict';
  var i;
  var permissionJson = {};
  
  // Clobber permission object for full reload.
  _configPermission = {};
  
  if (jsonResult !== undefined && jsonResult !== null && typeof(jsonResult) === 'object') {
    if (!err){
      for(i = 0; i < jsonResult.rows.length; i++) {
        if (_configPermission[jsonResult.rows[i].message_magic] === undefined || _configPermission[jsonResult.rows[i].message_magic] === null) {
          _configPermission[jsonResult.rows[i].message_magic] = new Array();
        }
        permissionJson = {};
        permissionJson.permission = jsonResult.rows[i].permission_magic;
        if (parseInt(jsonResult.rows[i].do_partition_check, 10) === 1) {
          permissionJson.partition = true;
        }
        else {
          permissionJson.partition = false;
        }
        if (parseInt(jsonResult.rows[i].run_unauthenticated, 10) === 1) {
          permissionJson.unauthenticated = true;
        }
        else {
          permissionJson.unauthenticated = false;
        }
        _configPermission[jsonResult.rows[i].message_magic].push(permissionJson);
      }
      
      return loadGlobalSettings(callback, finalCallback);
    }
  }
  
  // If we get here it could not load the settings so a big problem, so should bail out.
  butrLog.writeLog(butrConstants.LOG_LEVEL_EMERGENCY, i18n.__('Could not load message permissions from the database. Butr cannot start and will be shutdown.'));
  shutdown();
  process.exit(butrConstants.EXIT_COULD_NOT_LOAD_PERMISSION_SETTINGS);
}

/**
 * This loads the global settings into a JSON object.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param callback
 * @api public
 */
function loadGlobalSettings(callback, finalCallback) {
  'use strict';
  
  var sqlString = sqlListGlobalConfigurations(uuid.v4(), uuid.v4());
  
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_NONE, butrConstants.DATABASE_TABLE_NONE, '0', function(err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
    
    return callbackLoadGlobalSettings(err, jsonResult, callback, finalCallback);
  });
}

/**
 * This callback handles the output from the database query.
 * @param err
 * @param jsonResult
 * @param callback
 * @param finalCallback
 * @api private
 */
function callbackLoadGlobalSettings(err, jsonResult, callback, finalCallback) {
  'use strict';
  var i;

  // Clobber config object for full reload.
  _configSystem = {};
  
  if (jsonResult !== undefined && jsonResult !== null && typeof(jsonResult) === 'object') {
    if (!err){
      for(i = 0; i < jsonResult.rows.length; i++) {
        if (_configSystem[jsonResult.rows[i].magic] === undefined || _configSystem[jsonResult.rows[i].magic] === null) {
          _configSystem[jsonResult.rows[i].magic] = '';
        }
        if (jsonResult.rows[i].text_setting !== '' && jsonResult.rows[i].text_setting !== null && jsonResult.rows[i].text_setting !== undefined) {
          _configSystem[jsonResult.rows[i].magic] = jsonResult.rows[i].text_setting;
          continue;
        }
        if (isNaN(jsonResult.rows[i].integer_setting) === false && jsonResult.rows[i].integer_setting !== null && jsonResult.rows[i].integer_setting !== undefined) {
          _configSystem[jsonResult.rows[i].magic] = parseInt(jsonResult.rows[i].integer_setting, 10);
          continue;
        }
        if (isNaN(jsonResult.rows[i].float_setting) === false && jsonResult.rows[i].float_setting !== null && jsonResult.rows[i].float_setting !== undefined) {
          _configSystem[jsonResult.rows[i].magic] = parseFloat(jsonResult.rows[i].integer_setting);
          continue;
        }
        if (jsonResult.rows[i].datetime_setting !== null && jsonResult.rows[i].datetime_setting !== undefined) {
          _configSystem[jsonResult.rows[i].magic] = moment(jsonResult.rows[i].datetime_setting, 'YYYY-MM-DD HH:mm:ss').toString();
          continue;
        }
        if (jsonResult.rows[i].uuid_setting !== '' && jsonResult.rows[i].uuid_setting !== null && jsonResult.rows[i].uuid_setting !== undefined) {
          _configSystem[jsonResult.rows[i].magic] = jsonResult.rows[i].uuid_setting;
          continue;
        }
        if (isNaN(jsonResult.rows[i].bit_setting) === false && jsonResult.rows[i].bit_setting !== null && jsonResult.rows[i].bit_setting !== undefined) {
          if(parseInt(jsonResult.rows[i].bit_setting, 10) === 1) {
            _configSystem[jsonResult.rows[i].magic] = 'true';
          }
          else {
            _configSystem[jsonResult.rows[i].magic] = 'false';
          }
          continue;
        }
      }
      
      if (callback !== undefined && callback !== null && typeof(callback) === 'function') {
        return callback(_configApp, finalCallback);
      }
    }
  }
  
  // If we get here it could not load the settings so a big problem, so should bail out.
  butrLog.writeLog(butrConstants.LOG_LEVEL_EMERGENCY, i18n.__('Could not load global settings from the database. Butr cannot start and will be shutdown.'));
  butrInit.shutdown();
  process.exit(butrConstants.EXIT_COULD_NOT_LOAD_GLOBAL_SETTINGS);
}

/**
 * Validates AppSettings to ensure that the correct looking information has been entered.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param appSettings
 * @returns boolean indicating whether the configuration is valid or not.
 * @api public
 */
function validateAppSettings(appSettings) {
  'use strict';
  var isValid = true;
  appSettings.Configured = "false";
  
  // Logging
  if (appSettings.Language === '') {
    appSettings.Language = 'en';
  }
  
  if (appSettings.Logging.Level === '') {
    appSettings.Logging.Level = 0;
  }
  if (isNaN(appSettings.Logging.Level)) {
    appSettings.Logging.Level = 0;
  }
  if (parseInt(appSettings.Logging.Level, 10)>9) {
    appSettings.Logging.Level = 9;
  }
  if (appSettings.Logging.Console === 'true') {
    // Do nothing
  } else {
    appSettings.Logging.Console = 'false';
  }
  if (appSettings.Logging.SystemFilePath === '') {
    appSettings.Logging.SystemFilePath = 'logs/butr.log';
  }
  if (appSettings.Logging.HttpFilePath === '') {
    appSettings.Logging.HttpFilePath = 'logs/http.log';
  }
  if (appSettings.Logging.MessageFilePath === '') {
    appSettings.Logging.MessageFilePath = 'logs/message.log';
  }
  i18n.setLocale(appSettings.Language);
  
  // MySQL
  if (appSettings.Sql.Engine === 'mysql') {
    // OK, do nothing.
  } else {
    appSettings.Sql.Engine = '';    
  }
  if (appSettings.Sql.Engine === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid SQL engine.'));
    }
    isValid = false;
  }  
  if (appSettings.Sql.Name === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid SQL database name.'));
    }
    isValid = false;
  }
  if (appSettings.Sql.Host === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid SQL host.'));
    }
    isValid = false;
  }
  if (appSettings.Sql.Port === '') {
    if (appSettings.Sql.Engine === 'mysql') {
      appSettings.Sql.Port = 3306;
    }
  } 
  if (isNaN(appSettings.Sql.Port)) {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid SQL port.'));
    }
    isValid = false;
  }
  if (appSettings.Sql.User === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid SQL username.'));
    }
    isValid = false;
  }  
  if (appSettings.Sql.Pass === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid SQL password.'));
    }
    isValid = false;
  }

  if (appSettings.NoSql.Engine === 'redis') {
    // OK, do nothing.
  } else {
    appSettings.NoSql.Engine = '';
  }
  if (appSettings.NoSql.Engine === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_WARNING, i18n.__('Could not find a valid NoSQL engine.'));
    }
  }
  if (appSettings.NoSql.Name == '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_WARNING, i18n.__('Could not find a valid NoSQL database name.'));
    }
  }
  if (appSettings.NoSql.Host === '') {
    appSettings.NoSql.Host = 'localhost';
  }
  if (appSettings.NoSql.Host === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_WARNING, i18n.__('Could not find a valid NoSQL host.'));
    }
  }
  if (appSettings.NoSql.Port === '') {
    if (appSettings.NoSql.Engine === 'redis') {
      appSettings.NoSql.Port = 6379;
    }
  }
  if (isNaN(appSettings.NoSql.Port)) {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_WARNING, i18n.__('Could not find a valid NoSQL port.'));
    }
  }
  if (appSettings.NoSql.User === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_WARNING, i18n.__('Could not find a valid NoSQL username.'));
    }
  }
  if (appSettings.NoSql.Pass === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_WARNING, i18n.__('Could not find a valid NoSQL password.'));
    }
  }
  
  // Gateway
  if (appSettings.Gateway.VirtualHost === '') {
    appSettings.Gateway.VirtualHost = 'localhost';
  }
  if (appSettings.Gateway.Protocol === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid Gateway virtual host.'));
    }
    isValid = false;
  }  
  if (appSettings.Gateway.Protocol === 'http') {
    // OK, do nothing.
  } else if (appSettings.Gateway.Protocol === 'https') {
    // OK, do nothing.
  } else {
    appSettings.Gateway.Protocol = '';    
  }
  if (appSettings.Gateway.Protocol === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid Gateway protocol.'));
    }
    isValid = false;
  }
  if (appSettings.Gateway.Port === '') {
    if (appSettings.Gateway.Protocol === 'http') {
      appSettings.Gateway.Port = 3080;
    } else if (appSettings.Gateway.Protocol === 'https') {
      appSettings.Gateway.Port = 3443;
    }
  } 
  if (isNaN(appSettings.Gateway.Port)) {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid Gateway port.'));
    }
    isValid = false;
  }
  if (appSettings.Gateway.Protocol === 'https') {
    if (appSettings.Gateway.Key === '') {
      if (cluster.isMaster) {
        butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid Gateway key.'));
      }
      isValid = false;
    }
    if (appSettings.Gateway.Cert === '') {
      if (cluster.isMaster) {
        butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid Gateway certificate.'));
      }
      isValid = false;
    }
  }
  if (appSettings.Gateway.Cluster === '') {
    appSettings.Gateway.Cluster = os.cpus().length;
  }
  if (!isNaN(appSettings.Gateway.Cluster)) {
    if (appSettings.Gateway.Cluster > os.cpus().length || appSettings.Gateway.Cluster <= 0) {
      appSettings.Gateway.Cluster = os.cpus().length;
    }
  }
  if (isNaN(appSettings.Gateway.Cluster)) {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid Cluster size.'));
    }
    isValid = false;
  }  
  // Cache
  if (appSettings.Cache.Engine === 'memcached') {
    // OK, do nothing
  } else {
    appSettings.Cache.Engine = '';
  }
  if (appSettings.Cache.Engine === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid Cache engine.'));
    }
  }
  
  if (appSettings.Cache.Host === '') {
    appSettings.Cache.Host = 'localhost';
  }
  if (appSettings.Cache.Host === '') {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_FATAL, i18n.__('Could not find a valid Cache host.'));
    }
  }
  if (appSettings.Cache.Port === '') {
    if (appSettings.Cache.Engine === 'memcached') {
      appSettings.Cache.Port = 11211;
    }
  }
  if (isNaN(appSettings.Cache.Port)) {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_WARNING, i18n.__('Could not find a valid Cache port.'));
    }
  }
  if (appSettings.Cache.Weight === '') {
    if (appSettings.Cache.Engine === 'memcached') {
      appSettings.Cache.Weight = 1;
    }
  }
  if (isNaN(appSettings.Cache.Weight)) {
    if (cluster.isMaster) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_WARNING, i18n.__('Could not find a valid Cache weight.'));
    }
  }
  if (appSettings.Cache.Lifetime === '') {
	if (appSettings.Cache.Engine === 'memcached') {
	  appSettings.Cache.Lifetime = 300;
	}
  }
  if (isNaN(appSettings.Cache.Lifetime)) {
	if (cluster.isMaster) {
	  butrLog.writeLog(butrConstants.LOG_LEVEL_WARNING, i18n.__('Could not find a valid Cache lifetime.'));
	}
  }
  if (isValid === true) {
    appSettings.Configured = "true";
  }

  return isValid;
};

/**
 * This prints to the console the settings for the _configApp object
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @api public
 */
function printAppSettings() {
  'use strict';
  
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, i18n.__('### Butr App Settings ###'));
  
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Language='+_configApp.Language);
  
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Logging.Level='+_configApp.Logging.Level);    
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Logging.SystemFilePath='+_configApp.Logging.SystemFilePath);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Logging.HttpFilePath='+_configApp.Logging.HttpFilePath);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Logging.MessageFilePath='+_configApp.Logging.MessageFilePath);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Logging.Console='+_configApp.Logging.Console);
  
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Sql.Engine='+_configApp.Sql.Engine);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Sql.Name='+_configApp.Sql.Name);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Sql.Host='+_configApp.Sql.Host);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Sql.Port='+_configApp.Sql.Port);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Sql.User='+_configApp.Sql.User);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Sql.Pass='+_configApp.Sql.Pass);
  
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.NoSql.Engine='+_configApp.NoSql.Engine);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.NoSql.Name='+_configApp.NoSql.Name);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.NoSql.Host='+_configApp.NoSql.Host);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.NoSql.Port='+_configApp.NoSql.Port);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.NoSql.User='+_configApp.NoSql.User);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.NoSql.Pass='+_configApp.NoSql.Pass);
  
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Gateway.VirtualHost='+_configApp.Gateway.VirtualHost);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Gateway.Protocol='+_configApp.Gateway.Protocol);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Gateway.Port='+_configApp.Gateway.Port);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Gateway.Key='+_configApp.Gateway.Key);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Gateway.Cert='+_configApp.Gateway.Cert);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Gateway.Cluster='+_configApp.Gateway.Cluster);
  
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Cache.Engine='+_configApp.Cache.Engine);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Cache.Host='+_configApp.Cache.Host);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Cache.Port='+_configApp.Cache.Port);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Cache.Weight='+_configApp.Cache.Weight);
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'appSettings.Cache.Lifetime='+_configApp.Cache.Lifetime);
  
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, i18n.__('### Butr App Settings ###'));
}

/**
 * This prints out the message permissions
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @api public
 */
function printMessagePermissions() {
  'use strict';
  var i;
  
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, i18n.__('### Butr Message Permissions ###'));
  if (_configPermission !== undefined && _configPermission !== null && typeof(_configPermission) === 'object') {
    for(var key in _configPermission) {
      for(i = 0; i < _configPermission[key].length; i++) {
        butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'messagePermissions['+key+']['+i+']={ permission: '
          +_configPermission[key][i].permission+', partition: '+_configPermission[key][i].partition
          +', unauthenticated: '+_configPermission[key][i].unauthenticated+' }');
      }
    }
  }
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, i18n.__('### Butr Message Permissions ###'));
}

/**
 * This prints out the message permissions
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @api public
 */
function printGlobalSettings() {
  'use strict';
  
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, i18n.__('### Butr Global Settings ###'));
  if (_configSystem !== undefined && _configSystem !== null && typeof(_configSystem) === 'object') {
    for(var key in _configSystem) {
      butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, 'globalSettings['+key+']='+_configSystem[key]);
    }
  }
  butrLog.writeLog(butrConstants.LOG_LEVEL_DEBUG, i18n.__('### Butr Global Settings ###'));
}

/**
 * This returns the message permissions for the given message
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param messageName
 *   - string containing the name of the message
 * @returns
 *   - array containing the permissions
 * @api public
 */
function getMessagePermissions(messageName) {
  'use strict';
  
  if(messageName !== undefined && messageName !== null && typeof(messageName) === 'string') {
    if (_configPermission[messageName] !== undefined && _configPermission[messageName] !== null
        && typeof(_configPermission[messageName]) === 'object') {
      return _configPermission[messageName];
    }
  }
  return null;
}

/**
 * This returns the value for the given global setting.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param messageName
 *   - string containing the name of the message
 * @returns
 *   - string containing the setting
 * @api public
 */
function getGlobalSetting(settingName) {
  'use strict';
  
  if(settingName !== undefined && settingName !== null && typeof(settingName) === 'string') {
    if (_configSystem[settingName] !== undefined && _configSystem[settingName] !== null
      && typeof(_configSystem[settingName]) === 'object') {
      return _configSystem[settingName];
    }
  }
  return null;
}

/**
 * This returns the value for the given application setting.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param messageName
 *   - string containing the name of the message
 * @returns
 *   - string containing the setting
 * @api public
 */
function getAppSetting(settingName) {
  'use strict';
  
  if(settingName !== undefined && settingName !== null && typeof(settingName) === 'string') {
    if (_configApp[settingName] !== undefined && _configApp[settingName] !== null
      && typeof(_configApp[settingName]) === 'object') {
      return _configApp[settingName];
    }
  }
  return null;
}

/**
 * This builds the SQL to log the query which has been run.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @returns string
 *   - Contains the SQL to be executed.
 * @api private
 */
function sqlListMessagePermission() {
  'use strict';
  
  return "CALL p_security_ListMessagePermission();";
}

/**
 * This builds the SQL query for listing the global configuration.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlListGlobalConfigurations(sessionUuid, transactionUuid) {
  'use strict';
  
  return "CALL p_configuration_ListGlobal(@i_SessionUuid='"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)+"');";
}

// Load the application settings
loadAppSettings();

/**
 * Module exports
 */
module.exports.AppSettings = _configApp;
module.exports.validateAppSettings = validateAppSettings;
module.exports.loadDatabaseSettings = loadDatabaseSettings;
module.exports.loadMessagePermission = loadMessagePermissions;
module.exports.loadGlobalSettings = loadGlobalSettings;
module.exports.printAppSettings = printAppSettings;
module.exports.printMessagePermissions = printMessagePermissions;
module.exports.printGlobalSettings = printGlobalSettings;
module.exports.getMessagePermissions = getMessagePermissions;
module.exports.getGlobalSetting = getGlobalSetting;
module.exports.getAppSetting = getAppSetting;