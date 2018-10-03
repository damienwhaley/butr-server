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

/**
 * This converts the message to the internal
 * @param messageName
 * @param snippetJson
 * @returns
 */
function convertMessageInternal(messageName, snippetJson) {
  'use strict';
  var snippetInternal = {};
  
  switch (messageName) {
  case 'add_country':
	var butrApiJsonCommandAddCountry = require('./command-add_country');
	snippetInternal = butrApiJsonCommandAddCountry.convert(snippetJson);
	break;
  case 'add_dock':
	var butrApiJsonCommandAddDock = require('./command-add_dock');
	snippetInternal = butrApiJsonCommandAddDock.convert(snippetJson);
	break;
  case 'add_dock_item':
	var butrApiJsonCommandAddDockItem = require('./command-add_dock_item');
	snippetInternal = butrApiJsonCommandAddDockItem.convert(snippetJson);
	break;
  case 'add_dock_subitem':
	var butrApiJsonCommandAddDockSubitem = require('./command-add_dock_subitem');
	snippetInternal = butrApiJsonCommandAddDockSubitem.convert(snippetJson);
	break;
  case 'add_dock_subtab':
	var butrApiJsonCommandAddDockSubtab = require('./command-add_dock_subtab');
	snippetInternal = butrApiJsonCommandAddDockSubtab.convert(snippetJson);
	break;
  case 'add_dock_tab':
	var butrApiJsonCommandAddDockTab = require('./command-add_dock_tab');
	snippetInternal = butrApiJsonCommandAddDockTab.convert(snippetJson);
	break;
  case 'add_global_configuration':
    var butrApiJsonCommandAddGlobalConfiguration = require('./command-add_global_configuration');
    snippetInternal = butrApiJsonCommandAddGlobalConfiguration.convert(snippetJson);
    break;
  case 'add_global_language_configuration':
    var butrApiJsonCommandAddGlobalLanguageConfiguration = require('./command-add_global_language_configuration');
    snippetInternal = butrApiJsonCommandAddGlobalLanguageConfiguration.convert(snippetJson);
    break;
  case 'add_global_title_configuration':
    var butrApiJsonCommandAddGlobalTitleConfiguration = require('./command-add_global_title_configuration');
    snippetInternal = butrApiJsonCommandAddGlobalTitleConfiguration.convert(snippetJson);
    break;
  case 'add_group':
    var butrApiJsonCommandAddGroup = require('./command-add_group');
    snippetInternal = butrApiJsonCommandAddGroup.convert(snippetJson);
    break;
  case 'add_message':
	var butrApiJsonCommandAddMessage = require('./command-add_message');
	snippetInternal = butrApiJsonCommandAddMessage.convert(snippetJson);
	break;
  case 'add_module':
	var butrApiJsonCommandAddModule = require('./command-add_module');
	snippetInternal = butrApiJsonCommandAddModule.convert(snippetJson);
	break;
  case 'add_partition':
	var butrApiJsonCommandAddPartition = require('./command-add_partition');
	snippetInternal = butrApiJsonCommandAddPartition.convert(snippetJson);
	break;
  case 'add_permission':
	var butrApiJsonCommandAddPermission = require('./command-add_permission');
	snippetInternal = butrApiJsonCommandAddPermission.convert(snippetJson);
	break;
  case 'add_registration':
	var butrApiJsonCommandAddRegistration = require('./command-add_registration');
	snippetInternal = butrApiJsonCommandAddRegistration.convert(snippetJson);
	break;
  case 'add_role':
	var butrApiJsonCommandAddRole = require('./command-add_role');
	snippetInternal = butrApiJsonCommandAddRole.convert(snippetJson);
	break;
  case 'add_security_authentication_method_configuration':
    var butrApiJsonCommandAddSecurityAuthenticationMethodConfiguration = require('./command-add_security_authentication_method_configuration');
    snippetInternal = butrApiJsonCommandAddSecurityAuthenticationMethodConfiguration.convert(snippetJson);
    break;
  case 'add_security_client_type_configuration':
    var butrApiJsonCommandAddSecurityClientTypeConfiguration = require('./command-add_security_client_type_configuration');
    snippetInternal = butrApiJsonCommandAddSecurityClientTypeConfiguration.convert(snippetJson);
    break;
  case 'add_system_dock_type_configuration':
    var butrApiJsonCommandAddSystemDockTypeConfiguration = require('./command-add_system_dock_type_configuration');
    snippetInternal = butrApiJsonCommandAddSystemDockTypeConfiguration.convert(snippetJson);
    break;
  case 'add_system_log_type_configuration':
    var butrApiJsonCommandAddSystemLogTypeConfiguration = require('./command-add_system_log_type_configuration');
    snippetInternal = butrApiJsonCommandAddSystemLogTypeConfiguration.convert(snippetJson);
    break;
  case 'add_table':
    var butrApiJsonCommandAddTable = require('./command-add_table');
    snippetInternal = butrApiJsonCommandAddTable.convert(snippetJson);
    break;
  case 'add_user':
    var butrApiJsonCommandAddUser = require('./command-add_user');
    snippetInternal = butrApiJsonCommandAddUser.convert(snippetJson);
    break;
  case 'check_session_alive':
    var butrApiJsonCommandCheckSessionAlive = require('./command-check_session_alive');
    snippetInternal = butrApiJsonCommandCheckSessionAlive.convert(snippetJson);
    break;
  case 'create_session':
    var butrApiJsonCommandCreateSession = require('./command-create_session');
    snippetInternal = butrApiJsonCommandCreateSession.convert(snippetJson);
    break;
  case 'end_session':
    var butrApiJsonCommandEndSession = require('./command-create_session');
    snippetInternal = butrApiJsonCommandEndSession.convert(snippetJson);
    break;
  case 'fetch_country':
	var butrApiJsonCommandFetchCountry = require('./command-fetch_country');
	snippetInternal = butrApiJsonCommandFetchCountry.convert(snippetJson);
	break;
  case 'fetch_dock':
	var butrApiJsonCommandFetchDock = require('./command-fetch_dock');
	snippetInternal = butrApiJsonCommandFetchDock.convert(snippetJson);
	break;
  case 'fetch_dock_item':
	var butrApiJsonCommandFetchDockItem = require('./command-fetch_dock_item');
	snippetInternal = butrApiJsonCommandFetchDockItem.convert(snippetJson);
	break;
  case 'fetch_dock_subitem':
	var butrApiJsonCommandFetchDockSubitem = require('./command-fetch_dock_subitem');
	snippetInternal = butrApiJsonCommandFetchDockSubitem.convert(snippetJson);
	break;
  case 'fetch_dock_subtab':
	var butrApiJsonCommandFetchDockSubtab = require('./command-fetch_dock_subtab');
	snippetInternal = butrApiJsonCommandFetchDockSubtab.convert(snippetJson);
	break;
  case 'fetch_dock_tab':
	var butrApiJsonCommandFetchDockTab = require('./command-fetch_dock_tab');
	snippetInternal = butrApiJsonCommandFetchDockTab.convert(snippetJson);
	break;
  case 'fetch_global_configuration':
    var butrApiJsonCommandFetchGlobalConfiguration = require('./command-fetch_global_configuration');
    snippetInternal = butrApiJsonCommandFetchGlobalConfiguration.convert(snippetJson);
    break;
  case 'fetch_global_language_configuration':
    var butrApiJsonCommandFetchGlobalLanguageConfiguration = require('./command-fetch_global_language_configuration');
    snippetInternal = butrApiJsonCommandFetchGlobalLanguageConfiguration.convert(snippetJson);
    break;
  case 'fetch_global_title_configuration':
    var butrApiJsonCommandFetchGlobalTitleConfiguration = require('./command-fetch_global_title_configuration');
    snippetInternal = butrApiJsonCommandFetchGlobalTitleConfiguration.convert(snippetJson);
    break;
  case 'fetch_group':
    var butrApiJsonCommandFetchGroup = require('./command-fetch_group');
    snippetInternal = butrApiJsonCommandFetchGroup.convert(snippetJson);
    break;
  case 'fetch_message':
    var butrApiJsonCommandFetchMessage = require('./command-fetch_message');
    snippetInternal = butrApiJsonCommandFetchMessage.convert(snippetJson);
	break;
  case 'fetch_module':
    var butrApiJsonCommandFetchModule = require('./command-fetch_module');
    snippetInternal = butrApiJsonCommandFetchModule.convert(snippetJson);
	break;
  case 'fetch_partition':
    var butrApiJsonCommandFetchPartition = require('./command-fetch_partition');
    snippetInternal = butrApiJsonCommandFetchPartition.convert(snippetJson);
	break;
  case 'fetch_permission':
    var butrApiJsonCommandFetchPermission = require('./command-fetch_permission');
    snippetInternal = butrApiJsonCommandFetchPermission.convert(snippetJson);
	break;
  case 'fetch_registration':
    var butrApiJsonCommandFetchRegistration = require('./command-fetch_registration');
    snippetInternal = butrApiJsonCommandFetchRegistration.convert(snippetJson);
    break;
  case 'fetch_role':
    var butrApiJsonCommandFetchRole = require('./command-fetch_role');
    snippetInternal = butrApiJsonCommandFetchRole.convert(snippetJson);
    break;
  case 'fetch_security_authentication_method_configuration':
    var butrApiJsonCommandFetchSecurityAuthenticationMethodConfiguration = require('./command-fetch_security_authentication_method_configuration');
    snippetInternal = butrApiJsonCommandFetchSecurityAuthenticationMethodConfiguration.convert(snippetJson);
    break;
  case 'fetch_security_client_type_configuration':
    var butrApiJsonCommandFetchSecurityClientTypeConfiguration = require('./command-fetch_security_client_type_configuration');
    snippetInternal = butrApiJsonCommandFetchSecurityClientTypeConfiguration.convert(snippetJson);
    break;
  case 'fetch_session':
    var butrApiJsonCommandFetchSession = require('./command-fetch_session');
    snippetInternal = butrApiJsonCommandFetchSession.convert(snippetJson);
    break;
  case 'fetch_system_branding':
    var butrApiJsonCommandFetchSystemBranding = require('./command-fetch_system_branding');
    snippetInternal = butrApiJsonCommandFetchSystemBranding.convert(snippetJson);
    break;
  case 'fetch_system_dock_type_configuration':
    var butrApiJsonCommandFetchSystemDockTypeConfiguration = require('./command-fetch_system_dock_type_configuration');
    snippetInternal = butrApiJsonCommandFetchSystemDockTypeConfiguration.convert(snippetJson);
    break;
  case 'fetch_system_log_type_configuration':
    var butrApiJsonCommandFetchSystemLogTypeConfiguration = require('./command-fetch_system_log_type_configuration');
    snippetInternal = butrApiJsonCommandFetchSystemLogTypeConfiguration.convert(snippetJson);
    break;
  case 'fetch_table':
    var butrApiJsonCommandFetchTable = require('./command-fetch_table');
    snippetInternal = butrApiJsonCommandFetchTable.convert(snippetJson);
    break;
  case 'fetch_user':
	var butrApiJsonCommandFetchUser = require('./command-fetch_user');
	snippetInternal = butrApiJsonCommandFetchUser.convert(snippetJson);
	break;
  case 'list_countries':
	var butrApiJsonCommandListCountries = require('./command-list_countries');
	snippetInternal = butrApiJsonCommandListCountries.convert(snippetJson);
	break;
  case 'list_dock_items':
	var butrApiJsonCommandListDockItems = require('./command-list_dock_items');
	snippetInternal = butrApiJsonCommandListDockItems.convert(snippetJson);
	break;
  case 'list_dock_subitems':
	var butrApiJsonCommandListDockSubitems = require('./command-list_dock_subitems');
	snippetInternal = butrApiJsonCommandListDockSubitems.convert(snippetJson);
	break;
  case 'list_dock_subtabs':
	var butrApiJsonCommandListDockSubtabs = require('./command-list_dock_subtabs');
	snippetInternal = butrApiJsonCommandListDockSubtabs.convert(snippetJson);
	break;
  case 'list_dock_tabs':
	var butrApiJsonCommandListDockTabs = require('./command-list_dock_tabs');
	snippetInternal = butrApiJsonCommandListDockTabs.convert(snippetJson);
	break;
  case 'list_docks':
	var butrApiJsonCommandListDocks = require('./command-list_docks');
	snippetInternal = butrApiJsonCommandListDocks.convert(snippetJson);
	break;
  case 'list_global_configurations':
    var butrApiJsonCommandListGlobalConfigurations = require('./command-list_global_configurations');
    snippetInternal = butrApiJsonCommandListGlobalConfigurations.convert(snippetJson);
    break;
  case 'list_global_language_configurations':
    var butrApiJsonCommandListGlobalLanguageConfigurations = require('./command-list_global_language_configurations');
    snippetInternal = butrApiJsonCommandListGlobalLanguageConfigurations.convert(snippetJson);
    butrApiJsonCommandListGlobalLanguageConfigurations = null;
    break;
  case 'list_global_title_configurations':
    var butrApiJsonCommandListGlobalTitleConfigurations = require('./command-list_global_title_configurations');
    snippetInternal = butrApiJsonCommandListGlobalTitleConfigurations.convert(snippetJson);
    break;
  case 'list_groups':
    var butrApiJsonCommandListGroups = require('./command-list_groups');
    snippetInternal = butrApiJsonCommandListGroups.convert(snippetJson);
    break;
  case 'list_messages':
	var butrApiJsonCommandListMessages = require('./command-list_messages');
	snippetInternal = butrApiJsonCommandListMessages.convert(snippetJson);
	break;
  case 'list_modules':
	var butrApiJsonCommandListModules = require('./command-list_modules');
	snippetInternal = butrApiJsonCommandListModules.convert(snippetJson);
	break;
  case 'list_partitions':
	var butrApiJsonCommandListPartitions = require('./command-list_modules');
	snippetInternal = butrApiJsonCommandListPartitions.convert(snippetJson);
	break;
  case 'list_permissions':
	var butrApiJsonCommandListPermissions = require('./command-list_permissions');
	snippetInternal = butrApiJsonCommandListPermissions.convert(snippetJson);
	break;
  case 'list_registrations':
	var butrApiJsonCommandListRegistrations = require('./command-list_registrations');
	snippetInternal = butrApiJsonCommandListRegistrations.convert(snippetJson);
	break;
  case 'list_roles':
	var butrApiJsonCommandListRoles = require('./command-list_roles');
	snippetInternal = butrApiJsonCommandListRoles.convert(snippetJson);
	break;
  case 'list_security_authentication_method_configurations':
    var butrApiJsonCommandListSecurityAuthenticationMethodConfiguration = require('./command-list_security_authentication_method_configurations');
    snippetInternal = butrApiJsonCommandListSecurityAuthenticationMethodConfiguration.convert(snippetJson);
    break;
  case 'list_security_client_type_configurations':
	var butrApiJsonCommandListSecurityClientTypeConfigurations = require('./command-list_security_client_type_configurations');
	snippetInternal = butrApiJsonCommandListSecurityClientTypeConfigurations.convert(snippetJson);
	break;
  case 'list_system_dock_type_configurations':
	var butrApiJsonCommandListSystemDockTypeConfigurations = require('./command-list_system_dock_type_configurations');
	snippetInternal = butrApiJsonCommandListSystemDockTypeConfigurations.convert(snippetJson);
	break;
  case 'list_system_log_type_configurations':
	var butrApiJsonCommandListSystemLogTypeConfigurations = require('./command-list_system_log_type_configurations');
	snippetInternal = butrApiJsonCommandListSystemLogTypeConfigurations.convert(snippetJson);
	break;
  case 'list_tables':
	var butrApiJsonCommandListTables = require('./command-list_tables');
	snippetInternal = butrApiJsonCommandListTables.convert(snippetJson);
	break;
  case 'list_user_dock_tabs':
	var butrApiJsonCommandListUserDockTabs = require('./command-list_user_dock_tabs');
	snippetInternal = butrApiJsonCommandListUserDockTabs.convert(snippetJson);
	break;
  case 'list_user_docks':
    var butrApiJsonCommandListUserDocks = require('./command-list_user_docks');
    snippetInternal = butrApiJsonCommandListUserDocks.convert(snippetJson);
    break;
  case 'list_users':
	var butrApiJsonCommandListUsers = require('./command-list_users');
	snippetInternal = butrApiJsonCommandListUsers.convert(snippetJson);
	break;
  case 'modify_country':
	var butrApiJsonCommandModifyCountry = require('./command-modify_country');
	snippetInternal = butrApiJsonCommandModifyCountry.convert(snippetJson);
	break;
  case 'modify_dock':
	var butrApiJsonCommandModifyDock = require('./command-modify_dock');
	snippetInternal = butrApiJsonCommandModifyDock.convert(snippetJson);
	break;
  case 'modify_dock_item':
	var butrApiJsonCommandModifyDockItem = require('./command-modify_dock_item');
	snippetInternal = butrApiJsonCommandModifyDockItem.convert(snippetJson);
	break;
  case 'modify_dock_subitem':
	var butrApiJsonCommandModifyDockSubitem = require('./command-modify_dock_subitem');
	snippetInternal = butrApiJsonCommandModifyDockSubitem.convert(snippetJson);
	break;
  case 'modify_dock_subtab':
	var butrApiJsonCommandModifyDockSubtab = require('./command-modify_dock_subtab');
	snippetInternal = butrApiJsonCommandModifyDockSubtab.convert(snippetJson);
	break;
  case 'modify_dock_tab':
	var butrApiJsonCommandModifyDockTab = require('./command-modify_dock_tab');
	snippetInternal = butrApiJsonCommandModifyDockTab.convert(snippetJson);
	break;
  case 'modify_global_configuration':
    var butrApiJsonCommandModifyGlobalConfiguration = require('./command-modify_global_configuration');
    snippetInternal = butrApiJsonCommandModifyGlobalConfiguration.convert(snippetJson);
    break;
  case 'modify_global_language_configuration':
    var butrApiJsonCommandModifyGlobalLanguageConfiguration = require('./command-modify_global_language_configuration');
    snippetInternal = butrApiJsonCommandModifyGlobalLanguageConfiguration.convert(snippetJson);
    break;
  case 'modify_global_title_configuration':
    var butrApiJsonCommandModifyGlobalTitleConfiguration = require('./command-modify_global_title_configuration');
    snippetInternal = butrApiJsonCommandModifyGlobalTitleConfiguration.convert(snippetJson);
    break;
  case 'modify_group':
    var butrApiJsonCommandModifyGroup = require('./command-modify_group');
    snippetInternal = butrApiJsonCommandModifyGroup.convert(snippetJson);
    break;
  case 'modify_message':
	var butrApiJsonCommandModifyMessage = require('./command-modify_message');
	snippetInternal = butrApiJsonCommandModifyMessage.convert(snippetJson);
	break;
  case 'modify_module':
	var butrApiJsonCommandModifyModule = require('./command-modify_module');
	snippetInternal = butrApiJsonCommandModifyModule.convert(snippetJson);
	break;
  case 'modify_partition':
	var butrApiJsonCommandModifyPartition = require('./command-modify_partition');
	snippetInternal = butrApiJsonCommandModifyPartition.convert(snippetJson);
	break;
  case 'modify_permission':
	var butrApiJsonCommandModifyPermission = require('./command-modify_permission');
	snippetInternal = butrApiJsonCommandModifyPermission.convert(snippetJson);
	break;
  case 'modify_registration':
	var butrApiJsonCommandModifyRegistration = require('./command-modify_registration');
	snippetInternal = butrApiJsonCommandModifyRegistration.convert(snippetJson);
	break;
  case 'modify_role':
	var butrApiJsonCommandModifyRole = require('./command-modify_role');
	snippetInternal = butrApiJsonCommandModifyRole.convert(snippetJson);
	break;
  case 'modify_security_authentication_method_configuration':
    var butrApiJsonCommandModifySecurityAuthenticationMethodConfiguration = require('./command-modify_security_authentication_method_configuration');
    snippetInternal = butrApiJsonCommandModifySecurityAuthenticationMethodConfiguration.convert(snippetJson);
    break;
  case 'modify_security_client_type_configuration':
    var butrApiJsonCommandModifySecurityClientTypeConfiguration = require('./command-modify_security_client_type_configuration');
    snippetInternal = butrApiJsonCommandModifySecurityClientTypeConfiguration.convert(snippetJson);
    break;
  case 'modify_system_dock_type_configuration':
    var butrApiJsonCommandModifySystemDockTypeConfiguration = require('./command-modify_system_dock_type_configuration');
    snippetInternal = butrApiJsonCommandModifySystemDockTypeConfiguration.convert(snippetJson);
    break;
  case 'modify_system_log_type_configuration':
    var butrApiJsonCommandModifySystemLogTypeConfiguration = require('./command-modify_system_log_type_configuration');
    snippetInternal = butrApiJsonCommandModifySystemLogTypeConfiguration.convert(snippetJson);
    break;
  case 'modify_table':
	var butrApiJsonCommandModifyTable = require('./command-modify_table');
	snippetInternal = butrApiJsonCommandModifyTable.convert(snippetJson);
	break;
  case 'modify_user':
	var butrApiJsonCommandModifyUser = require('./command-modify_user');
	snippetInternal = butrApiJsonCommandModifyUser.convert(snippetJson);
	break;
  case 'ping':
    var butrApiJsonCommandPing = require('./command-ping');
    snippetInternal = butrApiJsonCommandPing.convert(snippetJson);
    break;
  case 'remove_country':
	var butrApiJsonCommandRemoveCountry = require('./command-remove_dock');
	snippetInternal = butrApiJsonCommandRemoveCountry.convert(snippetJson);
	break;
  case 'remove_dock':
	var butrApiJsonCommandRemoveDock = require('./command-remove_dock');
	snippetInternal = butrApiJsonCommandRemoveDock.convert(snippetJson);
	break;
  case 'remove_dock_item':
	var butrApiJsonCommandRemoveDockItem = require('./command-remove_dock_item');
	snippetInternal = butrApiJsonCommandRemoveDockItem.convert(snippetJson);
	break;
  case 'remove_dock_subitem':
	var butrApiJsonCommandRemoveDockSubitem = require('./command-remove_dock_subitem');
	snippetInternal = butrApiJsonCommandRemoveDockSubitem.convert(snippetJson);
	break;
  case 'remove_dock_subtab':
	var butrApiJsonCommandRemoveDockSubtab = require('./command-remove_dock_subtab');
	snippetInternal = butrApiJsonCommandRemoveDockSubtab.convert(snippetJson);
	break;
  case 'remove_dock_tab':
	var butrApiJsonCommandRemoveDockTab = require('./command-remove_dock_tab');
	snippetInternal = butrApiJsonCommandRemoveDockTab.convert(snippetJson);
	break;
  case 'remove_global_configuration':
    var butrApiJsonCommandRemoveGlobalConfiguration = require('./command-remove_global_configuration');
    snippetInternal = butrApiJsonCommandRemoveGlobalConfiguration.convert(snippetJson);
    break;
  case 'remove_global_language_configuration':
    var butrApiJsonCommandRemoveGlobalLanguageConfiguration = require('./command-remove_global_language_configuration');
    snippetInternal = butrApiJsonCommandRemoveGlobalLanguageConfiguration.convert(snippetJson);
    break;
  case 'remove_global_title_configuration':
    var butrApiJsonCommandRemoveGlobalTitleConfiguration = require('./command-remove_global_title_configuration');
    snippetInternal = butrApiJsonCommandRemoveGlobalTitleConfiguration.convert(snippetJson);
    break;
  case 'remove_group':
    var butrApiJsonCommandRemoveGroup = require('./command-remove_group');
    snippetInternal = butrApiJsonCommandRemoveGroup.convert(snippetJson);
    break;
  case 'remove_message':
	var butrApiJsonCommandRemoveMessage = require('./command-remove_message');
	snippetInternal = butrApiJsonCommandRemoveMessage.convert(snippetJson);
	break;
  case 'remove_module':
	var butrApiJsonCommandRemoveModule = require('./command-remove_module');
	snippetInternal = butrApiJsonCommandRemoveModule.convert(snippetJson);
	break;
  case 'remove_partition':
	var butrApiJsonCommandRemovePartition = require('./command-remove_partition');
	snippetInternal = butrApiJsonCommandRemovePartition.convert(snippetJson);
	break;
  case 'remove_permission':
	var butrApiJsonCommandRemovePermission = require('./command-remove_permission');
	snippetInternal = butrApiJsonCommandRemovePermission.convert(snippetJson);
	break;
  case 'remove_registration':
	var butrApiJsonCommandRemoveRegistration = require('./command-remove_registration');
	snippetInternal = butrApiJsonCommandRemoveRegistration.convert(snippetJson);
	break;
  case 'remove_role':
	var butrApiJsonCommandRemoveRole = require('./command-remove_role');
	snippetInternal = butrApiJsonCommandRemoveRole.convert(snippetJson);
	break;
  case 'remove_security_authentication_method_configuration':
    var butrApiJsonCommandRemoveSecurityAuthenticationMethodConfiguration = require('./command-modify_security_authentication_method_configuration');
    snippetInternal = butrApiJsonCommandRemoveSecurityAuthenticationMethodConfiguration.convert(snippetJson);
    break;
  case 'remove_security_client_type_configuration':
    var butrApiJsonCommandRemoveSecurityClientTypeConfiguration = require('./command-modify_security_client_type_configuration');
    snippetInternal = butrApiJsonCommandRemoveSecurityClientTypeConfiguration.convert(snippetJson);
    break;
  case 'remove_system_dock_type_configuration':
    var butrApiJsonCommandRemoveSystemDockTypeConfiguration = require('./command-modify_system_dock_type_configuration');
    snippetInternal = butrApiJsonCommandRemoveSystemDockTypeConfiguration.convert(snippetJson);
    break;
  case 'remove_system_log_type_configuration':
    var butrApiJsonCommandRemoveSystemLogTypeConfiguration = require('./command-modify_system_log_type_configuration');
    snippetInternal = butrApiJsonCommandRemoveSystemLogTypeConfiguration.convert(snippetJson);
    break;
  case 'remove_table':
	var butrApiJsonCommandRemoveTable = require('./command-remove_table');
	snippetInternal = butrApiJsonCommandRemoveTable.convert(snippetJson);
	break;
  case 'remove_user':
	var butrApiJsonCommandRemoveUser = require('./command-remove_user');
	snippetInternal = butrApiJsonCommandRemoveUser.convert(snippetJson);
	break;
  default:
    snippetInternal.content = i18n.__('I don\'t know what the %s command is.', messageName);
    break;
  }
  
  return snippetInternal;
}

/**
 * Module exports
 */
module.exports.convertMessageInternal = convertMessageInternal;