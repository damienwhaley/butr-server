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
 * System version
 */
module.exports.SYSTEM_VERSION = '0.0.1-alpha';

/**
 * Exit error codes
 */
module.exports.EXIT_INVALID_CONFIGURATION = 100;
module.exports.EXIT_COULD_NOT_LOAD_PERMISSION_SETTINGS = 101;
module.exports.EXIT_COULD_NOT_LOAD_GLOBAL_SETTINGS = 102;
module.exports.EXIT_SIGINT = 101;

/**
 * Logging constants
 */
module.exports.LOG_LEVEL_ALL = 7;
module.exports.LOG_LEVEL_DEBUG = 7;
module.exports.LOG_LEVEL_INFO = 6;
module.exports.LOG_LEVEL_NOTICE = 5;
module.exports.LOG_LEVEL_WARNING = 4;
module.exports.LOG_LEVEL_ERROR = 3;
module.exports.LOG_LEVEL_CRITICAL = 2;
module.exports.LOG_LEVEL_ALERT = 1;
module.exports.LOG_LEVEL_EMERGENCY = 0;

/**
 * Database table constants
 */
module.exports.DATABASE_TABLECOUNT = 100;

module.exports.DATABASE_TABLE_NONE = 0;
module.exports.DATABASE_TABLE_CONFIGURATION_GLOBALS = 1;
module.exports.DATABASE_TABLE_CONFIGURATION_LOOKUP_GLOBAL_LANGUAGES = 2;
module.exports.DATABASE_TABLE_CONFIGURATION_LOOKUP_GLOBAL_TITLES = 3;
module.exports.DATABASE_TABLE_CONFGIURATION_LOOKUP_SECURITY_AUTHENTICATION_METHODS = 4;
module.exports.DATABASE_TABLE_CONFIGURATION_LOOKUP_SECURITY_CLIENT_TYPES = 5;
module.exports.DATABASE_TABLE_CONFIGURATION_LOOKUP_SYSTEM_DOCK_TYPES = 6;
module.exports.DATABASE_TABLE_CONFIGURATION_LOOKUP_SYSTEM_LOG_TYPES = 7;
module.exports.DATABASE_TABLE_LOCATION_COUNTRIES = 8;
module.exports.DATABASE_TABLE_SECURITY_DOCK_ITEMS_PERMISSIONS = 9;
module.exports.DATABASE_TABLE_SECURITY_DOCK_SUBITEMS_PERMISSIONS = 10;
module.exports.DATABASE_TABLE_SECURITY_DOCK_TABS_PERMISSIONS = 11;
module.exports.DATABASE_TABLE_SECURITY_DOCKS_PERMISSIONS = 12;
module.exports.DATABASE_TABLE_SECURITY_EFFECTIVE_PERMISSIONS = 13;
module.exports.DATABASE_TABLE_SECURITY_MESSAGES_PERMISSIONS = 14;
module.exports.DATABASE_TABLE_SECURITY_NONCES = 15;
module.exports.DATABASE_TABLE_SECURITY_PERMISSIONS = 16;
module.exports.DATABASE_TABLE_SECURITY_REGISTRATIONS = 17;
module.exports.DATABASE_TABLE_SECURITY_ROLES = 18;
module.exports.DATABASE_TABLE_SECURITY_ROLES_PERMISSIONS = 19;
module.exports.DATABASE_TABLE_SECURITY_SESSIONS = 20;
module.exports.DATABASE_TABLE_SECURITY_USERS_CREDENTIALS = 21;
module.exports.DATABASE_TABLE_SECURITY_USERS_PERMISSIONS = 22;
module.exports.DATABASE_TABLE_SECURITY_USERS_ROLES = 23;
module.exports.DATABASE_TABLE_SYSTEM_DOCK_ITEMS = 24;
module.exports.DATABASE_TABLE_SYSTEM_DOCK_SUBITEMS = 25;
module.exports.DATABASE_TABLE_SYSTEM_DOCK_TABS = 2;
module.exports.DATABASE_TABLE_SYSTEM_DOCKS = 27;
module.exports.DATABASE_TABLE_SYSTEM_LOG_MESSAGES = 28;
module.exports.DATABASE_TABLE_SYSTEM_LOG_QUERIES = 29;
module.exports.DATABASE_TABLE_SYSTEM_LOG_TRANSACTION_DETAILS = 30;
module.exports.DATABASE_TABLE_SYSTEM_LOG_TRANSACTIONS = 31;
module.exports.DATABASE_TABLE_SYSTEM_MESSAGES = 32;
module.exports.DATABASE_TABLE_SYSTEM_MODULES = 33;
module.exports.DATABASE_TABLE_SYSTEM_PARTITIONS = 34;
module.exports.DATABASE_TABLE_SYSTEM_TABLES = 35;
module.exports.DATABASE_TABLE_SYSTEM_FIELD_TRANSLATIONS = 36;
module.exports.DATABASE_TABLE_SYSTEM_STRING_TRANSLATIONS = 37;
module.exports.DATABASE_TABLE_USER_GROUPS = 38;
module.exports.DATABASE_TABLE_USER_USERS = 39;
module.exports.DATABASE_TABLE_USER_USERS_GROUPS = 40;

module.exports.DATABASE_TABLE_BOOKING = 99;

/**
 * Database cache types
 */
module.exports.DATABASE_CACHE_NONE = 0;
module.exports.DATABASE_CACHE_MEMCACHED_STORE = 1;
module.exports.DATABASE_CACHE_MEMCACHED_PURGE = 2;
module.exports.DATABASE_CACHE_REDIS_STORE = 3;
module.exports.DATABASE_CACHE_REDIS_PURGE = 4;

/**
 * Message formats
 */
module.exports.MESSAGE_FORMAT_JSON = 1;
module.exports.MESSAGE_FORMAT_REST = 2;
module.exports.MESSAGE_FORMAT_SOAP = 3;

/**
 * Security authorisation methods
 */
module.exports.AUTHENTICATION_METHOD_NONE = 0;
module.exports.AUTHENTICATION_METHOD_LOCAL = 1;
module.exports.AUTHENTICATION_METHOD_FACEBOOK = 2;
module.exports.AUTHENTICATION_METHOD_OPENID = 3;
module.exports.AUTHENTICATION_METHOD_TWITTER = 4;
module.exports.AUTHENTICATION_METHOD_GOOGLE = 5;

/**
 * Security errors
 */
module.exports.SECURITY_ERROR_NONE = 0;
module.exports.SECURITY_ERROR_OTHER = 1;
module.exports.SECURITY_ERROR_REGISTRATION_NOT_FOUND = 2;
module.exports.SECURITY_ERROR_SESSION_CREATE_FAILED = 3;
module.exports.SECURITY_ERROR_SESSION_NOT_FOUND = 4;
module.exports.SECURITY_ERROR_USER_NOT_FOUND = 5;
module.exports.SECURITY_ERROR_NOT_ALLOWED = 6;
module.exports.SECURITY_ERROR_UNKNOWN_COMMAND = 7;
module.exports.SECURITY_ERROR_DUPLICATE_NONCE = 8;

/**
 * Security execution status
 */
module.exports.SECURITY_EXECUTE_OK = 1;
module.exports.SECURITY_EXECUTE_WITH_PARTITION_CHECK = 2;
module.exports.SECURITY_EXECUTE_DENIED = 3;

/**
 * Message result status codes
 */
module.exports.MESSAGE_RESULT_OK = 'OK';
module.exports.MESSAGE_RESULT_WARNING = 'WARNING';
module.exports.MESSAGE_RESULT_ERROR = 'ERROR';
module.exports.MESSAGE_RESULT_EXPIRED = 'EXPIRED';

/**
 * Languages
 */
module.exports.LANGUAGE_NONE = 0;
module.exports.LANGUAGE_EN_AU = 1;
module.exports.LANGUAGE_EN = 2;
module.exports.LANGUAGE_SE = 3;
module.exports.LANGUAGE_FR = 4;
module.exports.LANGUAGE_DE = 5;

/**
 * Sort directions
 */
module.exports.SORT_DIRECTION_ASCENDING = 'ascending';
module.exports.SORT_DIRECTION_DESCENDING = 'descending';

/**
 * Sort ordinal
 */
module.exports.SORT_ORDINAL_DEFAULT = 'default';