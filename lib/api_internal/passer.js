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
var butrConfig = require('../butr-config');
var butrConstants = require('../butr-constants');
var butrApiJsonError = require('../api_json/error');
var butrApiRestError = require('../api_rest/error');

/**
 * This passes the message to the correct internal command
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param res
 *   - object containing the response to be sent out.
 * @param metaJson
 *   - object containing the meta data about the message.
 * @param messageName
 *   - string containing the name of the message to be exeuted.
 * @param canExecute
 *   - constant containing whether or not a security check is required.
 * @param messageFormat
 *   - constant containing the final message format
 * @param messageInternal
 *   - object containing the command part of the message
 * @param sessionData
 *   - object containing the session data.
 * @api public
 */
function passMessage(res, metaJson, messageName, canExecute, messageFormat, messageInternal, sessionData) {
  'use strict';
  
  switch(messageName) {
  case 'add_country':
    var butrApiInternalCommandAddCountry = require('./command-add_country');
    butrApiInternalCommandAddCountry.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'add_dock':
    var butrApiInternalCommandAddDock = require('./command-add_dock');
    butrApiInternalCommandAddDock.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'add_dock_item':
	var butrApiInternalCommandAddDockItem = require('./command-add_dock_item');
	butrApiInternalCommandAddDockItem.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'add_dock_subitem':
	var butrApiInternalCommandAddDockSubitem = require('./command-add_dock_subitem');
	butrApiInternalCommandAddDockSubitem.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'add_dock_tab':
	var butrApiInternalCommandAddDockTab = require('./command-add_dock_tab');
	butrApiInternalCommandAddDockTab.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'add_global_configuration':
    var butrApiInternalCommandAddGlobalConfiguration = require('./command-add_global_configuration');
    butrApiInternalCommandAddGlobalConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'add_global_language_configuration':
    var butrApiInternalCommandAddGlobalLanguageConfiguration = require('./command-add_global_language_configuration');
    butrApiInternalCommandAddGlobalLanguageConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'add_global_title_configuration':
    var butrApiInternalCommandAddGlobalTitleConfiguration = require('./command-add_global_title_configuration');
    butrApiInternalCommandAddGlobalTitleConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'add_group':
    var butrApiInternalCommandAddGroup = require('./command-add_group');
    butrApiInternalCommandAddGroup.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'add_message':
	var butrApiInternalCommandAddMessage = require('./command-add_message');
	butrApiInternalCommandAddMessage.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'add_module':
	var butrApiInternalCommandAddModule = require('./command-add_module');
	butrApiInternalCommandAddModule.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'add_partition':
	var butrApiInternalCommandAddPartition = require('./command-add_partition');
	butrApiInternalCommandAddPartition.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'add_permission':
	var butrApiInternalCommandAddPermission = require('./command-add_permission');
	butrApiInternalCommandAddPermission.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'add_registration':
	var butrApiInternalCommandAddRegistration = require('./command-add_registration');
	butrApiInternalCommandAddRegistration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'add_role':
	var butrApiInternalCommandAddRole = require('./command-add_role');
	butrApiInternalCommandAddRole.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'add_security_authentication_method_configuration':
    var butrApiInternalCommandAddSecurityAuthenticationMethodConfiguration = require('./command-add_security_authentication_method_configuration');
    butrApiInternalCommandAddSecurityAuthenticationMethodConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'add_security_client_type_configuration':
    var butrApiInternalCommandAddSecurityClientTypeConfiguration = require('./command-add_security_client_type_configuration');
    butrApiInternalCommandAddSecurityClientTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'add_system_dock_type_configuration':
    var butrApiInternalCommandAddSystemDockTypeConfiguration = require('./command-add_system_dock_type_configuration');
    butrApiInternalCommandAddSystemDockTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'add_system_log_type_configuration':
    var butrApiInternalCommandAddSystemLogTypeConfiguration = require('./command-add_system_log_type_configuration');
    butrApiInternalCommandAddSystemLogTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'add_table':
    var butrApiInternalCommandAddTable = require('./command-add_table');
    butrApiInternalCommandAddTable.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'add_user':
    var butrApiInternalCommandAddUser = require('./command-add_user');
    butrApiInternalCommandAddUser.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'check_session_alive':
    var butrApiInternalCommandCheckSessionAlive = require('./command-check_session_alive');
    butrApiInternalCommandCheckSessionAlive.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'create_session':
    var butrApiInternalCommandCreateSession = require('./command-create_session');
    butrApiInternalCommandCreateSession.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'end_session':
    var butrApiInternalCommandEndSession = require('./command-end_session');
    butrApiInternalCommandEndSession.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'fetch_country':
	var butrApiInternalCommandFetchCountry = require('./command-fetch_country');
	butrApiInternalCommandFetchCountry.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_dock':
	var butrApiInternalCommandFetchDock = require('./command-fetch_dock');
	butrApiInternalCommandFetchDock.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_dock_item':
	var butrApiInternalCommandFetchDockItem = require('./command-fetch_dock_item');
	butrApiInternalCommandFetchDockItem.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_dock_subitem':
	var butrApiInternalCommandFetchDockSubitem = require('./command-fetch_dock_subitem');
	butrApiInternalCommandFetchDockSubitem.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_dock_tab':
	var butrApiInternalCommandFetchDockTab = require('./command-fetch_dock_tab');
	butrApiInternalCommandFetchDockTab.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_global_configuration':
    var butrApiInternalCommandFetchGlobalConfiguration = require('./command-fetch_global_configuration');
    butrApiInternalCommandFetchGlobalConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'fetch_global_language_configuration':
    var butrApiInternalCommandFetchGlobalLanguageConfiguration = require('./command-fetch_global_language_configuration');
    butrApiInternalCommandFetchGlobalLanguageConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'fetch_global_title_configuration':
    var butrApiInternalCommandFetchGlobalTitleConfiguration = require('./command-fetch_global_title_configuration');
    butrApiInternalCommandFetchGlobalTitleConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'fetch_group':
    var butrApiInternalCommandFetchGroup = require('./command-fetch_group');
    butrApiInternalCommandFetchGroup.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'fetch_message':
	var butrApiInternalCommandFetchMessage = require('./command-fetch_message');
	butrApiInternalCommandFetchMessage.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_module':
	var butrApiInternalCommandFetchModule = require('./command-fetch_module');
	butrApiInternalCommandFetchModule.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_partition':
	var butrApiInternalCommandFetchPartition = require('./command-fetch_partition');
	butrApiInternalCommandFetchPartition.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_permission':
	var butrApiInternalCommandFetchPermission = require('./command-fetch_permission');
	butrApiInternalCommandFetchPermission.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_registration':
	var butrApiInternalCommandFetchRegistration = require('./command-fetch_registration');
	butrApiInternalCommandFetchRegistration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_role':
	var butrApiInternalCommandFetchRole = require('./command-fetch_role');
	butrApiInternalCommandFetchRole.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_security_authentication_method_configuration':
    var butrApiInternalCommandFetchSecurityAuthenticationMethodConfiguration = require('./command-fetch_security_authentication_method_configuration');
    butrApiInternalCommandFetchSecurityAuthenticationMethodConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'fetch_security_client_type_configuration':
    var butrApiInternalCommandFetchSecurityClientTypeConfiguration = require('./command-fetch_security_client_type_configuration');
    butrApiInternalCommandFetchSecurityClientTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'fetch_session':
    var butrApiInternalCommandFetchSession = require('./command-fetch_session');
    butrApiInternalCommandFetchSession.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'fetch_system_branding':
    var butrApiInternalCommandFetchSystemBranding = require('./command-fetch_system_branding');
    butrApiInternalCommandFetchSystemBranding.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'fetch_system_dock_type_configuration':
    var butrApiInternalCommandFetchSystemDockTypeConfiguration = require('./command-fetch_system_dock_type_configuration');
    butrApiInternalCommandFetchSystemDockTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'fetch_system_log_type_configuration':
    var butrApiInternalCommandFetchSystemLogTypeConfiguration = require('./command-fetch_system_log_type_configuration');
    butrApiInternalCommandFetchSystemLogTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'fetch_table':
	var butrApiInternalCommandFetchTable = require('./command-fetch_table');
	butrApiInternalCommandFetchTable.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'fetch_user':
	var butrApiInternalCommandFetchUser = require('./command-fetch_user');
	butrApiInternalCommandFetchUser.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_countries':
	var butrApiInternalCommandListCountries = require('./command-list_countries');
	butrApiInternalCommandListCountries.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_dock_items':
	var butrApiInternalCommandListDockItems = require('./command-list_dock_items');
	butrApiInternalCommandListDockItems.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_dock_subitems':
	var butrApiInternalCommandListDockSubitems = require('./command-list_dock_subitems');
	butrApiInternalCommandListDockSubitems.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_dock_tabs':
	var butrApiInternalCommandListDockTabs = require('./command-list_dock_tabs');
	butrApiInternalCommandListDockTabs.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_docks':
	var butrApiInternalCommandListDocks = require('./command-list_docks');
	butrApiInternalCommandListDocks.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_global_configurations':
    var butrApiInternalCommandListGlobalConfigurations = require('./command-list_global_configurations');
    butrApiInternalCommandListGlobalConfigurations.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'list_global_language_configurations':
    var butrApiInternalCommandListGlobalLanguageConfigurations = require('./command-list_global_language_configurations');
    butrApiInternalCommandListGlobalLanguageConfigurations.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'list_global_title_configurations':
    var butrApiInternalCommandListGlobalTitleConfigurations = require('./command-list_global_title_configurations');
    butrApiInternalCommandListGlobalTitleConfigurations.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'list_groups':
    var butrApiInternalCommandListGroups = require('./command-list_groups');
    butrApiInternalCommandListGroups.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'list_messages':
	var butrApiInternalCommandListMessages = require('./command-list_messages');
	butrApiInternalCommandListMessages.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_modules':
	var butrApiInternalCommandListModules = require('./command-list_modules');
	butrApiInternalCommandListModules.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_partitions':
	var butrApiInternalCommandListPartitions = require('./command-list_partitions');
	butrApiInternalCommandListPartitions.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_permissions':
	var butrApiInternalCommandListPermissions = require('./command-list_permissions');
	butrApiInternalCommandListPermissions.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_registrations':
	var butrApiInternalCommandListRegistrations = require('./command-list_registrations');
	butrApiInternalCommandListRegistrations.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_roles':
	var butrApiInternalCommandListRoles = require('./command-list_roles');
	butrApiInternalCommandListRoles.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_security_authentication_method_configurations':
    var butrApiInternalCommandListSecurityAuthenticationMethodConfiguration = require('./command-list_security_authentication_method_configurations');
    butrApiInternalCommandListSecurityAuthenticationMethodConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'list_security_client_type_configurations':
	var butrApiInternalCommandListSecurityClientTypeConfigurations = require('./command-list_security_client_type_configurations');
	butrApiInternalCommandListSecurityClientTypeConfigurations.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_system_dock_type_configurations':
    var butrApiInternalCommandListSystemDockTypeConfigurations = require('./command-list_system_dock_type_configurations');
    butrApiInternalCommandListSystemDockTypeConfigurations.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'list_system_log_type_configurations':
    var butrApiInternalCommandListSystemLogTypeConfigurations = require('./command-list_system_log_type_configurations');
    butrApiInternalCommandListSystemLogTypeConfigurations.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'list_tables':
	var butrApiInternalCommandListTables = require('./command-list_tables');
	butrApiInternalCommandListTables.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_user_dock_tabs':
	var butrApiInternalCommandListUserDockTabs = require('./command-list_user_dock_tabs');
	butrApiInternalCommandListUserDockTabs.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'list_user_docks':
    var butrApiInternalCommandListUserDocks = require('./command-list_user_docks');
    butrApiInternalCommandListUserDocks.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'list_users':
	var butrApiInternalCommandListUsers = require('./command-list_users');
	butrApiInternalCommandListUsers.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_country':
    var butrApiInternalCommandModifyCountry = require('./command-modify_country');
    butrApiInternalCommandModifyCountry.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'modify_dock':
	var butrApiInternalCommandModifyDock = require('./command-modify_dock');
	butrApiInternalCommandModifyDock.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_dock_item':
	var butrApiInternalCommandModifyDockItem = require('./command-modify_dock_item');
	butrApiInternalCommandModifyDockItem.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_dock_subitem':
	var butrApiInternalCommandModifyDockSubitem = require('./command-modify_dock_subitem');
	butrApiInternalCommandModifyDockSubitem.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_dock_tab':
	var butrApiInternalCommandModifyDockTab = require('./command-modify_dock_tab');
	butrApiInternalCommandModifyDockTab.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_global_configuration':
    var butrApiInternalCommandModifyGlobalConfiguration = require('./command-modify_global_configuration');
    butrApiInternalCommandModifyGlobalConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'modify_global_language_configuration':
    var butrApiInternalCommandModifyGlobalLanguageConfiguration = require('./command-modify_global_language_configuration');
    butrApiInternalCommandModifyGlobalLanguageConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'modify_global_title_configuration':
    var butrApiInternalCommandModifyGlobalTitleConfiguration = require('./command-modify_global_title_configuration');
    butrApiInternalCommandModifyGlobalTitleConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'modify_group':
    var butrApiInternalCommandModifyGroup = require('./command-modify_group');
    butrApiInternalCommandModifyGroup.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'modify_message':
	var butrApiInternalCommandModifyMessage = require('./command-modify_message');
	butrApiInternalCommandModifyMessage.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_module':
	var butrApiInternalCommandModifyModule = require('./command-modify_module');
	butrApiInternalCommandModifyModule.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_partition':
	var butrApiInternalCommandModifyPartition = require('./command-modify_partition');
	butrApiInternalCommandModifyPartition.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_permission':
	var butrApiInternalCommandModifyPermission = require('./command-modify_permission');
	butrApiInternalCommandModifyPermission.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_registration':
	var butrApiInternalCommandModifyRegistration = require('./command-modify_registration');
	butrApiInternalCommandModifyRegistration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_role':
	var butrApiInternalCommandModifyRole = require('./command-modify_role');
	butrApiInternalCommandModifyRole.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_security_authentication_method_configuration':
    var butrApiInternalCommandModifySecurityAuthenticationMethodConfiguration = require('./command-modify_security_authentication_method_configuration');
    butrApiInternalCommandModifySecurityAuthenticationMethodConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'modify_security_client_type_configuration':
    var butrApiInternalCommandModifySecurityClientTypeConfiguration = require('./command-modify_security_client_type_configuration');
    butrApiInternalCommandModifySecurityClientTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'modify_system_dock_type_configuration':
    var butrApiInternalCommandModifySystemDockTypeConfiguration = require('./command-modify_system_dock_type_configuration');
    butrApiInternalCommandModifySystemDockTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'modify_system_log_type_configuration':
    var butrApiInternalCommandModifySystemLogTypeConfiguration = require('./command-modify_system_log_type_configuration');
    butrApiInternalCommandModifySystemLogTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'modify_table':
	var butrApiInternalCommandModifyTable = require('./command-modify_table');
	butrApiInternalCommandModifyTable.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'modify_user':
	var butrApiInternalCommandModifyUser = require('./command-modify_user');
	butrApiInternalCommandModifyUser.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'ping':
    var butrApiInternalCommandPing = require('./command-ping');
    return butrApiInternalCommandPing.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'remove_country':
	var butrApiInternalCommandRemoveCountry = require('./command-remove_country');
	butrApiInternalCommandRemoveCountry.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_dock':
	var butrApiInternalCommandRemoveDock = require('./command-remove_dock');
	butrApiInternalCommandRemoveDock.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_dock_item':
	var butrApiInternalCommandRemoveDockItem = require('./command-remove_dock_item');
	butrApiInternalCommandRemoveDockItem.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_dock_subitem':
	var butrApiInternalCommandRemoveDockSubitem = require('./command-remove_dock_subitem');
	butrApiInternalCommandRemoveDockSubitem.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_dock_tab':
	var butrApiInternalCommandRemoveDockTab = require('./command-remove_dock_tab');
	butrApiInternalCommandRemoveDockTab.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_global_configuration':
    var butrApiInternalCommandRemoveGlobalConfiguration = require('./command-remove_global_configuration');
    butrApiInternalCommandRemoveGlobalConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'remove_global_language_configuration':
    var butrApiInternalCommandRemoveGlobalLanguageConfiguration = require('./command-remove_global_language_configuration');
    butrApiInternalCommandRemoveGlobalLanguageConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'remove_global_title_configuration':
    var butrApiInternalCommandRemoveGlobalTitleConfiguration = require('./command-remove_global_title_configuration');
    butrApiInternalCommandRemoveGlobalTitleConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'remove_group':
    var butrApiInternalCommandRemoveGroup = require('./command-remove_group');
    butrApiInternalCommandRemoveGroup.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'remove_message':
	var butrApiInternalCommandRemoveMessage = require('./command-remove_message');
	butrApiInternalCommandRemoveMessage.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_module':
	var butrApiInternalCommandRemoveModule = require('./command-remove_module');
	butrApiInternalCommandRemoveModule.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_partition':
	var butrApiInternalCommandRemovePartition = require('./command-remove_partition');
	butrApiInternalCommandRemovePartition.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_permission':
	var butrApiInternalCommandRemovePermission = require('./command-remove_permission');
	butrApiInternalCommandRemovePermission.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_registration':
	var butrApiInternalCommandRemoveRegistration = require('./command-remove_registration');
	butrApiInternalCommandRemoveRegistration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_role':
	var butrApiInternalCommandRemoveRole = require('./command-remove_role');
	butrApiInternalCommandRemoveRole.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_security_authentication_method_configuration':
    var butrApiInternalCommandRemoveSecurityAuthenticationMethodConfiguration = require('./command-remove_security_authentication_method_configuration');
    butrApiInternalCommandRemoveSecurityAuthenticationMethodConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'remove_security_client_type_configuration':
    var butrApiInternalCommandRemoveSecurityClientTypeConfiguration = require('./command-remove_security_client_type_configuration');
    butrApiInternalCommandRemoveSecurityClientTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'remove_system_dock_type_configuration':
    var butrApiInternalCommandRemoveSystemDockTypeConfiguration = require('./command-remove_system_dock_type_configuration');
    butrApiInternalCommandRemoveSystemDockTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'remove_system_log_type_configuration':
    var butrApiInternalCommandRemoveSystemLogTypeConfiguration = require('./command-remove_system_log_type_configuration');
    butrApiInternalCommandRemoveSystemLogTypeConfiguration.execute(res, metaJson, messageFormat, messageInternal, sessionData);
    break;
  case 'remove_table':
	var butrApiInternalCommandRemoveTable = require('./command-remove_table');
	butrApiInternalCommandRemoveTable.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  case 'remove_user':
	var butrApiInternalCommandRemoveUser = require('./command-remove_user');
	butrApiInternalCommandRemoveUser.execute(res, metaJson, messageFormat, messageInternal, sessionData);
	break;
  default:
    if(messageFormat === butrConstants.MESSAGE_FORMAT_JSON) {
      return butrApiJsonError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_UNKNOWN_COMMAND, messageName, sessionData.token, metaJson, sessionData);
    } else if(messageFormat === butrConstants.MESSAGE_FORMAT_REST) {
      return butrApiRestError.renderAuthenticationError(null, res, butrConstants.SECURITY_ERROR_UNKNOWN_COMMAND, messageName, sessionData.token, metaJson, sessionData);
    }
    break;
  } 
}

/**
 * Module exports.
 */
module.exports.passMessage = passMessage;