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
var butrDatabase = require('../butr-database');
var butrConstants = require('../butr-constants');
var butrApiJsonCommandListDockSubitems = require('../api_json/command-list_dock_subitems');
var butrUtil = require('../butr-util');
var butrConfig = require('../butr-config');

/**
 * This executes the list_dock_subitems command.
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
  
  var sqlString = sqlListDockSubitems(sessionUuid, transactionUuid);
  
  // Execute the query.
  butrDatabase.executeSqlQuery(sqlString, butrConstants.DATABASE_CACHE_MEMCACHED_STORE, butrConstants.DATABASE_TABLE_SYSTEM_DOCK_SUBITEMS, '0', function (err, tableName, uuid, sqlQuery, jsonResult) {
    'use strict';
      
    callbackListDockSubitems(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson, messageInternal.offset, messageInternal.size, messageInternal.direction, messageInternal.ordinal);
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
 * This callback handles the outputting based on this.
 * @author Damien Whaley <damien@whalebonestudios.com>
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
function callbackListDockSubitems(err, tableName, uuid, sqlQuery, jsonResult, res, metaJson, sessionData, messageFormat, outJson, offset, size, direction, ordinal) {
  'use strict';
  
  var item = {};
  var unsortedResults = [];
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
  outJson.list_dock_subitems = {};
  outJson.list_dock_subitems.total_count = 0;
  outJson.list_dock_subitems.offset = 0;
  outJson.list_dock_subitems.size = -1;
  outJson.list_dock_subitems.items = [];
  
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
        // Got some results so build up object to return.
    	  
    	if (jsonResult.rows[0]._total_count !== null
    	  && jsonResult.rows[0]._total_count !== undefined
    	  && !isNaN(jsonResult.rows[0]._total_count)) {
    	  outJson.list_dock_subitems.total_count = jsonResult.rows[0]._total_count;
    	}
    	  
        for(var i = 0; i < jsonResult.rows.length; i++) {
          item = {};
        
          if (jsonResult.rows[i].security_client_type_display_label !== null
	        && jsonResult.rows[i].security_client_type_display_label !== undefined
	        && jsonResult.rows[i].security_client_type_display_label !== '') {
	        item.security_client_type_label = jsonResult.rows[i].security_client_type_display_label;
	      }
	      else {
	    	item.security_client_type_label = '';
	      }
          
          if (item.security_client_type_label === '' && jsonResult.rows[i].security_client_type_name_label !== null
	        && jsonResult.rows[i].security_client_type_name_label !== undefined
	        && jsonResult.rows[i].security_client_type_name_label !== '') {
        	item.security_client_type_label = jsonResult.rows[i].security_client_type_name_label;
	      }
          
          if (jsonResult.rows[i].system_dock_type_display_label !== null
  	        && jsonResult.rows[i].system_dock_type_display_label !== undefined
  	        && jsonResult.rows[i].system_dock_type_display_label !== '') {
  	        item.system_dock_type_label = jsonResult.rows[i].system_dock_type_display_label;
  	      }
  	      else {
  	    	item.system_dock_type_label = '';
  	      }
                
          if (item.system_dock_type_label === '' && jsonResult.rows[i].system_dock_type_name_label !== null
  	        && jsonResult.rows[i].system_dock_type_name_label !== undefined
  	        && jsonResult.rows[i].system_dock_type_name_label !== '') {
          	item.system_dock_type_label = jsonResult.rows[i].system_dock_type_name_label;
  	      }
          
          if (jsonResult.rows[i].dock_item_display_name !== null
	        && jsonResult.rows[i].dock_item_display_name !== undefined
	        && jsonResult.rows[i].dock_item_display_name !== '') {
	        item.dock_item_name = jsonResult.rows[i].dock_item_display_name;
	      }
	      else {
	    	dockSubitem.dock_item_name = '';
	      }
              
          if (item.dock_item_name === '' && jsonResult.rows[i].dock_item_name !== null
	        && jsonResult.rows[i].dock_item_name !== undefined
	        && jsonResult.rows[i].dock_item_name !== '') {
        	item.dock_item_name = jsonResult.rows[i].dock_item_name;
	      }
  
          if (jsonResult.rows[i].subitem_name !== null
            && jsonResult.rows[i].subitem_name !== undefined
            && jsonResult.rows[i].subitem_name !== '') {
            item.subitem_name = jsonResult.rows[i].subitem_name;
          }
          else {
            dockSubitem.subitem_name = '';
          }
          
          if (jsonResult.rows[i].display_name !== null
            && jsonResult.rows[i].display_name !== undefined
            && jsonResult.rows[i].display_name !== '') {
            item.display_name = jsonResult.rows[i].display_name;
          }
          else {
            item.display_name = '';
          }
          
          if (jsonResult.rows[i]._table_uuid !== null
            && jsonResult.rows[i]._table_uuid !== undefined
            && jsonResult.rows[i]._table_uuid !== '') {
            item.uuid = jsonResult.rows[i]._table_uuid;
          }
          else {
            item.uuid = '';
          }
          
          unsortedResults.push(item);
        }
        
        // Now need to sort results.
        if (ordinal === 'security_clent_type_label' && direction === 'ascending') {
          unsortedResults.sort(sortSecurityClientTypeLabelAscending);
        } else if (ordinal === 'security_client_type_label' && direction === 'descending') {
          unsortedResults.sort(sortSecurityClientTypeLabelDescending);
        } else if (ordinal === 'dock_item_name' && direction === 'ascending') {
          unsortedResults.sort(sortDockItemNameAscending);
        } else if (ordinal === 'dock_item_name' && direction === 'descending') {
          unsortedResults.sort(sortDockItemNameDescending);
        } else if (ordinal === 'display_name' && direction === 'ascending') {
          unsortedResults.sort(sortDisplayNameAscending);
        } else if (ordinal === 'display_name' && direction === 'descending') {
          unsortedResults.sort(sortDisplayNameDescending);
        } else if (ordinal === 'subitem_name' && direction === 'ascending') {
          unsortedResults.sort(sortSubitemNameAscending);
        } else if (ordinal === 'subitem_name' && direction === 'descending') {
          unsortedResults.sort(sortSubitemNameDescending);
        } else if (ordinal === 'system_dock_type_label' && direction === 'ascending') {
          unsortedResults.sort(sortSystemDockTypeLabelAscending);
        } else if (ordinal === 'system_dock_type_label' && direction === 'descending') {
          unsortedResults.sort(sortSystemDockTypeLabelDescending);
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
        outJson.list_dock_subitems.offset = offset;
        outJson.list_dock_subitems.size = size;

        // Copy only the segment required.
        for (var i = parseInt(offset, 10); i < parseInt(offset, 10)+parseInt(size, 10); i++) {
          if (i < unsortedResults.length) {
            outJson.list_dock_subitems.items.push(unsortedResults[i]);
          }
          else {
        	break;
          }
        }
        
        if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
          return butrApiJsonCommandListDockSubitems.render(null, res, outJson, metaJson, sessionData);
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
    outJson.list_dock_subitems = [];
  }
  
  if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
    return butrApiJsonCommandListDockSubitems.render(null, res, outJson, metaJson, sessionData);
  }
}

/**
 * This takes compares two objects by their security_client_type_label member in ascending order.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing -1 for a < b, 1 for a > b, and 0 for equal.
 * @api private
 */
function sortSecurityClientTypeLabelAscending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.security_client_type_label !== undefined && a.security_client_type_label !== null) {
	a_string = a.security_client_type_label.toLowerCase();
  }
  
  if (b.security_client_type_label !== undefined && b.security_client_type_label !== null) {
    b_string = b.security_client_type_label.toLowerCase();
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
 * This takes compares two objects by their security_client_type_label member in descending order.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing 1 for a < b, -1 for a > b, and 0 for equal.
 * @api private
 */
function sortSecurityClientTypeLabelDescending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.security_client_type_label !== undefined && a.security_client_type_label !== null) {
	a_string = a.security_client_type_label.toLowerCase();
  }
  
  if (b.security_client_type_label !== undefined && b.security_client_type_label !== null) {
    b_string = b.security_client_type_label.toLowerCase();
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
 * This takes compares two objects by their dock_item_name member in ascending order.
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing -1 for a < b, 1 for a > b, and 0 for equal.
 */
function sortDockItemNameAscending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.dock_item_name !== undefined && a.dock_item_name !== null) {
	a_string = a.dock_item_name.toLowerCase();
  }
  
  if (b.dock_item_name !== undefined && b.dock_item_name !== null) {
    b_string = b.dock_item_name.toLowerCase();
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
 * This takes compares two objects by their dock_item_name member in descending order.
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing 1 for a < b, -1 for a > b, and 0 for equal.
 */
function sortDockItemNameDescending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.dock_item_name !== undefined && a.dock_item_name !== null) {
	a_string = a.dock_item_name.toLowerCase();
  }
  
  if (b.dock_item_name !== undefined && b.dock_item_name !== null) {
    b_string = b.dock_item_name.toLowerCase();
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
 * This takes compares two objects by their display_name member in ascending order.
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing -1 for a < b, 1 for a > b, and 0 for equal.
 */
function sortDisplayNameAscending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.display_name !== undefined && a.display_name !== null) {
	a_string = a.display_name.toLowerCase();
  }
  
  if (b.dock_name !== undefined && b.dock_name !== null) {
    b_string = b.dock_name.toLowerCase();
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
 * This takes compares two objects by their display_name member in descending order.
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing 1 for a < b, -1 for a > b, and 0 for equal.
 */
function sortDisplayNameDescending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.display_name !== undefined && a.display_name !== null) {
	a_string = a.display_name.toLowerCase();
  }
  
  if (b.display_name !== undefined && b.display_name !== null) {
    b_string = b.display_name.toLowerCase();
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
 * This takes compares two objects by their subitem_name member in ascending order.
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing -1 for a < b, 1 for a > b, and 0 for equal.
 */
function sortSubitemNameAscending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.subitem_name !== undefined && a.subitem_name !== null) {
	a_string = a.subitem_name.toLowerCase();
  }
  
  if (b.subitem_name !== undefined && b.subitem_name !== null) {
    b_string = b.subitem_name.toLowerCase();
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
 * This takes compares two objects by their subitem_name member in descending order.
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing 1 for a < b, -1 for a > b, and 0 for equal.
 */
function sortSubitemNameDescending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.subitem_name !== undefined && a.subitem_name !== null) {
	a_string = a.subitem_name.toLowerCase();
  }
  
  if (b.subitem_name !== undefined && b.subitem_name !== null) {
    b_string = b.subitem_name.toLowerCase();
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
 * This takes compares two objects by their system_dock_type_label member in ascending order.
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing -1 for a < b, 1 for a > b, and 0 for equal.
 */
function sortSystemDockTypeLabelAscending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.system_dock_type_label !== undefined && a.system_dock_type_label !== null) {
	a_string = a.system_dock_type_label.toLowerCase();
  }
  
  if (b.system_dock_type_label !== undefined && b.system_dock_type_label !== null) {
    b_string = b.system_dock_type_label.toLowerCase();
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
 * This takes compares two objects by their system_dock_type_label member in descending order.
 * @param a
 *   - First object to compare.
 * @param b
 *   - Second object to compare.
 * @returns
 *   - integer containing 1 for a < b, -1 for a > b, and 0 for equal.
 */
function sortSystemDockTypeLabelDescending(a, b) {
  'use strict';
  
  var result = 0;
  var a_string = '';
  var b_string = '';
  
  if (a.system_dock_type_label !== undefined && a.system_dock_type_label !== null) {
	a_string = a.system_dock_type_label.toLowerCase();
  }
  
  if (b.system_dock_type_label !== undefined && b.system_dock_type_label !== null) {
    b_string = b.system_dock_type_label.toLowerCase();
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
 * This builds the SQL query for listing dock subitems.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param sessionUuid
 *   - String containing the session uuid.
 * @param transactionUuid
 *   - String containing the transaction uuid.
 * @returns string
 *   - contains the SQL query to be executed.
 * @api private
 */
function sqlListDockSubitems(sessionUuid, transactionUuid) {
  'use strict';
  
  return "CALL p_system_ListDockSubitem('"+butrDatabase.sanitiseSqlString(sessionUuid)
    +"', @i_TransactionUuid='"+butrDatabase.sanitiseSqlString(transactionUuid)+"');";
}

/**
 * Module exports.
 */
module.exports.execute = execute;