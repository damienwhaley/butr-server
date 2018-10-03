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
 * Butr module dependencies.
 */
var butrDatabase = require('../butr-database');
var butrConstants = require('../butr-constants');
var butrApiJsonCommandListGlobalConfigurations = require('../api_json/command-list_global_configurations');
var butrUtil = require('../butr-util');
var butrConfig = require('../butr-config');

/**
 * This executes the list_global_configuration command.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param res
 *   - object containing the HTTP response.
 * @param metaJson
 *   - object containing the meta data about the command.
 * @param messageFormat
 *   - constant containing the message output format
 * @param messageInternal
 *   - object containing the message as it was requested.
 * @param sessionData
 *   - object containing the session data
 * @api public
 */
function execute(res, metaJson, messageFormat, messageInternal, sessionData) {
  'use strict';

  var outJson = {};
  var sessionUuid = butrUtil.getSessionToken(sessionData);
  var transactionUuid = butrUtil.getTransactionToken(metaJson);
  
  var sqlString = sqlListGlobalConfigurations(sessionUuid, transactionUuid);
  
  // Grab the global configuration settings.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_CONFIGURATION_GLOBALS, '0', function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackListGlobalConfigurations(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson, messageInternal.offset, messageInternal.size, messageInternal.direction, messageInternal.ordinal);
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
 * This callback handles the saving of the database and outputting based on this.
 * @param err
 *   - object containing any errors.
 * @param tableName
 *   - constant containing the database table name
 * @param uuid
 *   - string containing the uuid of the database table name
 * @param sqlQuery
 *   - string containing the sql which was executed.
 * @param jsonResult
 *   - object containing the results from the database.
 * @param res
 *   - object containing the HTTP response.
 * @param metaJson
 *   - object containing the meta data about the command.
 * @param sessionData
 *   - object containing the session data.
 * @param messageFormat
 *   - constant containing the message output format.
 * @param outJson
 *   - object containing the output in the internal format.
 * @param offset
 *   - integer containing the offset position for the results.
 * @param size
 *   - integer containing the number of results to return.
 * @param direction
 *   - string containing the direction of the search results.
 * @param ordinal
 *   - string containing the ordinal field to search on.
 * @api private
 */
function callbackListGlobalConfigurations(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson, offset, size, direction, ordinal) {
  'use strict';
  
  var setting = '';
  var item = {};
  var unsortedResults = [];
  var foundSetting = false;
  var sessionUuid = butrUtil.getSessionToken(sessionData);
  
  // Set output language
  var sessionLanguage = butrUtil.getSessionLanguage(sessionData);
  if (sessionLanguage !== '') {
    i18n.setLocale(sessionLanguage);
  }
  
  outJson.authentication = {};
  outJson.authentication.session_token = sessionUuid;
  
  outJson.result = {};
  outJson.result.status = butrConstants.MESSAGE_RESULT_OK;
  outJson.result.explanation = '';
  outJson.list_global_configurations = {};
  outJson.list_global_configurations.total_count = 0;
  outJson.list_global_configurations.offset = 0;
  outJson.list_global_configurations.size = -1;
  outJson.list_global_configurations.items = [];
  
  if (!err) {
    if (jsonResult !== null && jsonResult !== undefined && typeof(jsonResult) === 'object') {    	
      // Store SQL finish in meta data
      if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) === 'object') {
        metaJson.sql.finish.push(new Date());
        if (jsonResult.resultFromCache !== undefined && jsonResult.resultFromCache !== null && typeof(jsonResult.resultFromCache) === 'boolean') {
          metaJson.sql.resultFromCache.push(jsonResult.resultFromCache);
        }
        else {
          metaJson.sql.resultFromCache.push(false);
        }
      } 
      
      if (jsonResult.rows.length > 0) {
        // Got some results so build up object to return.
    	  
    	if (jsonResult.rows[0]._total_count !== null
    	  && jsonResult.rows[0]._total_count !== undefined
    	  && !isNaN(jsonResult.rows[0]._total_count)) {
    	  outJson.list_global_configurations.total_count = jsonResult.rows[0]._total_count;
    	}
    	  
        for(var i = 0; i < jsonResult.rows.length; i++) {
          foundSetting = false;
          setting = '';
          item = {};
        
          if (jsonResult.rows[i].text_setting !== null
            && jsonResult.rows[i].text_setting !== undefined
            && jsonResult.rows[i].text_setting !== '') {
            item.text_setting = jsonResult.rows[i].text_setting;
            if (foundSetting === false) {
              setting = jsonResult.rows[i].text_setting;
              foundSetting = true;
            }
          }
          else {
            item.text_setting = null;
          }
          
          if (jsonResult.rows[i].integer_setting !== null
            && jsonResult.rows[i].integer_setting !== undefined
            && !isNaN(jsonResult.rows[i].integer_setting)) {
            item.integer_setting = jsonResult.rows[i].integer_setting;
            if (foundSetting === false) {
              setting = jsonResult.rows[i].integer_setting;
              foundSetting = true;
            }
          }
          else {
            item.integer_setting = null;
          }
          
          if (jsonResult.rows[i].float_setting !== null
            && jsonResult.rows[i].float_setting !== undefined
            && !isNaN(jsonResult.rows[0].datetime_setting)) {
            item.float_setting = jsonResult.rows[i].float_setting;
            if (foundSetting === false) {
              setting = jsonResult.rows[i].float_setting;
              foundSetting = true;
            }
          }
          else {
            item.float_setting = null;
          }
          
          if (jsonResult.rows[i].datetime_setting !== null
            && jsonResult.rows[i].datetime_setting !== undefined) {
        	var dt = moment(jsonResult.rows[i].datetime_setting);
        	if (dt !== undefined && dt !== null) {
              item.datetime_setting = dt.format('YYYY-MM-DD HH:mm:ss');
              if (foundSetting === false) {
                setting = dt.format('YYYY-MM-DD HH:mm:ss');
                foundSetting = true;
              }
            }
            else {
              item.datetime_setting = '';
            }
          }
          else {
            item.datetime_setting = null;
          }
          
          if (jsonResult.rows[i].uuid_setting !== null
            && jsonResult.rows[i].uuid_setting !== undefined
            && jsonResult.rows[i].uuid_setting !== '') {
            item.uuid_setting = jsonResult.rows[i].uuid_setting;
            if (foundSetting === false) {
              setting = jsonResult.rows[i].uuid_setting;
              foundSetting = true;
            }
          }
          else {
            item.uuid_setting = '';
          }
          
          if (jsonResult.rows[i].bit_setting !== null
            && jsonResult.rows[i].bit_setting !== undefined) {
            
            if (jsonResult.rows[i].bit_setting === 1) {
              item.bit_setting = 1;
            }
            else {
              item.bit_setting = 0;
            }
            if (foundSetting === false) {
              setting = item.bit_setting;
              foundSetting = true;
            }
          }
          else {
            item.bit_setting = null;
          }
          
          if (jsonResult.rows[i].name_label !== null
            && jsonResult.rows[i].name_label !== undefined
            && jsonResult.rows[i].name_label !== '') {
            item.name_label = jsonResult.rows[i].name_label;
          }
          else {
            item.name_label = '';
          }
          
          if (jsonResult.rows[i].display_label !== null
            && jsonResult.rows[i].display_label !== undefined
            && jsonResult.rows[i].display_label !== '') {
            item.display_label = jsonResult.rows[i].display_label;
          }
          else {
            item.display_label = '';
          }
          
          if (jsonResult.rows[i].magic !== null
            && jsonResult.rows[i].magic !== undefined
            && jsonResult.rows[i].magic !== '') {
            item.magic = jsonResult.rows[i].magic;
          }
          else {
            item.magic = '';
          }
          
          if (jsonResult.rows[i].description !== null
            && jsonResult.rows[i].description !== undefined
            && jsonResult.rows[i].description !== '') {
            item.description = jsonResult.rows[i].description;
          }
          else {
            item.description = '';
          }
          
          if (jsonResult.rows[i]._table_uuid !== null
            && jsonResult.rows[i]._table_uuid !== undefined
            && jsonResult.rows[i]._table_uuid !== '') {
            item.uuid = jsonResult.rows[i]._table_uuid;
          }
          else {
            item.uuid = '';
          }
          
          if (setting !== undefined && setting !== null) {
            item.effective_setting = setting;
          }
          else {
            item.effective_setting = null;
          }
          
          unsortedResults.push(item);
        }
        
        // Now need to sort results.
        if (ordinal === 'name_label' && direction === 'ascending') {
          unsortedResults.sort(sortNameLabelAscending);
        } else if (ordinal === 'name_label' && direction === 'descending') {
          unsortedResults.sort(sortNameLabelDescending);
        } else if (ordinal === 'display_label' && direction === 'ascending') {
          unsortedResults.sort(sortDisplayLabelAscending);
        } else if (ordinal === 'display_label' && direction === 'descending') {
          unsortedResults.sort(sortDisplayLabelDescending);
        } else if (ordinal === 'magic' && direction === 'ascending') {
          unsortedResults.sort(sortMagicAscending);
        } else if (ordinal === 'magic' && direction === 'descending') {
          unsortedResults.sort(sortMagicDescending);
        }
        
        if (offset === undefined || offset === null || isNaN(offset)) {
          offset = 0;
        }
      
        if (offset < 0) {
          offset = 0;
        }
      
        if (size === undefined || size === null || isNaN(size)) {
          size = butrConfig.getGlobalSetting('default_list_size');
        }
      
        // Negative size means we want everything
        if (size < 0) {
          size = unsortedResults.length;
          offset = 0;
        }
        
        // Capture the offset and size
        outJson.list_global_configurations.offset = offset;
        outJson.list_global_configurations.size = size;

        // Copy only the segment required.
        for (var i = parseInt(offset, 10); i < parseInt(offset, 10)+parseInt(size, 10); i++) {
          if (i < unsortedResults.length) {
            outJson.list_global_configurations.items.push(unsortedResults[i]);
          }
          else {
      	    break;
          }
        }
        
        if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
          return butrApiJsonCommandListGlobalConfigurations.render(null, res, outJson, metaJson, sessionData);
        }
      }
    }
  }
  
  // Store SQL finish in meta data if an error
  if (metaJson.sql !== undefined && metaJson.sql != null && typeof(metaJson.sql) ==='object') {
    metaJson.sql.finish.push(new Date());
    metaJson.sql.resultFromCache.push(false);
  }
  
  if (err || jsonResult === null || jsonResult === undefined) {    
    outJson.result.status = butrConstants.MESSAGE_RESULT_ERROR;
    outJson.result.explanation = i18n.__('Could not execute command.');
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandListGlobalConfigurations.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * This takes compares two objects by their name_label member in ascending order.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing -1 for a < b, 1 for a > b, and 0 for equal.
 * @api private
 */
function sortNameLabelAscending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.name_label !== undefined && a.name_label !== null) {
	a_string = a.name_label.toLowerCase();
  }
  
  if (b.name_label !== undefined && b.name_label !== null) {
    b_string = b.name_label.toLowerCase();
  }
  
  result = a_string.localeCompare(b_string);
  
  if (result > 0) {
	return 1;
  } else if (result < 0) {
	return -1;
  } else {
	return 0;
  }
}

/**
 * This takes compares two objects by their name_label member in descending order.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing 1 for a < b, -1 for a > b, and 0 for equal.
 * @api private
 */
function sortNameLabelDescending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.name_label !== undefined && a.name_label !== null) {
	a_string = a.name_label.toLowerCase();
  }
  
  if (b.name_label !== undefined && b.name_label !== null) {
    b_string = b.name_label.toLowerCase();
  }
  
  result = b_string.localeCompare(a_string);
  
  if (result > 0) {
	return 1;
  } else if (result < 0) {
	return -1;
  } else {
	return 0;
  }
}

/**
 * This takes compares two objects by their display_label member in ascending order.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing -1 for a < b, 1 for a > b, and 0 for equal.
 * @api private
 */
function sortDisplayLabelAscending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.display_label !== undefined && a.display_label !== null) {
	a_string = a.display_label.toLowerCase();
  }
  
  if (b.display_label !== undefined && b.display_label !== null) {
    b_string = b.display_label.toLowerCase();
  }
  
  result = a_string.localeCompare(b_string);
  
  if (result > 0) {
	return 1;
  } else if (result < 0) {
	return -1;
  } else {
	return 0;
  }
}

/**
 * This takes compares two objects by their display_label member in descending order.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing 1 for a < b, -1 for a > b, and 0 for equal.
 * @api private
 */
function sortDisplayLabelDescending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.display_label !== undefined && a.display_label !== null) {
	a_string = a.display_label.toLowerCase();
  }
  
  if (b.display_label !== undefined && b.display_label !== null) {
    b_string = b.display_label.toLowerCase();
  }
  
  result = b_string.localeCompare(a_string);
  
  if (result > 0) {
	return 1;
  } else if (result < 0) {
	return -1;
  } else {
	return 0;
  }
}

/**
 * This takes compares two objects by their magic member in ascending order.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing -1 for a < b, 1 for a > b, and 0 for equal.
 * @api private
 */
function sortMagicAscending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.magic !== undefined && a.magic !== null) {
	a_string = a.magic.toLowerCase();
  }
  
  if (b.magic !== undefined && b.magic !== null) {
    b_string = b.magic.toLowerCase();
  }
  
  result = a_string.localeCompare(b_string);
  
  if (result > 0) {
	return 1;
  } else if (result < 0) {
	return -1;
  } else {
	return 0;
  }
}

/**
 * This takes compares two objects by their magic member in descending order.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing 1 for a < b, -1 for a > b, and 0 for equal.
 * @api private
 */
function sortMagicDescending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.magic !== undefined && a.magic !== null) {
	a_string = a.magic.toLowerCase();
  }
  
  if (b.magic !== undefined && b.magic !== null) {
    b_string = b.magic.toLowerCase();
  }
  
  result = b_string.localeCompare(a_string);
  
  if (result > 0) {
	return 1;
  } else if (result < 0) {
	return -1;
  } else {
	return 0;
  }
}

/**
 * This builds the SQL query for listing the global configuration.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlListGlobalConfigurations(sessionUuid, transactionUuid) {
  'use strict';
  
  return "CALL p_configuration_ListGlobal(@i_SessionUuid='"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)+"');";
}

/**
 * Module exports.
 */
module.exports.execute = execute;