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
var butrDatabase = require('./butr-database');
var butrConstants = require('./butr-constants');

/**
 * This function queues up the transaction which will be replicated to the other
 * node.js servers which are configured to talk to this server.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param metaJson
 *   - object containing the transaction metadata.
 * @api public
 */
function queueTransaction(metaJson) {
  'use strict';
  
  // DEBUG.
  console.log('going to replicate this...');
  
  return;
}

/**
 * Module exports
 */
module.exports.queueTransaction = queueTransaction;