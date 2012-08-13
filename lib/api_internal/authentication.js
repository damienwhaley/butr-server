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
var crypto = require('crypto');
var uuid = require('node-uuid');
var moment = require('moment');

/**
 * Butr module dependencies.
 */
var butrDatabase = require('../butr-database');
var butrRedis = require('../butr-redis');
var butrConstants = require('../butr-constants');
var butrApiInternalSecurity = require('./security');
var butrApiJsonError = require('../api_json/error');
var butrApiRestError = require('../api_rest/error');
var butrConfig = require('../butr-config');

/**
 * This checks the authentication details - first in redis to see if the session token
 * is there and valid, and if it is not there it checks the database for the same token.
 * If the token is not there or is not valid, then it checks the credentials passed to
 * make sure that they match. If they do, a session token is created, and passed on to
 * the next function. If there's no session, then it figures out which function to call
 * to present an error.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param res
 *   - The HTTP response object
 * @param metaJson
 *   - Object containing meta data about the command.
 * @param messageFormat
 *   - The message format constant
 * @param authInternal
 *   - JSON snippet containing the authentication details in internal format.
 * @param messageName
 *   - The name of the message to be called once authentication passes.
 * @param messageInternal
 *   - JSON snippet of the message in internal format.
 * @api public
 */
function checkAuthentication(res, metaJson, messageFormat, authInternal,
  messageName, messageInternal) {
  'use strict';
  var apiKey = '';
  var apiSecret = '';
  var nonce = '';
  var method = '';
  var username = '';
  var password = '';
  var sessionToken = '';
  var authorisationMethod = butrConstants.AUTHORISATION_METHOD_NONE;
  
  // If messageInternal is null then there was at least a missing field in the
  // message so return an error
  if (messageInternal === undefined || messageInternal === null) {
    if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
	  return butrApiJsonError.renderMessageError(null, res, messageName, metaJson, null);
	}
    else if(messageFormat === butrConstants.MESSAGE_FORMAT_REST) {
	  return butrApiRestError.renderMessageError(null, res, messageName, metaJson, null);
	}
  }
  
  for (var key in authInternal) {
    switch(key) {
    case 'api_key':
      apiKey = authInternal[key];
      break;
    case 'api_secret':
      apiSecret = authInternal[key];
      break;
    case 'nonce':
      nonce = authInternal[key];
      break;
    case 'method':
      method = authInternal[key];
      break;
    case 'username':
      username = authInternal[key];
      break;
    case 'password':
      password = authInternal[key];
      break;
    case 'session_token':
      sessionToken = authInternal[key];
      break;
    }
  }

  if (sessionToken !== undefined && sessionToken !== null && sessionToken !== '') {
    if (butrDatabase.getNoSqlEngine() === 'redis') {
      fetchSessionRedis(res, metaJson, sessionToken, messageFormat, messageName, messageInternal);
    }
    else {
      fetchSessionDatabase(res, metaJson, session_token, messageFormat, messageName, messageInternal);
    }
  }
  else {
    switch(method.toLowerCase()) {
    case 'local':
      authorisationMethod = butrConstants.AUTHENTICATION_METHOD_LOCAL;
      break;
    case 'facebook':
      authorisationMethod = butrConstants.AUTHENTICATION_METHOD_FACEBOOK;
      break;
    case 'openid':
      authorisationMethod = butrConstants.AUTHENTICATION_METHOD_OPENID;
      break;
    case 'twitter':
      authorisationMethod = butrConstants.AUTHENTICATION_METHOD_TWITTER;
      break;
    case 'google':
      authorisationMethod = butrConstants.AUTHENTICATION_METHOD_GOOGLE;
      break;
    }
    
    createSession(res, metaJson, apiKey, apiSecret, nonce, authorisationMethod, username, password, messageFormat, messageName, messageInternal);
  }
}

/**
 * This calls the fetch from redis and sets up the callbacks.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param res
 *   - the HTTP response object
 * @param sessionToken
 *   - String containing the session token
 * @param messageFormat
 *   - The final format for the message
 * @param messageName
 *   - String containing the message name
 * @param messageInternal
 *   - Object containing the message in the internal format
 * @api private
 */
function fetchSessionRedis(res, metaJson, sessionToken, messageFormat, messageName, messageInternal) {
  'use strict';
  
  butrRedis.fetchKey(sessionToken, function(err, replies, key, next) {
    'use strict';
    
    callbackFetchSessionRedis(err, res, replies, key, metaJson, messageFormat, messageName, messageInternal);
  }, null);
}

/**
 * This checks the results from redis and sees whether it needs to call the database or not.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 *   - The error object
 * @param res
 *   - The HTTP response object
 * @param replies
 * @param sessionToken
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 * @api private
 */
function callbackFetchSessionRedis(err, res, replies, sessionToken, metaJson, messageFormat, messageName, messageInternal) {  
  'use strict';
  
  if (!err) {
    if (replies !== undefined && replies !== null && typeof(replies) === 'string') {
      try {
        var sessionData = {};
        sessionData = JSON.parse(replies);
        return butrApiInternalSecurity.checkSecurity(res, metaJson, sessionData, messageFormat, messageName, messageInternal);
      }
      catch(e) {
        // Do nothing.
      }
    }
  }
  
  // If we get here then it's not in cache, so check the database.
  return fetchSessionDatabase(res, metaJson, sessionToken, messageFormat, messageName, messageInternal);
}

/**
 * This is a wrapper function used to make the code more readable.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionToken
 *   - The session token
 * @param callback
 *   - The next function to call when things have worked.
 * @api private
 */
function fetchSessionDatabase(res, metaJson, sessionToken, messageFormat, messageName, messageInternal) {
  'use strict';
  var sqlString = sqlSessionFetch(sessionToken, '');
  
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_NONE, butrConstants.DATABASE_TABLE_NONE, '0', function(err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
    
    callbackFetchSessionDatabase(err, res, jsonResult, metaJson, sessionToken, messageFormat, messageName, messageInternal);
  });
  
  // Store SQL start in meta data
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    if (sqlString !== undefined && sqlString !== null && typeof(sqlString) === 'string') {
      metaJson.sql.queryString.push(sqlString);
      metaJson.sql.start.push(new Date());
      metaJson.sql.isCacheable.push(false);
    }
  }
}

/**
 * This checks the results from the database.
 * @author Damien Whaley <damien@whalebonestuios.com>
 * @param err
 *   - The error object
 * @param res
 *   - The HTTP response object
 * @param replies
 * @param sessionToken
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 * @api private
 */
function callbackFetchSessionDatabase(err, res, jsonResult, metaJson, sessionToken, messageFormat, messageName, messageInternal) {
  'use strict';
  if (jsonResult !== undefined && jsonResult !== null && typeof(jsonResult) === 'object') {
    
    // Store SQL finish in meta data
    if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
      metaJson.sql.finish.push(new Date());
      if (jsonResult.resultFromCache !== undefined && jsonResult.resultFromCache !== null && typeof(jsonResult.resultFromCache) === 'boolean') {
        metaJson.sql.resultFromCache.push(jsonResult.resultFromCache);
      }
      else {
        metaJson.sql.resultFromCache.push(false);
      }
    } 
    
    if (!err) {
      if (jsonResult.rows.length === 1) {
        var sessionData = {};
        
        try {
          sessionData = JSON.parse(jsonResult.rows[0].data);
        }
        catch (e) {
          // Not JSON so save as string, worst case.
          sessionData = jsonResult.rows[0].data;
        }
        
        if (butrDatabase.getNoSqlEngine() === 'redis') {
          // Save the session data
          butrRedis.setKey(sessionToken, JSON.stringify(sessionData));
        }
        
        // Check security to see if session can execute the command.
        return butrApiInternalSecurity.checkSecurity(res, metaJson, sessionData, messageFormat, messageName, messageInternal); 
      }
    }
  }
  
  
  // Store SQL finish in meta data if an authentication error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }
    
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    butrApiJsonError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_SESSION_NOT_FOUND, messageName, sessionToken, metaJson);
  }
  else if(messageFormat === butrConstants.MESSAGE_FORMAT_REST) {
    butrApiRestError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_SESSION_NOT_FOUND, messageName, sessionToken, metaJson);
  }
}

/**
 * This attempts to create a session in the database and then it will also store the results
 * in redis cache.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param res
 * @param apiKey
 * @param apiSecret
 * @param nonce
 * @param method
 * @param username
 * @param password
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 * @api private
 */
function createSession(res, metaJson, apiKey, apiSecret, nonce, method, username, password, messageFormat, messageName, messageInternal) {
  'use strict';
  
  var sqlString = sqlNonceFetch(nonce);
  
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_NONE, butrConstants.DATABASE_TABLE_NONE, '0', function(err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';    
    callbackCreateSession(err, res, jsonResult, metaJson, apiKey, apiSecret, nonce, method, username, password, messageFormat, messageName, messageInternal);
  });
  
  // Store SQL start in meta data
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    if (sqlString !== undefined && sqlString !== null && typeof(sqlString) === 'string') {
      metaJson.sql.queryString.push(sqlString);
      metaJson.sql.start.push(new Date());
      metaJson.sql.isCacheable.push(false);
    }
  }
}

/**
 * This grabs the results of the query to check api registration details
 * @param err
 * @param res
 * @param jsonResult
 * @param apiKey
 * @param apiSecret
 * @param nonce
 * @param method
 * @param username
 * @param password
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 */
function callbackCreateSession(err, res, jsonResult, metaJson, apiKey, apiSecret, nonce, method, username, password, messageFormat, messageName, messageInternal) {
  'use strict';
  
  if (jsonResult !== undefined && jsonResult !== null && typeof(jsonResult) === 'object') {
    
    // Store SQL finish in meta data
    if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
      metaJson.sql.finish.push(new Date());
      if (jsonResult.resultFromCache !== undefined && jsonResult.resultFromCache !== null && typeof(jsonResult.resultFromCache) === 'boolean') {
        metaJson.sql.resultFromCache.push(jsonResult.resultFromCache);
      }
      else {
        metaJson.sql.resultFromCache.push(false);
      }
    } 
    
    if (!err) {
      // now need to check to see if a duplicate nonce was found
      if (jsonResult.rows.length === 1) {
        if (jsonResult.rows[0].nonce_count !== null && jsonResult.rows[0].nonce_count !== undefined) {
          if (parseInt(jsonResult.rows[0].nonce_count, 10) > 0) {
            // Duplicate nonce, so bail out.
            if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {    
              return butrApiJsonError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_DUPLICATE_NONCE, messageName, '', metaJson);
            }
            else if(messageFormat === butrConstants.MESSAGE_FORMAT_REST) {    
              return butrApiRestError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_DUPLICATE_NONCE, messageName, '', metaJson);
            }
          }
        }
      }
      // If we get here then no duplicate nonce found, so OK to proceed.
      return fetchRegistration(res, metaJson, apiKey, apiSecret, nonce, method, username, password, messageFormat, messageName, messageInternal);
    }
  }
  
  // Store SQL finish in meta data if an authentication error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_DUPLICATE_NONCE, messageName, '', metaJson);
  }
  else if(messageFormat === butrConstants.MESSAGE_FORMAT_REST) {
    return butrApiRestError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_DUPLICATE_NONCE, messageName, '', metaJson);
  }

}

/**
 * This this fetches the registration as part of the the session creation process.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param res
 * @param apiKey
 * @param apiSecret
 * @param nonce
 * @param method
 * @param username
 * @param password
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 * @api private
 */
function fetchRegistration(res, metaJson, apiKey, apiSecret, nonce, method, username, password, messageFormat, messageName, messageInternal) {
  'use strict';
  
  var sqlString = sqlRegistrationFetch(apiKey);
  
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_SECURITY_REGISTRATIONS, '0', function(err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';    
    callbackFetchRegistration(err, res, jsonResult, metaJson, apiKey, apiSecret, nonce, method, username, password, messageFormat, messageName, messageInternal);
  });
  
  // Store SQL start in meta data
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    if (sqlString !== undefined && sqlString !== null && typeof(sqlString) === 'string') {
      metaJson.sql.queryString.push(sqlString);
      metaJson.sql.start.push(new Date());
      metaJson.sql.isCacheable.push(true);
    }
  }
}

/**
 * This grabs the results of the query to check api registration details
 * @param err
 * @param res
 * @param jsonResult
 * @param apiKey
 * @param apiSecret
 * @param nonce
 * @param method
 * @param username
 * @param password
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 */
function callbackFetchRegistration(err, res, jsonResult, metaJson, apiKey, apiSecret, nonce, method, username, password, messageFormat, messageName, messageInternal) {
  'use strict';
  
  if (jsonResult !== undefined && jsonResult !== null && typeof(jsonResult) === 'object') {
    
    // Store SQL finish in meta data
    if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
      metaJson.sql.finish.push(new Date());
      if (jsonResult.resultFromCache !== undefined && jsonResult.resultFromCache !== null && typeof(jsonResult.resultFromCache) === 'boolean') {
        metaJson.sql.resultFromCache.push(jsonResult.resultFromCache);
      }
      else {
        metaJson.sql.resultFromCache.push(false);
      }
    } 
    
    if (!err) {
      // now need to check to see if it is OK, and if it is then we need to check api registration details
      if (jsonResult.rows.length === 1) {
        if (jsonResult.rows[0].api_private !== null && jsonResult.rows[0].api_private !== undefined) {
          var myApiSecret = jsonResult.rows[0].api_private;
          
          var myHashedSecret = crypto.createHmac('sha256', nonce).update(myApiSecret).digest('hex');
          
          if (myHashedSecret === apiSecret) {
        	  
        	// Beware! This can make the system unsecure (exposing data unwittingly) if used unwisely.
        	// It is mitigated becuase you still need to provide the API registration to get the message executed.
        	var messagePermission = butrConfig.getMessagePermissions(messageName);
        	if (messagePermission !== undefined && messagePermission !== null && typeof(messagePermission) === 'object') {
        	  for (var i = 0; i < messagePermission.length; i++) {
        	    if (messagePermission[i].unauthenticated === true) {
        		  var emptySession = {token:"",user:{uuid:""},permissions:{}};
        		  return butrApiInternalSecurity.checkSecurity(res, metaJson, emptySession, messageFormat, messageName, messageInternal); 
        	    }
        	  }
        	}
        	  
            //we've got a match, so now check user credentials, then we can create session
            var apiRegistrationUuid = jsonResult.rows[0]._table_uuid;
            return fetchUser(res, metaJson, apiRegistrationUuid, nonce, method, username, password, messageFormat, messageName, messageInternal);
          }
        }
      }
    }
  }
  
  // Store SQL finish in meta data if an authentication error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }
    
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    butrApiJsonError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_REGISTRATION_NOT_FOUND, messageName, '', metaJson);
  }
  else if(messageFormat === butrConstants.MESSAGE_FORMAT_REST) {
    butrApiRestError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_REGISTRATION_NOT_FOUND, messageName, '', metaJson);
  }
}

/**
 * This fetches the user's details based on the username provided.
 * @param res
 * @param nonce
 * @param method
 * @param username
 * @param password
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 */
function fetchUser(res, metaJson, apiRegistrationUuid, nonce, method, username, password, messageFormat, messageName, messageInternal) {
  'use strict';
  
  var sqlString = sqlUserFetch(username, method);
  
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_USER_USERS, '0', function(err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';    
    callbackFetchUser(err, res, jsonResult, metaJson, apiRegistrationUuid, nonce, method, username, password, messageFormat, messageName, messageInternal);
  });
  
  // Store SQL start in meta data
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    if (sqlString !== undefined && sqlString !== null && typeof(sqlString) === 'string') {
      metaJson.sql.queryString.push(sqlString);
      metaJson.sql.start.push(new Date());
      metaJson.sql.isCacheable.push(true);
    }
  }
}

/**
 * This checks the user credentials against those stored in the system.
 * @param err
 * @param res
 * @param jsonResult
 * @param nonce
 * @param method
 * @param username
 * @param password
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 */
function callbackFetchUser(err, res, jsonResult, metaJson, apiRegistrationUuid, nonce, method, username, password, messageFormat, messageName, messageInternal) {
  'use strict';
  
  if (jsonResult !== undefined && jsonResult !== null && typeof(jsonResult) === 'object') {
    
    // Store SQL finish in meta data
    if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
      metaJson.sql.finish.push(new Date());
      if (jsonResult.resultFromCache !== undefined && jsonResult.resultFromCache !== null && typeof(jsonResult.resultFromCache) === 'boolean') {
        metaJson.sql.resultFromCache.push(jsonResult.resultFromCache);
      }
      else {
        metaJson.sql.resultFromCache.push(false);
      }
    } 
    
    if (!err) {
      // now need to check to see if it is OK, and if it is then we need to check username details
      if (jsonResult.rows.length === 1) {
        if (method === butrConstants.AUTHENTICATION_METHOD_LOCAL) {
          var myPassword = jsonResult.rows[0].password;
          
          var myHashedPassword = crypto.createHmac('sha256', nonce).update(myPassword).digest('hex');
        
          if (myHashedPassword === password) {
            // we've got a match, so now check user data and permissions, then we can create session
            var userUuid = jsonResult.rows[0]._table_uuid;

            return fetchUserSessionBasicData(res, metaJson, apiRegistrationUuid, userUuid, nonce, messageFormat, messageName, messageInternal);          
          }
        }
      }
    }
  }
  
  // Store SQL finish in meta data if an authentication error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    butrApiJsonError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_USER_NOT_FOUND, messageName, '', metaJson);
  }
  else if(messageFormat === butrConstants.MESSAGE_FORMAT_REST) {
    butrApiRestError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_USER_NOT_FOUND, messageName, '', metaJson);
  }
}

/**
 * This is the first stage of grabbing the user data
 * @param res
 * @param apiRegistrationUuid
 * @param nonce
 * @param method
 * @param username
 * @param password
 * @param nonce
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 */
function fetchUserSessionBasicData(res, metaJson, apiRegistrationUuid, userUuid, nonce, messageFormat, messageName, messageInternal) {
  'use strict';
  
  var sqlString = sqlUserSessionBasicDataFetch(userUuid);
  
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_USER_USERS, userUuid, function(err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';    
    callbackFetchUserSessionBasicData(err, res, jsonResult, metaJson, apiRegistrationUuid, nonce, messageFormat, messageName, messageInternal);
  });
  
  // Store SQL start in meta data
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    if (sqlString !== undefined && sqlString !== null && typeof(sqlString) === 'string') {
      metaJson.sql.queryString.push(sqlString);
      metaJson.sql.start.push(new Date());
      metaJson.sql.isCacheable.push(true);
    }
  }
}

/**
 * This grabs the basic user data and starts building the session data.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 * @param res
 * @param jsonResult
 * @param apiRegistrationUuid
 * @param nonce
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 * @api private
 */
function callbackFetchUserSessionBasicData(err, res, jsonResult, metaJson, apiRegistrationUuid, nonce, messageFormat, messageName, messageInternal) {
  'use strict';
  
  if (jsonResult !== undefined && jsonResult !== null && typeof(jsonResult) === 'object') {

    // Store SQL finish in meta data
    if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
      metaJson.sql.finish.push(new Date());
      if (jsonResult.resultFromCache !== undefined && jsonResult.resultFromCache !== null && typeof(jsonResult.resultFromCache) === 'boolean') {
        metaJson.sql.resultFromCache.push(jsonResult.resultFromCache);
      }
      else {
        metaJson.sql.resultFromCache.push(false);
      }
    } 
    
    if (!err) {
      // Start building up the data object to store the session data.
      if (jsonResult.rows.length === 1) {
        var data = {};
        data.user = {};
        data.permissions = new Array();
        data.modules = new Array();
        data.user.full_name = jsonResult.rows[0].title+' '+jsonResult.rows[0].first_name+' '+jsonResult.rows[0].last_name;
        data.user.first_name = jsonResult.rows[0].first_name;
        data.user.id = jsonResult.rows[0]._table_id;
        data.user.uuid = jsonResult.rows[0]._table_uuid;
        data.language = jsonResult.rows[0].language_code;
        
        return fetchUserSessionPermissionData(res, data, metaJson, apiRegistrationUuid, nonce, messageFormat, messageName, messageInternal);
      }
    }
  }
  
  // Store SQL finish in meta data if an authentication error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache = false;
  }
    
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    butrApiJsonError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_USER_NOT_FOUND, messageName, '', metaJson);
  }
  else if(messageFormat === butrConstants.MESSAGE_FORMAT_REST) {
    butrApiRestError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_USER_NOT_FOUND, messageName, '', metaJson);
  }
}

/**
 * This is the second stage of grabbing the user data
 * @param res
 * @param data
 * @param apiRegistrationUuid
 * @param nonce
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 */
function fetchUserSessionPermissionData(res, data, metaJson, apiRegistrationUuid, nonce, messageFormat, messageName, messageInternal) {
  'use strict';

  var userUuid = '';
  if (data !== undefined && data !== null && typeof(data) === 'object') {
    if (data.user !== undefined && data.user !== null && typeof(data.user) === 'object') {
      if (data.user.uuid !== null && data.user.uuid !== undefined) {
        userUuid = data.user.uuid;
      }
    }
  }
  
  var sqlString = sqlUserSessionPermissionDataFetch(userUuid);
  
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_USER_USERS, userUuid, function(err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';    
    callbackFetchUserPermissionData(err, res, jsonResult, data, metaJson, apiRegistrationUuid, nonce, messageFormat, messageName, messageInternal);
  });
  
  // Store SQL start in meta data
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    if (sqlString !== undefined && sqlString !== null && typeof(sqlString) === 'string') {
      metaJson.sql.queryString.push(sqlString);
      metaJson.sql.start.push(new Date());
      metaJson.sql.isCacheable.push(true);
    }
  }
}

/**
 * This grabs the permission user data and constinues building the session data.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 * @param res
 * @param jsonResult
 * @param apiRegistrationId
 * @param nonce
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 * @api private
 */
function callbackFetchUserPermissionData(err, res, jsonResult, data, metaJson, apiRegistrationUuid, nonce, messageFormat, messageName, messageInternal) {
  'use strict';
  
  if (jsonResult !== undefined && jsonResult !== null && typeof(jsonResult) === 'object') {
    
    // Store SQL finish in meta data
    if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
      metaJson.sql.finish.push(new Date());
      if (jsonResult.resultFromCache !== undefined && jsonResult.resultFromCache !== null && typeof(jsonResult.resultFromCache) === 'boolean') {
        metaJson.sql.resultFromCache.push(jsonResult.resultFromCache);
      }
      else {
        metaJson.sql.resultFromCache.push(false);
      }
    } 
    
    if (!err) {
      // Continue building up the data object to store the session data.
      if (jsonResult.rows.length > 0) {
        if (data !== undefined && data !== null && typeof(data) === 'object') {          
          if (data.permissions !== undefined && data.permissions !== null && typeof(data.permissions) === 'object') {
            var permissionJson = {};
            
            for (var i = 0; i < jsonResult.rows.length; i++) { 
              permissionJson = {};
              permissionJson.partition = jsonResult.rows[i].partitions_uuid;
              permissionJson.permission = jsonResult.rows[i].magic;
              data.permissions.push(permissionJson);
            }
          }
        }
      }
    }
  }
  else {
    // Store SQL finish in meta data if an error
    if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
      metaJson.sql.finish.push(new Date());
      metaJson.sql.resultFromCache.push(false);
    }
  }
  
  fetchUserSessionModuleData(res, data, metaJson, apiRegistrationUuid,
    nonce, messageFormat, messageName, messageInternal);
}

/**
 * This is the third stage of grabbing the user data
 * @param res
 * @param data
 * @param apiRegistrationUuid
 * @param nonce
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 */
function fetchUserSessionModuleData(res, data, metaJson, apiRegistrationUuid, nonce, messageFormat, messageName, messageInternal) {
  'use strict';

  var userUuid = '';
  if (data !== undefined && data !== null && typeof(data) === 'object') {
    if (data.user !== undefined && data.user !== null && typeof(data.user) === 'object') {
      if (data.user.uuid !== null && data.user.uuid !== undefined) {
        userUuid = data.user.uuid;
      }
    }
  }
  
  var sqlString = sqlUserSessionModuleDataFetch(userUuid);
  
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_USER_USERS, userUuid, function(err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';    
    callbackFetchUserModuleData(err, res, jsonResult, data, metaJson, apiRegistrationUuid, nonce, messageFormat, messageName, messageInternal);
  });
  
  // Store SQL start in meta data
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    if (sqlString !== undefined && sqlString !== null && typeof(sqlString) === 'string') {
      metaJson.sql.queryString.push(sqlString);
      metaJson.sql.start.push(new Date());
      metaJson.sql.isCacheable.push(true);
    }
  }
}

/**
 * This grabs the module user data and constinues building the session data.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 * @param res
 * @param jsonResult
 * @param apiRegistrationId
 * @param nonce
 * @param messageFormat
 * @param messageName
 * @param messageInternal
 * @api private
 */
function callbackFetchUserModuleData(err, res, jsonResult, data, metaJson, apiRegistrationUuid, nonce, messageFormat, messageName, messageInternal) {
  'use strict';
  
  if (jsonResult !== undefined && jsonResult !== null && typeof(jsonResult) === 'object') {
    
    // Store SQL finish in meta data
    if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
      metaJson.sql.finish.push(new Date());
      if (jsonResult.resultFromCache !== undefined && jsonResult.resultFromCache !== null && typeof(jsonResult.resultFromCache) === 'boolean') {
        metaJson.sql.resultFromCache.push(jsonResult.resultFromCache);
      }
      else {
        metaJson.sql.resultFromCache.push(false);
      }
    } 
    
    if (!err) {
      // Continue building up the data object to store the session data.
      if (jsonResult.rows.length > 0) {
        if (data !== undefined && data !== null && typeof(data) === 'object') {          
          if (data.modules !== undefined && data.modules !== null && typeof(data.modules) === 'object') {
            var moduleJson = {};
            
            for (var i = 0; i < jsonResult.rows.length; i++) { 
              moduleJson = {};
              moduleJson.module = jsonResult.rows[i].module_uuid;
              moduleJson.name = jsonResult.rows[i].module_name;
              data.modules.push(moduleJson);
            }
          }
        }
      }
    }
  }
  else {
    // Store SQL finish in meta data if an error
    if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
      metaJson.sql.finish.push(new Date());
      metaJson.sql.resultFromCache.push(false);
    }
  }
  
  // Create session uuid
  var sessionToken = uuid.v4();
  
  var userUuid = '';
  if (data !== undefined && data !== null && typeof(data) === 'object') {
    data.session_token = sessionToken;
    if (data.user !== undefined && data.user !== null && typeof(data.user) === 'object') {
      if (data.user.uuid !== undefined && data.user.uuid !== null) {
        userUuid = data.user.uuid;
      }
    }
    
    var sessionTimeout = butrConfig.getGlobalSetting('session_timeout');
    if (sessionTimeout === undefined || sessionTimeout === null || isNaN(sessionTimeout)) {
      sessionTimeout = 20;
    }
    var sessionExpiry = moment.utc().add('minutes', sessionTimeout);
    data.expiry = sessionExpiry.format('YYYY-MM-DD HH:mm:ss');
  }
  
  var stringifiedData = JSON.stringify(data);
  
  if (butrDatabase.getNoSqlEngine() === 'redis') {
    // Save the key to redis
    butrRedis.setKey(sessionToken, stringifiedData);
  }
  
  var sqlString = sqlCreateUserSession(sessionToken, userUuid, apiRegistrationUuid, nonce, stringifiedData, data.language);
  
  // Save the session in the database
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_NONE, butrConstants.DATABASE_TABLE_NONE, '0', function (err, tableName, uuid, sqlQuery, jsonResult) {
      'use strict';
      
      callbackCreateUserSession(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, data, messageFormat, messageName, messageInternal);
  });
  
  // Store SQL start in meta data
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    if (sqlString !== undefined && sqlString !== null && typeof(sqlString) === 'string') {
      metaJson.sql.queryString.push(sqlString);
      metaJson.sql.start.push(new Date());
      metaJson.sql.isCacheable.push(false);
    }
  }
}

/**
 * This checks the results of the insert and logs an error if it did not work.
 * @param err
 * @param tableName
 * @param uuid
 * @param sqlQuery
 * @param jsonResult
 */
function callbackCreateUserSession(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, data, messageFormat, messageName, messageInternal) {
  'use strict';
  
  if (!err) {
    if (jsonResult !== undefined && jsonResult !== null && typeof(jsonResult) === 'object') {
      
      // Store SQL finish in meta data
      if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
        metaJson.sql.finish.push(new Date());
        if (jsonResult.resultFromCache !== undefined && jsonResult.resultFromCache !== null && typeof(jsonResult.resultFromCache) === 'boolean') {
          metaJson.sql.resultFromCache.push(jsonResult.resultFromCache);
        }
        else {
          metaJson.sql.resultFromCache.push(false);
        }
      } 
      
      if (jsonResult.rows.length > 0) {
        if(jsonResult.rows[0].token !== null && jsonResult.rows[0].token !== undefined && jsonResult.rows[0].token !== '') {
          // All good, so call the security check
          return butrApiInternalSecurity.checkSecurity(res, metaJson, data, messageFormat, messageName, messageInternal);
        }
      }
    }
  }
  
  // Store SQL finish in meta data if an authentication error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }
    
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_SESSION_CREATE_FAILED, messageName, '', metaJson);
  }
  else if(messageFormat === butrConstants.MESSAGE_FORMAT_REST) {
    return butrApiRestError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_SESSION_CREATE_FAILED, messageName, '', metaJson);
  }
}

/**
 * This builds the SQL query for fetching the session.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionToken
 *   - The session token being searched on.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlSessionFetch(sessionToken, transactionUuid) {
  'use strict';
  
  if (sessionToken === null || sessionToken === undefined || sessionToken === '') {
    return '';
  }
  
  return "CALL p_security_FetchSession('"+butrDatabase.sanitiseSqlString(sessionToken)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)+"');";
}

/**
 * This builds the SQL query for fetching the API registration details.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param apiKey
 *   - The api key provided
 * @returns string
 *   - Contains the SQL query to be executed.
 * @api private
 */
function sqlRegistrationFetch(apiKey) {
  'use strict';
  
  if (apiKey === null || apiKey === undefined || apiKey === '') {
    return '';
  }
  
  return "CALL p_security_QuickFetchRegistration('"+butrDatabase.sanitiseSqlString(apiKey)+"');";
}

/**
 * This builds the SQL query to fetch the user from the database
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param username
 *   - String containing the username provided.
 * @returns string
 *   - Containing the SQL to be executed.
 * @api private
 */
function sqlUserFetch(username, method) {
  'use strict';
  
  if (username === null || username === undefined || username === '') {
    return '';
  }
  
  var authorisationMethod = '';
  
  switch (method) {
  case butrConstants.AUTHENTICATION_METHOD_LOCAL:
    authorisationMethod = 'local';
    break;
  case butrConstants.AUTHENTICATION_METHOD_FACEBOOK:
    authorisationMethod = 'facebook';
    break;
  case butrConstants.AUTHENTICATION_METHOD_OPENID:
    authorisationMethod = 'openid';
    break;
  case butrConstants.AUTHENTICATION_METHOD_TWITTER:
    authorisationMethod = 'twitter';
    break;
  case butrConstants.AUTHENTICATION_METHOD_GOOGLE:
    authorisationMethod = 'google';
    break;
  default:
    authorisationMethod = '';
    break;
  }
   
  return "CALL p_security_ListUserCredential('"+butrDatabase.sanitiseSqlString(username)
    +"', '"+butrDatabase.sanitiseSqlString(authorisationMethod)+"');";
}

/**
 * This builds the SQL query to create a new user session.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param token
 * @param userUuid
 * @param apiRegistrationUuid
 * @param data
 * @returns string
 *   - Containing the SQL to be executed.
 * @api private
 */
function sqlCreateUserSession(token, userUuid, apiRegistrationUuid, nonce, data, languageCode) {
  'use strict';
  
  if (token === null || token === undefined || token === '') {
    return '';
  }
  if (userUuid === null || userUuid === undefined || userUuid === '') {
    return '';
  }
  if (apiRegistrationUuid === null || apiRegistrationUuid === undefined || apiRegistrationUuid === '') {
    return '';
  }
  if(languageCode === null || languageCode === undefined) {
    languageCode = '';
  }
  
  return "CALL p_security_AddSession('"+butrDatabase.sanitiseSqlString(token)+"', '"
    +butrDatabase.sanitiseSqlString(userUuid)+"', '"
    +butrDatabase.sanitiseSqlString(apiRegistrationUuid)+"', '"
    +butrDatabase.sanitiseSqlString(nonce)+"', '"
    +butrDatabase.sanitiseSqlString(data)+"', '"
    +butrDatabase.sanitiseSqlString(languageCode)+"');";
}

/**
 * This builds the SQL to fetch the basic data to build the users session details.
 * @param userUuid
 *   - UUID containing the id of the user.
 * @returns string
 *   - Contains the SQL to be executed.
 * @api private
 */
function sqlUserSessionBasicDataFetch(userUuid) {
  'use strict';
  
  if (userUuid === null || userUuid === undefined || userUuid === '') {
    return '';
  }
  
  return "CALL p_security_FetchUserSessionBasic('"+butrDatabase.sanitiseSqlString(userUuid)+"');";
}

/**
 * This builds the SQL to fetch the permission data to build the users session details.
 * @param userUuid
 *   - UUID containing the id of the user.
 * @returns string
 *   - Contains the SQL to be executed.
 * @api private
 */
function sqlUserSessionPermissionDataFetch(userUuid) {
  'use strict';
  
  if (userUuid === null || userUuid === undefined || userUuid === '') {
    return '';
  }
  
  return "CALL p_security_ListUserSessionPermission('"+butrDatabase.sanitiseSqlString(userUuid)+"')";
}

/**
 * This builds the SQL to fetch the module data to build the users session details.
 * @param userUuid
 *   - UUID containing the id of the user.
 * @returns string
 *   - Contains the SQL to be executed.
 * @api private
 */
function sqlUserSessionModuleDataFetch(userUuid) {
  'use strict';
  
  if (userUuid === null || userUuid === undefined || userUuid === '') {
    return '';
  }
  
  return "CALL p_security_ListUserSessionModule('"+butrDatabase.sanitiseSqlString(userUuid)+"')";
}

/**
 * This builds the SQL to fetch the nonce to see if a duplicate has been used.
 * @param userUuid
 *   - UUID containing the id of the user.
 * @returns string
 *   - Contains the SQL to be executed.
 * @api private
 */
function sqlNonceFetch(nonceUuid) {
  'use strict';
  
  if (nonceUuid === null || nonceUuid === undefined || nonceUuid === '') {
    return '';
  }
  
  return "CALL p_security_FetchNonce('"+butrDatabase.sanitiseSqlString(nonceUuid)+"');";
}

/**
 * Module exports.
 */
module.exports.checkAuthentication = checkAuthentication;