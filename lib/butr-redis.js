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

// TODO: fetchHashKeys

/**
 * Contributed module dependencies
 */
var _redis = require('redis');
var i18n = require('i18n');

/**
 * Butr module dependencies.
 */
var butrError = require('./butr-error');
var butrConstants = require('./butr-constants');

/**
 * Module variables
 */
var _redisConnection = {};

/**
 * This is the main configuration for the redis module.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param port
 *   - Integer containing the port redis is listening on
 * @param host
 *   - String containing the address of the host
 * @api public
 */
function configure(port, host) {
  'use strict';
  
  _redisConnection = _redis.createClient(parseInt(port, 10), host);
  _redisConnection.on('error', function (err) {
    'use strict';

    butrError.logError(err, butrConstants.LOG_LEVEL_WARNING, i18n.__('NoSQL Redis error '));
  });
}

/**
 * This closes the redis connection
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @api public
 */
function close() {
  'use strict';
  
  _redisConnection.quit();
}

/**
 * This sets a key in the redis store.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param key
 * @param data
 * @api public
 */
function setKey(key, data) {
  'use strict';
  
  if (data !== undefined && data !== null && typeof(data) === 'string'
    && key !== undefined && key !== null && typeof(key) === 'string') {
    _redisConnection.set(key, data);
  }
}

/**
 * This fetches a key from the redis store.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param key
 * @param callback
 * @param finalCallback
 * @api public
 */
function fetchKey(key, callback, finalCallback) {
  'use strict';
  
  if (key !== undefined && key !== null && typeof(key) === 'string') {
    _redisConnection.get(key, function(err, replies) {
      'use strict';
      
      if (err || !replies) {
        butrError.logError(err, butrConstants.LOG_LEVEL_WARNING, i18n.__('NoSQL Redis could not find key %s', key));
      }
      if (callback !== undefined && callback !== null && typeof(callback) === 'function') {
        return callback(err, replies, key, finalCallback);
      }
    });
  }
  else {
    if (callback !== undefined && callback !== null && typeof(callback) === 'function') {
      return callback(err, null, key, finalCallback);
    }
  }
}

/**
 * This deletes a key in the redis store.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param key
 * @param data
 * @api public
 */
function deleteKey(key) {
  'use strict';
  
  if (key !== undefined && key !== null && typeof(key) === 'string') {
    _redisConnection.del(key);
  }
}

/**
 * Module exports
 */
module.exports.configure = configure;
module.exports.close = close;
module.exports.setKey = setKey;
module.exports.fetchKey = fetchKey;
module.exports.deleteKey = deleteKey;