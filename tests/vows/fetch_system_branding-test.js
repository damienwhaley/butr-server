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
var vows = require('vows');
var assert = require('assert');
var moment = require('moment');
var uuid = require('node-uuid');
var crypto = require('crypto');

/**
 * Custom module dependencies.
 */
var butrConstants = require('../../lib/butr-constants');
var butrVows = require('./butr-vows');

var _postTarget = butrVows.AppSettings.Gateway.Protocol + '://'
  + butrVows.AppSettings.Gateway.VirtualHost + ':'
  + butrVows.AppSettings.Gateway.Port;

var _sessionToken = '';
		  
var testSuite = vows.describe('Calling fetch_system_branding message');

testSuite.addBatch({
  'Is Server Up': {
	topic: function() {
	  var targetRoute = '/json';
	  
	  var reqBody = {};
	  
	  var requestOptions = {
		uri: _postTarget + targetRoute,
		method: 'POST',
		json: reqBody
	  };
	  
	  request(requestOptions, this.callback);
	},
    'Check server is responding': function(error, response, body) {
      assert.ok(body);
    }
  }
});

// Add batch here to authenticate (once we have authentication sorted out)

testSuite.addBatch({
  'Requesting JSON target': {
    topic: function() {     
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
      
      request(requestOptions, this.callback);
    },
    'Checking HTTP Status Code Returned': function (error, response, body) {
      assert.equal(response.statusCode, '200');
    },
    'Checking Session Token': function(error, response, body) {
      assert.equal(body.authentication.session_token, '');
    },
    'Checking Result Status': function(error, response, body) {
      assert.equal(body.result.status, butrConstants.MESSAGE_RESULT_OK);
    },
    'Checking Message Body': function(error, response, body) {
      assert.notStrictEqual(body.fetch_system_branding, undefined);
      assert.notStrictEqual(body.fetch_system_branding, null);
      assert.notEqual(body.fetch_system_branding.system_version, '');
      assert.notEqual(body.fetch_system_branding.company_name, '');
      assert.notEqual(body.fetch_system_branding.default_language, ''); 
    }
  }
});

/**
 * Export the test suite
 */
testSuite.export(module);