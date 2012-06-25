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

/**
 * Butr module dependencies.
 */

/**
 * This helper function extracts the session token from the session data. This
 * is going to be used in almost every command, so better to extract it out to stop repeating
 * code.
 * @param metaJson
 *   - object containing the session data.
 * @returns string
 *   - containing the session uuid or empty if it can't be found.
 */
function getSessionToken(sessionData) {
  'use strict';
  
  if (sessionData !== undefined && sessionData !== null && typeof(sessionData) === 'object') {
    if(sessionData.session_token !== undefined && sessionData.session_token !== null && sessionData.session_token !== '') {
      return sessionData.session_token;
    }
  }
  return '';
}

/**
 * This helper function extracts the transaction token from the command meta data. This
 * is going to be used in almost every command, so better to extract it out to stop repeating
 * code.
 * @param metaJson
 *   - object containing the meta data about the command.
 * @returns string
 *   - containing the transaction uuid or empty if it can't be found.
 */
function getTransactionToken(metaJson) {
  'use strict';
  
  if (metaJson !== undefined && metaJson !== null && typeof(metaJson) === 'object') {
    if (metaJson.command !== undefined && metaJson !== null && typeof(metaJson) === 'object') {
      if (metaJson.command.transaction !== undefined && metaJson.command.transaction !== null && metaJson.command.transaction !== '') {
        return metaJson.command.transaction;
      }
    }
  }
  return '';
}

/**
 * This helper function extracts the language from the session data. This
 * is going to be used in almost every command, so better to extract it out to stop repeating
 * code.
 * @param sessionData
 *   - object containing the session data.
 * @returns string
 *   - containing the language code or empty if it can't be found.
 */
function getSessionLanguage(sessionData) {
  'use strict';
  
  if(sessionData !== undefined && sessionData !== null && typeof(sessionData) === 'object') {
    if (sessionData.language !== undefined && sessionData.language !== null && sessionData.language !== '') {
      return sessionData.language;
    }
  }
  return '';
}

/**
 * This helper function extracts the user token from the session data. This
 * is going to be used in almost every command, so better to extract it out to stop repeating
 * code.
 * @param sessionData
 *   - object containing the session data.
 * @returns string
 *   - containing the language code or empty if it can't be found.
 */
function getSessionUser(sessionData) {
  'use strict';
  
  if(sessionData !== null && sessionData !== undefined && typeof(sessionData) === 'object') {
    if (sessionData.user !== null && sessionData.user !== undefined && typeof(sessionData.user) === 'object') {
      if (sessionData.user.uuid !== null && sessionData.user.uuid !== undefined && sessionData.user.uuid !== '') {
        return sessionData.user.uuid;
      }
    }
  }
  return '';
}

/**
 * Module exports
 */
module.exports.getSessionToken = getSessionToken;
module.exports.getTransactionToken = getTransactionToken;
module.exports.getSessionLanguage = getSessionLanguage;
module.exports.getSessionUser = getSessionUser;