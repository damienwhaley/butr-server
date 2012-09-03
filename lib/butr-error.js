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
var util = require('util');
var i18n = require('i18n');
if (process.env.NODE_ENV !== 'production' && process.env.NODE_ENV !== 'test') {
  require('long-stack-traces');
}

/**
 * Butr module dependencies.
 */
var butrLog = require('./butr-log');
var butrConstants = require('./butr-constants');
var butrInit = require('./butr-init');

/**
 * This sets up the default uncaught exception handler, also catches CTRL-C (SIGINT) and exits gracefully.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @api public
 */
function configureError() {
  'use strict';
  process.on('uncaughtException', function (err) {
    'use strict';
    if (err !== undefined && err !== null && typeof(err) === 'object') {      
      logError(err, butrConstants.LOG_LEVEL_ALERT, i18n.__('Caught an uncaught exception - %s.', err));
    }
    else {
      logError(null, butrConstants.LOG_LEVEL_ALERT, i18n.__('Caught a mysterious uncaught exception.'));
    }
  });
  
  process.on('SIGINT', function () {
    butrInit.shutdown();
  });
  process.on('SIGHUP', function () {
	butrInit.shutdown();
  });
  process.on('SIGKILL', function () {
	butrInit.shutdown();
  });
  process.on('SIGTERM', function () {
	butrInit.shutdown();
  });
};

/**
 * Writes the error to the log.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 * @param logLevel
 * @param logMessage
 * @api public
 */
function logError(err, logLevel, logMessage) {
  'use strict';
  if (err !== undefined && err != null && typeof(err) === 'object') {
    try {
      var theError = new Error();
      var stackTrace = '';
      if (theError !== undefined && theError !== null && typeof(theError) === 'object') {
        stackTrace = new Error().stack;
      }
      var inspectObject = util.inspect(err);
      butrLog.writeLog(logLevel, logMessage + ' ' + err + '\n\n' + stackTrace + '\n\n' + inspectObject);
    } catch (e) {
      butrLog.writeLog(logLevel, logMessage + ' ' + err + '\n\n' + e);
    }
  } else {
    butrLog.writeLog(logLevel, logMessage);
  }
}

/**
 * This logs the arguments analysis (this is where I get tripped up on callbacks)
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 * @param logLevel
 * @param logMessage
 * @param argumentLength arguments.length
 * @param argumentCaller arguments.callee.caller.toString()
 * @api public
 */
function logArgumentAnalysis(logLevel, logMessage, argumentLength, argumentCaller) {
  'use strict';
  butrLog.writeLog(logLevel, logMessage + '\nNumber of arguments: ' + argumentLength + '\nCaller: ' + argumentCaller);  
}

/**
 * Module exports
 */
module.exports.logError = logError;
module.exports.logArgumentAnalysis = logArgumentAnalysis;
module.exports.configureError = configureError;