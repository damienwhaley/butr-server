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
var moment = require('moment');

/**
 * Butr module dependencies
 */
var butrConstants = require('./butr-constants');
var butrError = require('./butr-error');
var butrMemcached = require('./butr-memcached');
var butrMysql = require('./butr-mysql');
var butrRedis = require('./butr-redis');

/**
 * Module variables.
 */
var _appSettings;

/**
 * Configures the database connections.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param appSettings
 * @api public
 */

function configureDatabase(appSettings) {
  'use strict';
  _appSettings = appSettings;

  if (_appSettings.Sql.Engine === 'mysql') {
    butrMysql.configure(_appSettings.Sql.User, _appSettings.Sql.Pass,
      _appSettings.Sql.Name, _appSettings.Sql.Host, _appSettings.Sql.Port);
  }

  if (_appSettings.NoSql.Engine === 'redis') {
    butrRedis.configure(parseInt(_appSettings.NoSql.Port, 10), _appSettings.NoSql.Host);

  }

  if (_appSettings.Cache.Engine === 'memcached') {
    var memcachedHost = new Array(_appSettings.Cache.Host+':'+_appSettings.Cache.Port);
    butrMemcached.configure(memcachedHost, _appSettings.Cache.Lifetime);
  }
};

/**
 * This executes the query against the database and returns the results in an object (to be determined)
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sqlQuery
 * @param cacheType
 *   - the type of caching for the query
 * @param tableName
 *   - the name of the main table the query relates to
 * @param uuid
 *   - the unique identifier for the table the query relates to *
 * @param callback
 *   - function to call once results have been obtained.
 * @api public
 */
function executeSqlQuery(sqlQuery, cacheType, tableName, uuid, callback) {
  'use strict';

  if (sqlQuery === undefined || sqlQuery === null || typeof(sqlQuery) !== 'string' || sqlQuery === '') {
    // Nothing to do, so return error.
    return callback(new Error(i18n.__('No query to execute')), tableName, uuid, sqlQuery, {});
  }

  if (cacheType === butrConstants.DATABASE_CACHE_MEMCACHED_PURGE && _appSettings.Cache.Engine === 'memcached') {
    // Delete key from cache and then continue on as a regular stored procedure transaction
    butrMemcached.deleteKey(sqlQuery);
    butrMemcached.purgeRecord(tableName, uuid);
  }

  if (cacheType === butrConstants.DATABASE_CACHE_MEMCACHED_STORE && _appSettings.Cache.Engine === 'memcached') {
    return butrMemcached.fetchKey(sqlQuery, tableName, uuid, callbackMemcached, callback);
  }
  else {
    if (_appSettings.Sql.Engine === 'mysql') {
      return butrMysql.executeQuery(sqlQuery, tableName, uuid, callbackSql, callback);
    }
  }
};

/**
 * This closes all the database connections
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @api public
 */
function databaseClose() {
  'use strict';
  if (_appSettings.Sql.Engine === 'mysql') {
    butrMysql.close();
  }

  if (_appSettings.NoSql.Engine === 'redis') {
    butrRedis.close();
  }

  if (_appSettings.Cache.Engine === 'memcached') {
    butrMemcached.close();
  }
};

/**
 * This checks to see if the results have been obtained. If they have not query database and save result.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 * @param result
 * @param sqlQuery
 * @param tableName
 * @param uuid
 * @param callback
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @api private
 */
function callbackMemcached(err, result, sqlQuery, tableName, uuid, callback, finalCallback) {
  'use strict';
  if (result !== undefined && result !== null && typeof(result) === 'object') {
    if (callback !== undefined && callback !== null && typeof(callback) === 'function') {
      return callback(err, tableName, uuid, sqlQuery, result);
    }
  }
  if (_appSettings.Sql.Engine === 'mysql') {
    return butrMysql.executeQuery(sqlQuery, tableName, uuid, callbackMemcachedSql, callback, finalCallback);
  }
}

/**
 * This takes the results of the query and passes the results to the callback
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 * @param rows
 * @param fields
 * @param sqlQuery
 * @param tableName
 * @param uuid
 * @param callback
 * @param finalCallback
 * @api public
 */
function callbackSql(err, rows, fields, sqlQuery, tableName, uuid, callback) {
  'use strict';
  if (_appSettings.Sql.Engine === 'mysql') {
    butrMysql.internaliseResult(err, rows, fields, sqlQuery, tableName, uuid, callback, undefined);
  }
}

/**
 * This calls the query and also stores the query results
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 * @param rows
 * @param fields
 * @param sqlQuery
 * @param tableName
 * @param uuid
 * @param callback
 * @param finalCallback
 * @api private
 */
function callbackMemcachedSql(err, rows, fields, sqlQuery, tableName, uuid, callback) {
  'use strict';
  if (_appSettings.Sql.Engine === 'mysql') {

    // If the provided uuid is not valid and there's a single row in the results
    // and there's a _table_uuid field, then use that for the uuid instead.
    if (uuid === null || uuid === undefined || uuid === '' || uuid === '0') {
      if (rows !== undefined && rows !== null) {
        if (rows.length === 1) {
          if(rows._table_uuid !== undefined && rows._table_uuid !== null) {
            uuid = rows._table_uuid;
          }
        }
      }
    }

    if (_appSettings.Sql.Engine === 'mysql') {
      butrMysql.internaliseResult(err, rows, fields, sqlQuery, tableName, uuid, callback, butrMemcached.setKey);
    }
  }
}

/**
 * This returns the engine used for caching.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @returns string
 *   - containing engine name
 * @api public
 */
function getCacheEngine() {
  'use strict';
  return _appSettings.Cache.Engine;
};

/**
 * This returns the engine used for sql storage.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @returns string
 *   - containing engine name
 * @api public
 */
function getSqlEngine() {
  'use strict';
  return _appSettings.Sql.Engine;
};

/**
 * This returns the engine used for nosql storage lookups.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @returns string
 *  - containing engine name
 * @api public
 */
function getNoSqlEngine() {
  'use strict';
  return _appSettings.NoSql.Engine;
};

/**
 * This sanitises the SQL string parameters to stop injection attacks
 * @param sqlString
 *   - The string to be sanitised
 * @returns string
 *   - Containing the sanitised output
 */
function sanitiseSqlString(sqlString) {
  'use strict';
  var sanitised = '';

  if (sqlString !== undefined && sqlString !== null) {
    if(typeof(sqlString) !== 'string') {
      sqlString = sqlString.toString();
    }

    if (_appSettings.Sql.Engine === 'mysql') {
      sanitised = butrMysql.sanitiseString(sqlString);
    }
    else {
      // Escape the single quotes as a basic defence against injection.
      sanitised = sqlString.replace(/\'/g, '\\\'');
    }
  }
  return sanitised;
}

/**
 * This sanitises the integer and assigns a default value if the passed integer is not valid.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sqlInteger
 *   - integer to be sanitised.
 * @param invalidValue
 *   - value to be applied if the sanitised value is not valid.
 * @returns
 *   - string containing the SQL safe value.
 * @api public
 */
function sanitiseSqlInteger(sqlInteger, invalidValue) {
  'use strict';
  var sanitised = '';

  if (sqlInteger === undefined || sqlInteger === null || isNaN(sqlInteger) || sqlInteger === '') {
    if (invalidValue === undefined || invalidValue === null || isNaN(invalidValue)) {
      sanitised = 'NULL';
    }
    else {
      sanitised = Math.floor(invalidValue).toString(10);
    }
  }
  else {
    sanitised = Math.floor(sqlInteger).toString(10);
  }

  return sanitised;
}

/**
 * This sanitises the float and assigns a default value if the passed integer is not valid.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sqlFloat
 *   - float to be sanitised.
 * @param invalidValue
 *   - value to be applied if the sanitised value is not valid.
 * @returns
 *   - string containing the SQL safe value.
 * @api public
 */
function sanitiseSqlFloat(sqlFloat, invalidValue) {
  'use strict';
  var sanitised = '';

  if (sqlFloat === undefined || sqlFloat === null || isNaN(sqlFloat) || sqlFloat === '') {
    if (invalidValue === undefined || invalidValue === null || isNaN(invalidValue)) {
      sanitised = 'NULL';
    }
    else {
      sanitised = parseFloat(invalidValue).toString();
    }
  }
  else {
    sanitised = parseFloat(sqlFloat).toString();
  }

  return sanitised;
}

/**
 * This sanitises the boolean and returns false if it is invalid.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sqlInteger
 *   - integer to be sanitised.
 * @returns
 *   - string containing the SQL safe value.
 * @api public
 */
function sanitiseSqlBoolean(sqlBoolean) {
  'use strict';
  var sanitised = '0';

  if (sqlBoolean !== undefined && sqlBoolean !== null) {
    if (typeof(sqlBoolean) === 'boolean') {
     // Try obvious correct type first.
      if (sqlBoolean === true) {
        sanitised = '1';
      }
    }
    else if (typeof(sqlBoolean) === 'string') {
      // Try string eqivalent next
      if (sqlBoolean === 'true' || sqlBoolean === '1' || sqlBoolean === 'yes') {
        sanitised = '1';
      }
    }
    else if (typeof(sqlBoolean) === 'number') {
      // Try number equivalent next
      if (sqlBoolean === 1) {
        sanitised = '1';
      }
    }
  }

  return sanitised;
}

/**
 * This sanitises the SQL date parameters to stop injection attacks
 * @param sqlDate
 *   - The date to be sanitised
 * @param asUtc
 *   - boolean indicating that the date should be a utc date equivalent.
 * @returns string
 *   - Containing the sanitised output
 */
function sanitiseSqlDate(sqlDate, asUtc) {
  'use strict';
  var sanitised = 'NULL';

  if (sqlDate !== undefined && sqlDate !== null) {
    var correctDate = moment(sqlDate);

    if (correctDate !== undefined && correctDate !== null && !isNaN(correctDate.valueOf())) {
      if (asUtc !== undefined && asUtc !== null && asUtc === true) {
        correctDate = correctDate.subtract(correctDate.utcOffset(), 'minutes');
      }

      if (correctDate !== undefined && correctDate !== null) {
        if (_appSettings.Sql.Engine === 'mysql') {
          sanitised = correctDate.format('YYYY-MM-DD');
        }
        else {
          sanitised = correctDate.format('YYYY-MM-DD');
        }
      }
    }
  }

  if (sanitised === null || sanitised === undefined || sanitised === '') {
    sanitised = 'NULL';
  }

  return sanitised;
}

/**
 * This sanitises the SQL date parameters to stop injection attacks
 * @param sqlDate
 *   - The date to be sanitised
 * @param asUtc
 *   - boolean indicating that the date should be a utc date equivalent.
 * @returns string
 *   - Containing the sanitised output
 */
function sanitiseSqlDateTime(sqlDate, asUtc) {
  'use strict';
  var sanitised = '';

  if (sqlDate !== undefined && sqlDate !== null) {
    var correctDate = moment(sqlDate);

    if (correctDate !== undefined && correctDate !== null && !isNaN(correctDate.valueOf())) {
      if (asUtc !== undefined && asUtc !== null && asUtc === true) {
        correctDate = correctDate.add(correctDate.utcOffset(), 'minutes');
      }

      if (correctDate !== undefined && correctDate !== null) {
        if (_appSettings.Sql.Engine === 'mysql') {
          sanitised = correctDate.format('YYYY-MM-DD HH:mm:ss');
        }
        else {
          sanitised = correctDate.format('YYYY-MM-DD HH:mm:ss');
        }
      }
    }
  }

  if (sanitised === undefined || sanitised === null || sanitised === '') {
    sanitised = 'NULL';
  }

  return sanitised;
}

/**
 * Module exports
 */
module.exports.getNoSqlEngine = getNoSqlEngine;
module.exports.getSqlEngine = getSqlEngine;
module.exports.getCacheEngine = getCacheEngine;
module.exports.executeSqlQuery = executeSqlQuery;
module.exports.databaseClose = databaseClose;
module.exports.configureDatabase = configureDatabase;
module.exports.sanitiseSqlString = sanitiseSqlString;
module.exports.sanitiseSqlInteger = sanitiseSqlInteger;
module.exports.sanitiseSqlFloat = sanitiseSqlFloat;
module.exports.sanitiseSqlBoolean = sanitiseSqlBoolean;
module.exports.sanitiseSqlDate = sanitiseSqlDate;
module.exports.sanitiseSqlDateTime = sanitiseSqlDateTime;