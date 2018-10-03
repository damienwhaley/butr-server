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
 * Contributed module Dependencies
 */
var _memcached = require('memcached');
var crypto = require('crypto');
var i18n = require('i18n');

/**
 * Butr module dependencies.
 */
var butrConstants = require('./butr-constants');
var butrLog = require('./butr-log');
var butrError = require('./butr-error');

/**
 * Module Variables
 * Data structures are:
 * Key Manager = tableNname -> uuid -> [query, hash]
 * Query Manager = query -> [tableName, uuid, hash]
 */
var _memcachedConnection = {};
var _memcachedKeyManager = [];
var _memcachedQueryManager = [];
var _memcachedLifetime = 300;

/**
 * This is the main configuration for the memcached module
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param memcachedHost
 *   - String containing the address of the host
 * @api public
 */
function configure(memcachedHost, lifetime) {
  'use strict';
  if (lifetime !== undefined && lifetime !== null && !isNaN(lifetime)) {
    _memcachedLifetime = lifetime;
  }
  
  _memcachedConnection = new _memcached(memcachedHost);
 
  _memcachedConnection.on('failure', function(err, result) {
    'use strict';
    
    butrError.logError(err, butrConstants.LOG_LEVEL_WARNING, i18n.__('Cache Memcached error '));
  });
  _memcachedConnection.on( 'issue', function(err, result) {
    'use strict';
    
    butrError.logError(err, butrConstants.LOG_LEVEL_WARNING, i18n.__('Cache Memcached issue '));
  });

  for(var i = 0; i < butrConstants.DATABASE_TABLECOUNT; i++) {
    _memcachedKeyManager[i] = [];
  }
}

/**
 * This closes the memcached connection.
 * @author Damien Whaley <damien@damienwhaley.com>
 * @api public
 */
function close() {
  'use strict';
  
  if (_memcachedConnection !== undefined && _memcachedConnection !== null && typeof(_memcachedConnection) !== 'undefined') {
    _memcachedConnection.end();
  }
}

/**
 * Attempts to fetch the query results from memcached
 * @author Damien Whaley <damien@damienwhaley.com>
 * @param sqlQuery
 *   - The SQL query to fetch the results from.
 * @param tableName
 *   - The table name to check to fetch the results for.
 * @param uuid
 *   - The UUID for the record for the results to fetch.
 * @param callback
 *   - callback function to call when results arrive.
 * @param finalCallback
 *   - the eventual callback to call when all processing is done
 * @api public
 */
function fetchKey(sqlQuery, tableName, uuid, callback, finalCallback) {
  'use strict';
  
  var key = generateHash(sqlQuery);
  
  _memcachedConnection.get(key, function(err, result) {
    'use strict';
    
    if (!result || err) {
      butrError.logError(err, butrConstants.LOG_LEVEL_WARNING, i18n.__('Cache Memcached could not find key %s: %s', key, sqlQuery)); 
      result = null;
    }
    else {
      if (result !== undefined && result !== null && typeof(result) === 'string') {
    	try {
          result = JSON.parse(result);
    	}
    	catch (e) {
    	  // Do nothing
    	}
      }
      if (result !== undefined && result !== null && typeof(result) === 'object' && Object.keys(result).length > 0) {
        // Inject results from cache if the result is an object.
        if (result.resultFromCache !== undefined && result.resultFromCache !== null) {
          result.resultFromCache = true;
        }
      } else {
        result = null;
      }
    }
    if (callback !== null && callback !== undefined && typeof(callback) === 'function') {
      return callback(err, result, sqlQuery, tableName, uuid, finalCallback);
    }
  });
}

/**
 * This saves the key into memcached, and also sticks it in the management tables. 300 seconds lifetime.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 *   - Object containing the error object.
 * @param tableName
 *   - The constant holding the table identifier.
 * @param uuid
 *   - The UUID of the record to save.
 * @param sqlQuery
 *   - The SQL Query which was used to generate the results.
 * @param data
 *   - The results data to cache.
 * @api public
 */
function setKey(err, tableName, uuid, sqlQuery, data) {
  'use strict';
  
  var key = generateHash(sqlQuery);
  var saveData = '';
  if (data !== undefined && data !== null) {
    if (typeof(data) === 'object' && (Object.keys(data).length > 0 || data.length > 0)) {
      if (data.rows !== undefined && data.rows !== null && data.rows.length > 0) {
        try {
          saveData = JSON.stringify(data);
        }
        catch (e) {
          saveData = data;
        }
      }
      else {
        // No rows returned so don't cache this!
        saveData = '';
      }
      if (saveData === '[]' || saveData === '{}') {
      	saveData = '';
      }
    }
    else if (typeof(data) === 'string' && data !== '') {
      saveData = data;
    }
  }
  if (saveData === '') {
    return;
  }

  _memcachedConnection.set(key, saveData, _memcachedLifetime, function(err, result) {
    'use strict';

    if (!result || err) {
      return butrError.logError(err, butrConstants.LOG_LEVEL_WARNING, i18n.__('Cache Memcached could not save key %s: %s', key, sqlQuery));
    }    
    addEntry(tableName, uuid, new Array(sqlQuery, key));
  });
}

/**
 * This removes a key from the underlying memcached and from the mangement
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sqlQuery
 *   - the SQL query to remove from the cache.
 * @api public
 */
function deleteKey(sqlQuery) {
  'use strict';
  
  var key = generateHash(sqlQuery);
  _memcachedConnection.del(key, function(err, result) {
    'use strict';
    
    var toRemove = findKeyByQuery(sqlQuery);
    if (toRemove !== undefined && toRemove !== null) {
      for (var i = 0; i < toRemove.length; i++) {
        removeEntry(toRemove[i][0], toRemove[i][1]);
      }
    }
    
    if (!result || err) {
      return butrError.logError(err, butrConstants.LOG_LEVEL_WARNING, i18n.__('Cache Memcached could not delete key %s: %s', key, sqlQuery));
    }
  });
}

/**
 * This creates a hash for the query this is used for finding the results in memcached.
 * It strips out the placeholder tokens which could cause the query to be too specific
 * as in it belongs only to a transaction which would mean that the cache is not
 * really being used properly.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sqlQuery
 *   - The SQL query to generate a hashed key on.
 * @returns string
 *   - containing the hex encoded hash
 * @api private
 */
function generateHash(sqlQuery) {
  'use strict';
  
  var hash = '';
  if (sqlQuery !== undefined && sqlQuery !== null && sqlQuery !== '') {
    var queryParts = sqlQuery.split(',');
    var endStatement;

    for (var i = 0; i < queryParts.length; i++) {
      if (queryParts[i].length > 14) {
        endStatement = false;
        if (queryParts[i].indexOf('@i_SessionUuid=') >= 0) {
          if (queryParts[i].substring(queryParts[i].length-2) === ');') {
            endStatement = true;
          }
          queryParts[i] = queryParts[i].substring(0, queryParts[i].indexOf('@i_SessionUuid='));
          queryParts[i] += '@i_SessionUuid';
          if (endStatement === true) {
            queryParts[i] += ');';
          }
        }
        else if (queryParts[i].indexOf('@i_TransactionUuid=') >= 0) {
          if (queryParts[i].substring(queryParts[i].length-2) === ');') {
            endStatement = true;
          }
          queryParts[i] = queryParts[i].substring(0, queryParts[i].indexOf('@i_TransactionUuid='));
          queryParts[i] += '@i_TransactionUuid';
          if (endStatement === true) {
            queryParts[i] += ');';
          }
        }
      }
    }

    var sqlQueryCleaned = queryParts.join(',');
    
    hash = crypto.createHash('sha1').update(sqlQueryCleaned).digest('hex');
  }
  return hash;
}

/**
 * This adds an entry to the key manager for the given table name and uuid
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param tableName
 *   - The constant containing the table to be cached.
 * @param uuid
 *   - The UUID of the record to be cached.
 * @param value
 *   - Array containing SQL Query, memcached key, expiry time
 * @api private
 */
function addEntry(tableName, uuid, value) {
  'use strict';
  
  if (uuid === undefined || uuid === null || uuid === '') {
	// No record to store
	return;
  }
  
  if (value === undefined || value === null) {
	// No query to store
	return;
  }
  
  if (tableName === undefined || tableName === null) {
	tableName = butrConstants.DATABASE_TABLE_NONE;
  }
  
  if (_memcachedKeyManager[tableName][uuid] === undefined
    || _memcachedKeyManager[tableName][uuid] === null) {
    _memcachedKeyManager[tableName][uuid] = [];
  }
  
  _memcachedKeyManager[tableName][uuid].push(value);
  
  if (typeof(_memcachedQueryManager[value[0]]) === 'undefined') {
    _memcachedQueryManager[value[0]] = [];
  }
  _memcachedQueryManager[value[0]].push(new Array(tableName, uuid, value[2]));
}

/**
 * This finds all entries for a given table name and uuid
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param tableName
 *   - The constant for referencing the the table to be cached.
 * @param uuid
 *   - The UUID of the record to be cached.
 * @returns array
 *   - containing the details for the entry.
 * @api private
 */
function findEntry(tableName, uuid) {
  'use strict';
  if (typeof(_memcachedKeyManager[tableName][uuid]) === 'undefined') {
    return null;
  } else {
    return _memcachedKeyManager[tableName][uuid];
  }
}

/**
 * This removes all entries for a given table name and uuid
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param tableName
 *   - The constants continaing the table identifier
 * @param uuid
 *   - The UUID of the record to be removed in the cache.
 * @api private
 */
function removeEntry(tableName, uuid) {
  'use strict';
  if (_memcachedKeyManager[tableName][uuid] !== 'undefined') {
    var entries = findEntry(tableName, uuid);
    if (entries !== undefined && entries !== null && typeof(entries) === 'object') {
      for (var i = 0; i < entries.length; i++) {
        if (_memcachedQueryManager[entries[0]] !== undefined
          && _memcachedQueryManager[entries[0]] !== null
          && typeof(_memcachedQueryManager[entries[0]]) !== 'undefined') {
          _memcachedQueryManager[entries[0]] = undefined;
        }
      }
    }
    _memcachedKeyManager[tableName][uuid] = undefined;
  }
}

/**
 * This returns the memcached key for the given query.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param tableName
 *   - The constant containing the table identifier.
 * @param uuid
 *   - The UUID for the record in the cache.
 * @param query
 *   - The SQL query which was executed to produce the results.
 * @returns string
 *   - containing the memcached key
 * @api private
 */
function findKeyByTable(tableName, uuid, query) {
  'use strict';
  
  var entries = findEntry(tableName, uuid);
  if (entries !== undefined && entries !== null && typeof(entries) === 'object') {
    for (var i = 0; i < entries.length; i++) {
      if (entries[0] === query) {
        return entries[1];
      }
    }
  }
  return null;
}

/**
 * This finds the hash by query
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sqlQuery
 *   - The SQL query executed to produce the results.
 * @returns string
 *   - containing the memcached key
 * @api private
 */
function findKeyByQuery(sqlQuery) {
  'use strict';
  
  if (_memcachedQueryManager[sqlQuery] === undefined
    || _memcachedQueryManager[sqlQuery] === null) {
    return [];
  } else {
    return _memcachedQueryManager[sqlQuery][2];
  }
}

/**
 * This finds all the keys which refer to the table record and purges them
 * from the cache.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param tableName
 *   - The constant containing the table identifier.
 * @param uuid
 *   - The UUID for the record in the cache.
 * @api public
 */
function purgeRecord(tableName, uuid) {
  'use strict';
  
  if (uuid !== undefined && uuid !== null && uuid !== '' && uuid !== '0') {
    // A specific record in a table
    var entries = findKeyByTable(tableName, uuid);
    if (entries !== undefined && entries !== null && typeof(entries) === 'object') {
      for (var i = 0; i < entries.length; i++) {
        deleteKey(entries[i][0]);
      }
    }
  }
  else if (uuid !== undefined && uuid !== null && uuid === '0') {
    // All records in a table
	if (_memcachedKeyManager[tableName] !== undefined && _memcachedKeyManager[tableName] !== null) {
      for (var j = 0; j < _memcachedKeyManager[tableName].length; j++) {
        purgeRecord(tableName, _memcachedKeyManager[tableName][j]);
      }
	}
  }
}

/**
 * Module exports
 */
module.exports.configure = configure;
module.exports.close = close;
module.exports.fetchKey = fetchKey;
module.exports.setKey = setKey;
module.exports.deleteKey = deleteKey;
module.exports.purgeRecord = purgeRecord;