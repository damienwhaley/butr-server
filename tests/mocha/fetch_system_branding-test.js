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
var request = require('request');
var moment = require('moment');
var should = require('should');
var mocha = require('mocha');
var uuid = require('node-uuid');
var crypto = require('crypto');

/**
 * Custom module dependencies.
 */
var butrMocha = require('./butr-mocha');
var butrConstants = require('../../lib/butr-constants');

var _postTarget = butrMocha.AppSettings.Gateway.Protocol + '://'
  + butrMocha.AppSettings.Gateway.VirtualHost + ':'
  + butrMocha.AppSettings.Gateway.Port;

var _sessionToken = '';

describe('Calling fetch_system_banding message check', function() {
  'use strict';
  
  describe('Is server up?', function() {
	'use strict';
	
	it('Should be responding', function(done) {
	  'use strict';
	  
      var targetRoute = '/';
	  
      var reqBody = {};
  
      var requestOptions = {
	    uri: _postTarget + targetRoute,
	    method: 'POST',
	    json: reqBody
      };
  
      request(requestOptions, function(error, response, body) {
    	'use strict';
    	
    	body.should.be.ok;
    	
    	// Finished
        done();
      });
    });
  });

  describe('Calling fetch_system_banding message do', function() {
	'use strict';
	
	it('Should return valid output for valid input', function(done) {
	  'use strict';
	  
	  var targetRoute = '/json';
	      
	  var myNonce = uuid.v4();
      var myApiSecret = '9e9c3b093fd71f372823cd6d4ea8cc5ddd302aaf7df53b2dcd0f70c5d5a2508a';
      var hashedApiSecret = crypto.createHmac('sha256', myNonce).update(myApiSecret).digest('hex');
      
      var reqBody = {};
      reqBody.authentication = {};
      reqBody.authentication.api_key = '9da7feb8-5f5c-11e1-8107-001c421dce29';
      reqBody.authentication.nonce = myNonce;
      reqBody.authentication.api_secret = hashedApiSecret;
      reqBody.authentication.username = '';
      reqBody.authentication.password = '';
      reqBody.fetch_system_branding = {};
	      
	  var requestOptions = {
		uri: _postTarget + targetRoute,
		method: 'POST',
		json: reqBody
	  };
  
      request(requestOptions, function(error, response, body) {
        'use strict';
          
        response.statusCode.should.equal(200);
        body.authentication.session_token.should.be.a('string');
        body.result.status.should.equal(butrConstants.MESSAGE_RESULT_OK);
        body.fetch_system_branding.should.not.equal(undefined);
        body.fetch_system_branding.should.not.equal(null);
        body.fetch_system_branding.system_version.should.be.a('string');
        body.fetch_system_branding.company_name.should.be.a('string');
        body.fetch_system_branding.default_language.should.be.a('string');   
        
        // Finished
        done();
      });
    });
  });
  
  
});
