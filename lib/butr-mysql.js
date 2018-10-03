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

/**
 * Butr module dependencies.
 */
var butrConstants = require('./butr-constants');
var butrError = require('./butr-error');

/**
 * Module variables.
 */
var _mysql = {};
var _mysqlHost = {};

/**
 * This configures the database connections.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param user
 *   - String contiaining the database username.
 * @param pass
 *   - String containing the database password.
 * @param name
 *   - String containing the name of the database.
 * @param host
 *   - String containing the name of the server with the database.
 * @param port
 *   - Integer containing the port the database is listening on.
 * @api public
 */
function configure(user, pass, name, host, port) {
  'use strict';

  _mysql = require('mysql');

  _mysqlHost.user = user;
  _mysqlHost.password = pass;
  _mysqlHost.database = name;
  _mysqlHost.host = host;
  _mysqlHost.port = parseInt(port, 10);
  _mysqlHost.typeCast = false;
}

/**
 * This closes the database connection cleanly.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @api public
 */
function close() {
  'use strict';
}

/**
 * This actually executes the query against the database. This cleans the query to remove
 * and placeholders which are used as tokens for caching.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sqlQuery
 *   - The query to execute.
 * @param tableName
 *   - Constant containing the table identifier for caching purposes.
 * @param uuid
 *   - The UUID for the table for caching purposes.
 * @param callback
 *   - The immediate callback to handle the results.
 * @param finalCallback
 *   - The final callback to move on to the next part of processing.
 * @api public
 */
function executeQuery(sqlQuery, tableName, uuid, callback, finalCallback) {
  'use strict';

  var queryParts = sqlQuery.split(',');

  for (var i = 0; i < queryParts.length; i++) {
    if (queryParts[i].indexOf('@i_SessionUuid=') >= 0) {
      queryParts[i] = queryParts[i].replace('@i_SessionUuid=', '');
    }
    else if (queryParts[i].indexOf('@i_TransactionUuid=') >= 0) {
      queryParts[i] = queryParts[i].replace('@i_TransactionUuid=', '');
    }
  }

  var sqlQueryCleaned = queryParts.join(',');

  var mysqlConnection = _mysql.createConnection(_mysqlHost);

  mysqlConnection.on('error', function (err) {
    'use strict';

    butrError.logError(err, butrConstants.LOG_LEVEL_WARNING, i18n.__('Database MySQL error '));
  });

  mysqlConnection.connect();

  mysqlConnection.query(sqlQueryCleaned, function(err, rows, fields) {
    'use strict';

    if (err) {
      butrError.logError(err, butrConstants.LOG_LEVEL_WARNING, i18n.__('Database MySQL error '));
    }

    if (callback !== undefined && callback !== null && typeof(callback) === 'function') {
      callback(err, rows, fields, sqlQuery, tableName, uuid, finalCallback);
    }

    mysqlConnection.destroy();
  });

}

/**
 * This sanitises the SQL string based on mysql_real_escape_string() function
 * @author Paul d'Aoust
 * @param str
 *   - String containing the SQL to be sanitsed
 * @returns string
 *   - Sanitised string
 * @see http://stackoverflow.com/questions/7744912/making-a-javascript-string-sql-friendly
 * @api public
 */
function mysql_real_escape_string (str) {
  'use strict';
  return str.replace(/[\0\x08\x09\x1a\n\r"'\\\%]/g, function (char) {
    switch (char) {
      case "\0":
        return "\\0";
      case "\x08":
        return "\\b";
      case "\x09":
        return "\\t";
      case "\x1a":
        return "\\z";
      case "\n":
        return "\\n";
      case "\r":
        return "\\r";
      case "\"":
      case "'":
      case "\\":
      case "%":
        return "\\"+char; // prepends a backslash to backslash, percent,
                          // and double/single quotes
    }
  });
}

/**
 * This converts the rows and fields into a the internal json format for consistent
 * processing. This is abstracts the results away so that we can plug in different
 * database engines if we want to.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param err
 *   - Object containing the error details.
 * @param rows
 *   - Object containing the results in rows.
 * @param fields
 *   - Object containing the details of the fields in the results.
 * @param sqlQuery
 *   - The SQL query which was executed.
 * @param tableName
 *   - The table name for the table to be cached in the results.
 * @param uuid
 *   - The UUID of the table to be cached in the results.
 * @param callback
 *   - The callback to execute to handle the results.
 * @param finalCallback
 *   - The callback to execute after the callback to move on to the next step of the processing.
 * @param cacheCallback
 *   - The callback to execute to save the results into a cache.
 * @api public
 */
function internaliseResult(err, rows, fields, sqlQuery, tableName, uuid, callback, cacheCallback) {
  'use strict';

  var jsonResult = {};

  jsonResult.resultFromCache = false;

  jsonResult.sql = sqlQuery;
  if (err !== undefined && err !== null && err) {
    jsonResult.result = err.message;
  }
  else {
    jsonResult.result = {};
  }
  jsonResult.rows = [];
  if (rows !== undefined && rows !== null) {
    if (rows.length > 0) {
      if (rows[0].length > 0) {
        for(var i = 0; i < rows[0].length; i++) {
          jsonResult.rows.push(rows[0][i]);
        }
      }
    }
  }

  if (cacheCallback !== undefined && cacheCallback !== null && typeof(cacheCallback) === 'function') {
    cacheCallback(err, tableName, uuid, sqlQuery, jsonResult);
  }
  if (callback !== undefined && callback !== null && typeof(callback) === 'function') {
    return callback(err, tableName, uuid, sqlQuery, jsonResult);
  }
}

/**
 * Module exports
 */
module.exports.configure = configure;
module.exports.close = close;
module.exports.executeQuery = executeQuery;
module.exports.internaliseResult = internaliseResult;
module.exports.sanitiseString = mysql_real_escape_string;