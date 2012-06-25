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
var log = require('log');
var fs = require('fs');
var moment = require('moment');
var i18n = require('i18n');

/**
 * Butr module dependencies.
 */
var butrConstants = require('./butr-constants');

/**
 * Private variables used in the module.
 */
var _currentSystemLogPath = '';
var _settingsSystemLogPath = '';
var _currentHttpLogPath = '';
var _settingsHttpLogPath = '';
var _currentMessageLogPath = '';
var _settingsMessageLogPath = '';
var _isWritingToConsole = false;
var _appPath = '';
var _minimumLogLevel = butrConstants.LOG_LEVEL_CRITICAL;

/**
 * Configure the logging module with the application settings.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param appSettings
 * @api public
 */
function configureLogging(appSettings) {
  'use strict';
  if (appSettings.Logging.Level === '') {
    appSettings.Logging.Level = butrConstants.LOG_LEVEL_CRITICAL;
  }
  if (isNaN(appSettings.Logging.Level)) {
    appSettings.Logging.Level = butrConstants.LOG_LEVEL_CRITICAL;
  }
  if (parseInt(appSettings.Logging.Level, 10)>butrConstants.LOG_LEVEL_ALL) {
    appSettings.Logging.Level = butrConstants.LOG_LEVEL_ALL;
  }
  _minimumLogLevel = appSettings.Logging.Level;
  
  if (appSettings.Logging.Console === 'true') {
    _isWritingToConsole = true;
  } else {
    appSettings.Logging.Console = 'false';
    _isWritingToConsole = false;
  }

  if (appSettings.Logging.SystemFilePath !== '') {
    _settingsSystemLogPath = appSettings.Logging.SystemFilePath;
  } else {
    _settingsSystemLogPath = 'logs/butr.log';
  }
  
  if (appSettings.Logging.HttpFilePath !== '') {
    _settingsHttpLogPath = appSettings.Logging.HttpFilePath;
  } else {
    _settingsHttpLogPath = 'logs/http.log';
  }
  
  if (appSettings.Logging.MessageFilePath !== '') {
    _settingsMessageLogPath = appSettings.Logging.MessageFilePath;
  } else {
    _settingsMessageLogPath = 'logs/message.log';
  }
  
  _appPath = __dirname;
  if (_appPath.length > 4) {
    if (_appPath.substring(_appPath.length - 4, _appPath.length) === '/lib') {
      _appPath = _appPath.substring(0, _appPath.length - 3);
    }
  }
  
  var path_regex = /^[A-Z]|[a-z]:\\/;
  
  if (_settingsSystemLogPath.length > 0) {
    if (_settingsSystemLogPath.charAt(0) === '/' || _settingsSystemLogPath.charAt(0) === '\\'
      || path_regex.test(_settingsSystemLogPath)) {
      _currentSystemLogPath = _settingsSystemLogPath;
    }
    else {
      _currentSystemLogPath = _appPath+_settingsSystemLogPath;
    }
  }
  
  if (_settingsHttpLogPath.length > 0) {
    if (_settingsHttpLogPath.charAt(0) === '/' || _settingsHttpLogPath.charAt(0) === '\\'
      || path_regex.test(_settingsHttpLogPath)) {
      _currentHttpLogPath = _settingsHttpLogPath;
    }
    else {
      _currentHttpLogPath = _appPath+_settingsHttpLogPath;
    }
  }
  
  if (_settingsMessageLogPath.length > 0) {
    if (_settingsMessageLogPath.charAt(0) === '/' || _settingsMessageLogPath.charAt(0) === '\\'
      || path_regex.test(_settingsMessageLogPath)) {
      _currentMessageLogPath = _settingsMessageLogPath;
    }
    else {
      _currentMessageLogPath = _appPath+_settingsMessageLogPath;
    }
  }
};

/**
 * Perform writing of message to a log file.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param loggingLevel
 * @param loggingMessage
 * @api public
 */
function writeLog(loggingLevel, loggingMessage) {
  'use strict';
  var fileStream = {};
  var fileLog = {};
  
  if (loggingLevel <= _minimumLogLevel) {
    
    if (_currentSystemLogPath !== '') {
      fileStream = fs.createWriteStream(_currentSystemLogPath, { "flags": "a", "encoding": "utf-8", "mode": "0666" });
      fileLog = new log('debug', fileStream);
    }
    var consoleLog = new log('debug');
    
    switch(loggingLevel) {
    case butrConstants.LOG_LEVEL_DEBUG:
      if (_currentSystemLogPath !== '') {
        fileLog.debug(loggingMessage);
      }
      if (_isWritingToConsole === true) {
        consoleLog.debug(loggingMessage);
      }
      break;
    case butrConstants.LOG_LEVEL_INFO:
      if (_currentSystemLogPath !== '') {
        fileLog.info(loggingMessage);
      }
      if (_isWritingToConsole === true) {
        consoleLog.info(loggingMessage);
      }
      break;
    case butrConstants.LOG_LEVEL_NOTICE:
      if (_currentSystemLogPath !== '') {
        fileLog.notice(loggingMessage);
      }
      if (_isWritingToConsole === true) {
        consoleLog.notice(loggingMessage);
      }
      break;
    case butrConstants.LOG_LEVEL_WARNING:
      if (_currentSystemLogPath !== '') {
        fileLog.warning(loggingMessage);
      }
      if (_isWritingToConsole === true) {
        consoleLog.warning(loggingMessage);
      }
      break;
    case butrConstants.LOG_LEVEL_ERROR:
      if (_currentSystemLogPath !== '') {
        fileLog.error(loggingMessage);
      }
      if (_isWritingToConsole === true) {
        consoleLog.error(loggingMessage);
      }
      break;
    case butrConstants.LOG_LEVEL_CRITICAL:
      if (_currentSystemLogPath !== '') {
        fileLog.critical(loggingMessage);
      }
      if (_isWritingToConsole === true) {
        consoleLog.critical(loggingMessage);
      }
      break;
    case butrConstants.LOG_LEVEL_ALERT:
      if (_currentSystemLogPath !== '') {
        fileLog.alert(loggingMessage);
      }
      if (_isWritingToConsole === true) {
        consoleLog.alert(loggingMessage);
      }
      break;
    case butrConstants.LOG_LEVEL_EMERGENCY:
      if (_currentSystemLogPath !== '') {
        fileLog.emergency(loggingMessage);
      }
      if (_isWritingToConsole === true) {
        consoleLog.emergency(loggingMessage);
      }
      break;
    }
  }
  return;
};

/**
 * This writes the http log.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param loggingMessage
 * @api public
 */
function writeHttpLog(loggingMessage) {
  'use strict';

  if (_currentHttpLogPath !== '') {
    var fileStream = fs.createWriteStream(_currentHttpLogPath, { "flags": "a", "encoding": "utf-8", "mode": "0666" });
    var fileLog = new log('debug', fileStream);
    
    fileLog.info(loggingMessage);
  }
};

/**
 * This writes the message log.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param messageIn
 *   - string containing the request message
 * @param messageOut
 *   - string containing the response message
 * @api public
 */
function writeMessageLog(messageIn, messageOut) {
  'use strict';
  
  if (_currentMessageLogPath !== '') {
    var fileStream = fs.createWriteStream(_currentMessageLogPath, { "flags": "a", "encoding": "utf-8", "mode": "0666" });
    var fileLog = new log('debug', fileStream);
    
    fileLog.info(i18n.__('REQUEST: %s', messageIn));
    fileLog.info(i18n.__('RESPONSE: %s', messageOut));
  }
};

/**
 * This returns the path to the http log files.
 * @returns string
 *   - String containing the path to the http log file.
 */
function getHttpLogPath() {
  'use strict';
  
  return _currentHttpLogPath;
}

/**
 * This gets the UTC datestamp for the file name.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @returns string
 *   - containing the formatted datestamp.
 * @api private
 */
function getDateStamp() {
  'use strict';
  var localDate = new Date();
  var offsetHours = parseInt(localDate.getTimezoneOffset(), 10);
  var utcDate = moment(new Date());
  utcDate.add('hours', offsetHours);
  return utcDate.format('YYYYMMDD');
}

/**
 * Module exports
 */
module.exports.writeLog = writeLog;
module.exports.configureLogging = configureLogging;
module.exports.writeHttpLog = writeHttpLog;
module.exports.writeMessageLog = writeMessageLog;
module.exports.getHttpLogPath = getHttpLogPath;