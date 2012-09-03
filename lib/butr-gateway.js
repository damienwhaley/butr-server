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

// TODO: hook up error handling for express - read docs

/**
 * Contributed module dependencies.
 */
var cluster = require('cluster');
var express = require('express');
var i18n = require('i18n');
var fs = require('fs');
var moment = require('moment');
var domain = require('domain');

/**
 * Butr module dependencies.
 */
var butrConstants = require('./butr-constants');
var butrLog = require('./butr-log');
var butrError = require('./butr-error');
var butrRouter = require('./butr-router');
var butrUtil = require('./butr-util');
var butrXmlRawMiddleware = require('./middleware/butr-xmlRaw');

/**
 * Module variables.
 */
var _appSettings = {};
var _app = {};
var _server = {};
var _diag = '';
var _httpLogFile = '';
var _httpLogFileStream;

/**
 * This configures the base server which actually take the post and passes it to a message handler
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param appSettings
 * @api public
 */
function configureGateway(appSettings) {
  'use strict';
  _appSettings = appSettings;
  _server = express();
  
  _httpLogFile = butrLog.getHttpLogPath();
  _httpLogFileStream = fs.createWriteStream(_httpLogFile, { "flags": "a", "encoding": "utf-8", "mode": "0666" });
  
  _server.use(express.logger({ stream: _httpLogFileStream }));
  _server.use(express.query());
  _server.use(express.bodyParser());
  _server.use(butrXmlRawMiddleware({ "strict": false }));
  
  // JOSN message target
  _server.post('/json', function(req, res, next) {	  
    butrRouter.routeJson(req, res);
  });
  
  // XML REST message target
  _server.post('/rest', function(req, res, next) {
    butrRouter.routeRest(req, res);
  });
  
  // SOAP message target
  _server.post('/soap', function(req, res, next) {
    butrRouter.routeSoap(req, res);
  });
  
  // Do nothing for /favicon.ico requests
  _server.get('/favicon.ico', function(req, res, next) {
    butrRouter.routeFavicon(req, res);
  });
  
  // Use this to check to see if the server is listening and you don't have console or SSH.
  _server.get('/diag', function(req, res, next) {    
    butrRouter.routeDiag(req, res, _diag);
  });
  
  // This is the catch-all for non-accepted verbs
  _server.get('*', function(req, res, next) {    
    butrRouter.routeNonPostError(req, res);
  });
  
  // This is the catch-all for posting to wrong targets
  _server.post('*', function(req, res, next) {
    butrRouter.routePostError(req, res);
  });
  
  // This is the catch-all for everything else
  _server.all('*', function(req, res, next) {    
    butrRouter.routeNonPostError(req, res);
  });
  
  // Catch any errors.
  _server.error = function(fn) {
	this.use(function(err, req, res, next) {
	  butrError.logError(err, butrConstants.LOG_LEVEL_ERROR, i18n.__('Gateway error.'));
      fn.apply(this, arguments);
	});
  };
}

/**
 * This starts the virtualhost and the app is now listening for requests
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param appSettings
 *   - object containing the application settings.
 * @api public
 */
function startGateway(appSettings) {
  'use strict';
  
  if (cluster.isMaster) {
    cluster.on('death', function(worker) {
      'use strict';
      butrLog.writeLog(butrConstants.LOG_LEVEL_INFO, i18n.__('Cluster worker with pid %s has died and will be respawned.', worker.pid));
      cluster.fork();
    });
       
    // Fork workers.
    for (var i = 0; i < parseInt(appSettings.Gateway.Cluster, 10); i++) {
      cluster.fork();
    }   
  } else {
	var domainWorker = domain.create();  
	  
	domainWorker.on('error', function(er) {
	  butrError.logError(err, butrConstants.LOG_LEVEL_ALERT,
	   i18n.__('Caught a domain error - %s.', err));
	});
		
	domainWorker.run(function() {
	  'use strict';
	  
      // Worker processes start the gateway server.
      if (appSettings.Gateway.Protocol === 'https') {
        var serverOptions = { "key": appSettings.Gateway.Key, "cert": appSettings.Gateway.Cert };
        _app = express(serverOptions);
      }
      else {
        _app = express();
      }
    
      _app.use(express.vhost(appSettings.Gateway.VirtualHost, _server));
      _app.listen(parseInt(appSettings.Gateway.Port, 10));
	});
  }
  
  var _diag = i18n.__('Butr v%s with pid %s has started and is listening on %s://%s:%s', butrConstants.SYSTEM_VERSION, process.pid,
    appSettings.Gateway.Protocol, appSettings.Gateway.VirtualHost, appSettings.Gateway.Port);
  butrLog.writeLog(butrConstants.LOG_LEVEL_INFO, _diag);
}

/**
 * Module exports
 */
module.exports.configureGateway = configureGateway;
module.exports.startGateway = startGateway;