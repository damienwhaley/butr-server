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
var uuid = require('node-uuid');
var DomJS = require('dom-js').DomJS;
var cloneextend = require('cloneextend');

/**
 * Butr module dependencies.
 */
var butrApiJsonAuthentication = require('./api_json/authentication');
var butrApiRestAuthentication = require('./api_rest/authentication');
var butrApiJsonError = require('./api_json/error');
var butrApiRestError = require('./api_rest/error');
var butrConstants = require('./butr-constants');
var butrApiInternalLog = require('./api_internal/log');

/**
 * This handles the routing for JSON messages.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param req
 *   - Object containing the request.
 * @param res
 *   - Object containing the response.
 * @api public
 */
function routeJson(req, res) {
  'use strict';
  
  var metaJson = {};
  metaJson.command = {};
  metaJson.command.name = '';
  metaJson.command.start = new Date();
  metaJson.command.finish = null;
  metaJson.command.transaction = uuid.v4();
  metaJson.command.request = '';
  metaJson.command.response = '';
  metaJson.sql = {};
  metaJson.sql.queryString = [];
  metaJson.sql.start = [];
  metaJson.sql.finish = [];
  metaJson.sql.isCacheable = [];
  metaJson.sql.resultFromCache = [];
  metaJson.session = {};
  metaJson.session.token = '';
  metaJson.session.user = '';
  metaJson.route = 'json';
  
  var authJson = {};
  var messageName = '';
  var messageJson = {};

  if ( req.is('json') || req.is('application/json')) {
    metaJson.command.request = JSON.stringify(req.body);
    
    for (var key in req.body) {
      if (key === 'authentication') {
        authJson = cloneextend.clone(req.body[key]);
      }
      else {
        if (messageName === '') {
          messageName = key;
          messageJson = cloneextend.clone(req.body[key]);
          metaJson.command.name = key;
        }
      }
    }
    return butrApiJsonAuthentication.checkAuthentication(res, metaJson, authJson, messageName, messageJson); 
  }
  else {
    metaJson.command.request = req.body;
    butrApiJsonError.renderFormatError(err, res, metaJson);
  }
}

/**
 * This handles the routing for XML REST messages.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param req
 *   - Object containing the request.
 * @param res
 *   - Object containing the response.
 * @api public
 */
function routeRest(req, res) {
  'use strict';
  
  var domjs = new DomJS();
  domjs.reset();
  
  var metaJson = {};
  metaJson.command = {};
  metaJson.command.name = '';
  metaJson.command.start = new Date();
  metaJson.command.finish = null;
  metaJson.command.transaction = uuid.v4();
  metaJson.command.request = '';
  metaJson.command.response = '';
  metaJson.sql = {};
  metaJson.sql.queryString = [];
  metaJson.sql.start = [];
  metaJson.sql.finish = [];
  metaJson.sql.isCacheable = [];
  metaJson.sql.resultFromCache = [];
  metaJson.session = {};
  metaJson.session.token = '';
  metaJson.session.user = '';
  metaJson.route = 'rest';
  
  var authRest = {};
  var messageName = '';
  var messageRest = {};
  
  if ( req.is('txml') || req.is('text/xml')) {
    domjs.parse(req.body, function(err, dom) {
      'use strict';
      
      if (err) {
    	// Could not parse XML
    	metaJson.command.request = req.body;
    	butrApiRestError.renderFormatError(err, res, metaJson);
      }
	  else {

		if (dom.name !== 'butr') {
		  // Not a valid message.
	      metaJson.command.request = req.body;
	      butrApiRestError.renderFormatError(err, res, metaJson);
		}
		
		for(var i = 0; i < dom.children.length; i++) {
		  if (dom.children[i].name === 'authentication') {
			authRest = cloneextend.clone(dom.children[i]);
		  }
		  else if (dom.children[i].name !== undefined && dom.children[i].name !== null
			&& dom.children[i].name !== '' && dom.children[i].name !== 'undefined') {
		    messageRest = cloneextend.clone(dom.children[i]);
		    messageName = dom.children[i].name;
		    metaJson.command.name = dom.children[i].name;
		    break;
		  }
		}
		
		return butrApiRestAuthentication.checkAuthentication(res, metaJson, authRest, messageName, messageRest);
	  }
	});
  } else {
	metaJson.command.request = req.body;
    butrApiRestError.renderFormatError(err, res, metaJson);
  }
}

/**
 * This handles the routing for SOAP messages.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param req
 *   - Object containing the request.
 * @param res
 *   - Object containing the response.
 * @api public
 */
function routeSoap(req, res) {
  'use strict';
  
  var metaJson = {};
  metaJson.command = {};
  metaJson.command.name = '';
  metaJson.command.start = new Date();
  metaJson.command.finish = null;
  metaJson.command.transaction = uuid.v4();
  metaJson.command.request = '';
  metaJson.command.response = '';
  metaJson.sql = {};
  metaJson.sql.queryString = [];
  metaJson.sql.start = [];
  metaJson.sql.finish = [];
  metaJson.sql.isCacheable = [];
  metaJson.sql.resultFromCache = [];
  metaJson.session = {};
  metaJson.session.token = '';
  metaJson.session.user = '';
  metaJson.route = 'soap';
  
  var output = '';
  
  if ( req.is('txml') || req.is('text/xml')) {
    output = output+'it\'s valid XML!<br>';
    output = output+'posted to SOAP.<br>';
    output = output+'req.header(\'Content-Type\')='+req.header('Content-Type')+'<br>';
    output = output+'req.headers[\'content-type\']='+req.headers['content-type']+'<br>';
    output = output+'req.body='+req.body+'<br>';
    output = output+'typeof(req.body)='+typeof(req.body)+'<br>';
    res.send(output, { "Content-type": "text/xml" }, 200);
  } else {
    output = output+'{ "error": "this does not look like SOAP" }';
    res.send(output, { "Content-type": "application/json" }, 200);
  }
}

/**
 * This is the default error handler for a not-accepted post target
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param req
 *   - Object containing the request.
 * @param res
 *   - Object containing the response.
 * @api public
 */
function routePostError(req, res) {
  'use strict';
  
  var metaJson = {};
  metaJson.command = {};
  metaJson.command.name = '';
  metaJson.command.start = new Date();
  metaJson.command.finish = null;
  metaJson.command.transaction = uuid.v4();
  metaJson.command.request = req.body;
  metaJson.command.response = '';
  metaJson.sql = {};
  metaJson.sql.queryString = [];
  metaJson.sql.start = [];
  metaJson.sql.finish = [];
  metaJson.sql.isCacheable = [];
  metaJson.sql.resultFromCache = [];
  metaJson.session = {};
  metaJson.session.token = '';
  metaJson.session.user = '';
  metaJson.route = 'invalid';
  
  res.send(i18n.__('Internal Server Error'), { "Content-type": "text/plain" }, 500);
  
  metaJson.command.response = i18n.__('Internal Server Error');
  metaJson.command.transaction = uuid.v4();
  metaJson.command.finish = new Date();
  metaJson.command.request = req.body;
  
  // Log meta data
  butrApiInternalLog.logMeta(metaJson);
}

/**
 * This is the default error handler for a not-accepted verb
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param req
 *   - Object containing the request.
 * @param res
 *   - Object containing the response.
 * @api public
 */
function routeNonPostError(req, res) {
  'use strict';
  
  var metaJson = {};
  metaJson.command = {};
  metaJson.command.name = '';
  metaJson.command.start = new Date();
  metaJson.command.finish = null;
  metaJson.command.transaction = uuid.v4();
  metaJson.command.request = req.queryString;
  metaJson.command.response = '';
  metaJson.sql = {};
  metaJson.sql.queryString = [];
  metaJson.sql.start = [];
  metaJson.sql.finish = [];
  metaJson.sql.isCacheable = [];
  metaJson.sql.resultFromCache = [];
  metaJson.session = {};
  metaJson.session.token = '';
  metaJson.session.user = '';
  metaJson.route = 'invalid';
  
  res.send(i18n.__('Internal Server Error'), { "Content-type": "text/plain" }, 500);
  
  metaJson.command.response = i18n.__('Internal Server Error');
  metaJson.command.transaction = uuid.v4();
  metaJson.command.finish = new Date();
  metaJson.command.request = req.body;
  
  // Log meta data
  butrApiInternalLog.logMeta(metaJson);
}

/**
 * This is the diagnostic you can call to see if the server is up.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param req
 *   - Object containing the request.
 * @param res
 *   - Object containing the response.
 * @param msg
 *   - The text to display
 * @api public
 */
function routeDiag(req, res, msg) {
  'use strict';
  
  var metaJson = {};
  metaJson.command = {};
  metaJson.command.name = '';
  metaJson.command.start = new Date();
  metaJson.command.finish = null;
  metaJson.command.transaction = uuid.v4();
  metaJson.command.request = req.queryString;
  metaJson.command.response = '';
  metaJson.sql = {};
  metaJson.sql.queryString = [];
  metaJson.sql.start = [];
  metaJson.sql.finish = [];
  metaJson.sql.isCacheable = [];
  metaJson.sql.resultFromCache = [];
  metaJson.session = {};
  metaJson.session.token = '';
  metaJson.session.user = '';
  metaJson.route = 'diag';
  
  if (msg !== undefined && msg !== null && typeof(msg) === 'string') {
    res.send(msg, { "Content-type": "text/plain" }, 200);
    metaJson.command.response = msg;
  }
  else {
    res.send('', { "Content-type": "text/plain" }, 200);
  }
  
  metaJson.command.transaction = uuid.v4();
  metaJson.command.finish = new Date();
  metaJson.command.request = req.body;
  
  // Log meta data
  butrApiInternalLog.logMeta(metaJson);
}

/**
 * This is the route to give a 404 for a favicon request.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param req
 *   - Object containing the request.
 * @param res
 *   - Object containing the response.
 * @api public
 */
function routeFavicon(req, res) {
  'use strict';
  
  var metaJson = {};
  metaJson.command = {};
  metaJson.command.name = '';
  metaJson.command.start = new Date();
  metaJson.command.finish = null;
  metaJson.command.transaction = uuid.v4();
  metaJson.command.request = req.queryString;
  metaJson.command.response = '';
  metaJson.sql = {};
  metaJson.sql.queryString = [];
  metaJson.sql.start = [];
  metaJson.sql.finish = [];
  metaJson.sql.isCacheable = [];
  metaJson.sql.resultFromCache = [];
  metaJson.session = {};
  metaJson.session.token = '';
  metaJson.session.user = '';
  metaJson.route = 'favicon';
  
  res.send(i18n.__('Not Found'), { "Content-type": "text/plain" }, 404);
  
  metaJson.command.response = i18n.__('Not Found');
  metaJson.command.transaction = uuid.v4();
  metaJson.command.finish = new Date();
  metaJson.command.request = req.body;
  
  // Log meta data
  butrApiInternalLog.logMeta(metaJson);
}

/**
 * Module exports
 */
module.exports.routeJson = routeJson;
module.exports.routeRest = routeRest;
module.exports.routeSoap = routeSoap;
module.exports.routePostError = routePostError;
module.exports.routeNonPostError = routeNonPostError;
module.exports.routeDiag = routeDiag;
module.exports.routeFavicon = routeFavicon;