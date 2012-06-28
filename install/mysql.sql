CREATE DATABASE  IF NOT EXISTS `butr` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `butr`;
-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: butr
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `configuration_lookup_security_authentication_methods`
--

DROP TABLE IF EXISTS `configuration_lookup_security_authentication_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_lookup_security_authentication_methods` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `name_label` varchar(100) DEFAULT NULL,
  `display_label` varchar(100) DEFAULT NULL,
  `description` text,
  `weighting` smallint(6) DEFAULT '0',
  `magic` varchar(70) DEFAULT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_dock_subitems_permissions`
--

DROP TABLE IF EXISTS `security_dock_subitems_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_dock_subitems_permissions` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `dock_subitems_id` bigint(20) DEFAULT NULL,
  `permissions_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_modules`
--

DROP TABLE IF EXISTS `system_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_modules` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `magic` varchar(70) DEFAULT NULL,
  `description` text,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy_terms_users`
--

DROP TABLE IF EXISTS `taxonomy_terms_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_terms_users` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `vocabularies_id` bigint(20) DEFAULT NULL,
  `terms_id` bigint(20) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_registrations`
--

DROP TABLE IF EXISTS `security_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_registrations` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `api_public` binary(16) DEFAULT NULL,
  `api_private` binary(32) DEFAULT NULL,
  `security_client_types_id` bigint(20) DEFAULT NULL,
  `description` text,
  `created` timestamp NULL DEFAULT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_dock_items`
--

DROP TABLE IF EXISTS `system_dock_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_dock_items` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `docks_id` bigint(20) DEFAULT NULL,
  `system_dock_types_id` bigint(20) DEFAULT NULL,
  `security_client_types_id` bigint(20) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `description` text,
  `weighting` smallint(6) DEFAULT NULL,
  `picture_path` varchar(500) DEFAULT NULL,
  `item_action` varchar(500) DEFAULT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_lookup_global_languages`
--

DROP TABLE IF EXISTS `configuration_lookup_global_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_lookup_global_languages` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `name_label` varchar(100) DEFAULT NULL,
  `display_label` varchar(100) DEFAULT NULL,
  `description` text,
  `language_code` varchar(20) DEFAULT NULL,
  `language_family` varchar(20) DEFAULT NULL,
  `countries_id` bigint(20) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT '0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_lookup_product_reservation_text_types`
--

DROP TABLE IF EXISTS `configuration_lookup_product_reservation_text_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_lookup_product_reservation_text_types` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `name_label` varchar(100) DEFAULT NULL,
  `display_label` varchar(100) DEFAULT NULL,
  `magic` varchar(70) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_users_permissions`
--

DROP TABLE IF EXISTS `security_users_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_users_permissions` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `partitions_id` bigint(20) DEFAULT NULL,
  `permissions_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_messages_permissions`
--

DROP TABLE IF EXISTS `security_messages_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_messages_permissions` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `messages_id` bigint(20) DEFAULT NULL,
  `permissions_id` bigint(20) DEFAULT NULL,
  `do_partition_check` bit(1) NOT NULL DEFAULT b'0',
  `run_unauthenticated` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_log_queries`
--

DROP TABLE IF EXISTS `system_log_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log_queries` (
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_uuid` binary(16) DEFAULT NULL,
  `transaction_uuid` binary(16) DEFAULT NULL,
  `sql_query` text,
  `log_timestamp` timestamp NULL DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  `is_cacheable` bit(1) NOT NULL DEFAULT b'0',
  `result_from_cache` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17698 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_log_transaction_details`
--

DROP TABLE IF EXISTS `system_log_transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log_transaction_details` (
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint(20) DEFAULT NULL,
  `tables_id` bigint(20) DEFAULT NULL,
  `foreign_tables_id` bigint(20) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `new_text` text,
  `new_integer` bigint(20) DEFAULT NULL,
  `new_float` double DEFAULT NULL,
  `new_datetime` datetime DEFAULT NULL,
  `new_uuid` binary(16) DEFAULT NULL,
  `new_bit` bit(1) DEFAULT b'0',
  `new_sha` binary(32) DEFAULT NULL,
  `old_text` text,
  `old_integer` bigint(20) DEFAULT NULL,
  `old_float` double DEFAULT NULL,
  `old_datetime` datetime DEFAULT NULL,
  `old_uuid` binary(16) DEFAULT NULL,
  `old_bit` bit(1) DEFAULT b'0',
  `old_sha` binary(32) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_commissions`
--

DROP TABLE IF EXISTS `agent_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_commissions` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `commission_name` varchar(100) DEFAULT NULL,
  `display_label` varchar(100) DEFAULT NULL,
  `commission_code` varchar(20) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy_terms`
--

DROP TABLE IF EXISTS `taxonomy_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_terms` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `vocabularies_id` bigint(20) DEFAULT NULL,
  `term_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_exchange_rates`
--

DROP TABLE IF EXISTS `currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_exchange_rates` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `base_currencies_id` bigint(20) DEFAULT NULL,
  `foreign_currencies_id` bigint(20) DEFAULT NULL,
  `buy_rate` decimal(19,4) DEFAULT NULL,
  `sell_rate` decimal(19,4) DEFAULT NULL,
  `sample_rate` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_nonces`
--

DROP TABLE IF EXISTS `security_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_nonces` (
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sessions_id` bigint(20) DEFAULT NULL,
  `nonce` binary(16) DEFAULT NULL,
  `first_used` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=446 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `principal_payment_timings`
--

DROP TABLE IF EXISTS `principal_payment_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `principal_payment_timings` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `timing_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `timing_code` varchar(20) DEFAULT NULL,
  `description` text,
  `deposit_date` date DEFAULT NULL,
  `deposit_days` smallint(6) DEFAULT NULL,
  `intermediate_date` date DEFAULT NULL,
  `intermediate_days` smallint(6) DEFAULT NULL,
  `final_date` date DEFAULT NULL,
  `final_days` smallint(6) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_products`
--

DROP TABLE IF EXISTS `product_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_products` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `product_code` varchar(20) DEFAULT NULL,
  `principals_id` bigint(20) DEFAULT NULL,
  `brochures_id` bigint(20) DEFAULT NULL,
  `capacity` smallint(6) DEFAULT NULL,
  `nights` smallint(6) DEFAULT NULL,
  `lead_days` smallint(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy_terms_principals`
--

DROP TABLE IF EXISTS `taxonomy_terms_principals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_terms_principals` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `vocabularies_id` bigint(20) DEFAULT NULL,
  `terms_id` bigint(20) DEFAULT NULL,
  `principals_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_sessions`
--

DROP TABLE IF EXISTS `security_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_sessions` (
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_table_uuid` binary(16) DEFAULT NULL,
  `users_id` bigint(20) NOT NULL,
  `registrations_id` bigint(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `expiry` datetime NOT NULL,
  `data` text NOT NULL,
  `language_code` varchar(20) DEFAULT NULL,
  `session_length` int(11) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_alternate_products`
--

DROP TABLE IF EXISTS `product_alternate_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alternate_products` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  `alternate_products_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_users`
--

DROP TABLE IF EXISTS `user_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_users` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `global_titles_id` bigint(20) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `preferred_global_languages_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_messages`
--

DROP TABLE IF EXISTS `system_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_messages` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `message_name` varchar(100) DEFAULT NULL,
  `modules_id` bigint(20) DEFAULT NULL,
  `magic` varchar(70) DEFAULT NULL,
  `description` text,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_attached_products`
--

DROP TABLE IF EXISTS `product_attached_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attached_products` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  `attached_products_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_countries`
--

DROP TABLE IF EXISTS `location_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_countries` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `description` text,
  `country_code` varchar(20) DEFAULT NULL,
  `alternate_code` varchar(20) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT '0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_string_translations`
--

DROP TABLE IF EXISTS `system_string_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_string_translations` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `tables_id` bigint(20) DEFAULT NULL,
  `source` text,
  `translation` text,
  `global_languages_id` bigint(20) DEFAULT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brochure_brochures`
--

DROP TABLE IF EXISTS `brochure_brochures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brochure_brochures` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `brochure_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `brochure_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_dock_subitems`
--

DROP TABLE IF EXISTS `system_dock_subitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_dock_subitems` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `dock_items_id` bigint(20) DEFAULT NULL,
  `system_dock_types_id` bigint(20) DEFAULT NULL,
  `security_client_types_id` bigint(20) DEFAULT NULL,
  `subitem_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `description` text,
  `weighting` smallint(6) DEFAULT NULL,
  `picture_path` varchar(500) DEFAULT NULL,
  `subitem_action` varchar(500) DEFAULT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_permissions`
--

DROP TABLE IF EXISTS `security_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_permissions` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `modules_id` bigint(20) DEFAULT NULL,
  `permission_name` varchar(100) NOT NULL,
  `description` text,
  `magic` varchar(70) DEFAULT NULL,
  `importance` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_price_cost_breaks`
--

DROP TABLE IF EXISTS `product_price_cost_breaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price_cost_breaks` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `price_seasons_id` bigint(20) DEFAULT NULL,
  `break_number` tinyint(4) DEFAULT NULL,
  `amount` decimal(19,4) DEFAULT NULL,
  `begin_age` tinyint(4) DEFAULT NULL,
  `end_age` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_brochure_rates`
--

DROP TABLE IF EXISTS `currency_brochure_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_brochure_rates` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `brochures_id` bigint(20) DEFAULT NULL,
  `base_currencies_id` bigint(20) DEFAULT NULL,
  `foreign_currencies_id` bigint(20) DEFAULT NULL,
  `buy_rate` decimal(19,4) DEFAULT NULL,
  `sell_rate` decimal(19,4) DEFAULT NULL,
  `sample_rate` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_lookup_global_titles`
--

DROP TABLE IF EXISTS `configuration_lookup_global_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_lookup_global_titles` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `name_label` varchar(100) DEFAULT NULL,
  `display_label` varchar(100) DEFAULT NULL,
  `description` text,
  `weighting` smallint(6) DEFAULT '0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `integration_third_parties`
--

DROP TABLE IF EXISTS `integration_third_parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integration_third_parties` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `third_party_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_blocks`
--

DROP TABLE IF EXISTS `product_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_blocks` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  `block_date` date DEFAULT NULL,
  `quantity_total` smallint(6) DEFAULT NULL,
  `quantity_allocated` smallint(6) DEFAULT NULL,
  `quantity_sold` smallint(6) DEFAULT NULL,
  `quantity_held` smallint(6) DEFAULT NULL,
  `is_blacked_out` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_lookup_product_price_season_types`
--

DROP TABLE IF EXISTS `configuration_lookup_product_price_season_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_lookup_product_price_season_types` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `name_label` varchar(100) DEFAULT NULL,
  `display_label` varchar(100) DEFAULT NULL,
  `magic` varchar(70) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_tables`
--

DROP TABLE IF EXISTS `system_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_tables` (
  `_table_id` bigint(20) DEFAULT NULL,
  `_table_uuid` binary(16) DEFAULT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `table_name` varchar(255) DEFAULT NULL,
  `current_id` bigint(20) NOT NULL DEFAULT '0',
  `mutex` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_information`
--

DROP TABLE IF EXISTS `product_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_information` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  `information_name` varchar(100) DEFAULT NULL,
  `magic` varchar(70) DEFAULT NULL,
  `description` text,
  `weighting` smallint(6) DEFAULT NULL,
  `information_types_id` bigint(20) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_log_messages`
--

DROP TABLE IF EXISTS `system_log_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log_messages` (
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_uuid` binary(16) DEFAULT NULL,
  `transaction_uuid` binary(16) DEFAULT NULL,
  `messages_id` bigint(20) DEFAULT NULL,
  `log_timestamp` timestamp NULL DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  `request` text,
  `response` text,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11158 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_roles`
--

DROP TABLE IF EXISTS `security_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_roles` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `partitions_id` bigint(20) DEFAULT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `description` text,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_users_credentials`
--

DROP TABLE IF EXISTS `security_users_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_users_credentials` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `security_authentication_methods_id` bigint(20) DEFAULT NULL,
  `remote_username` varchar(100) DEFAULT NULL,
  `password` binary(32) DEFAULT NULL,
  `bearer_token` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`),
  KEY `fk_security_user_credentials_user_id` (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_effective_permissions`
--

DROP TABLE IF EXISTS `security_effective_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_effective_permissions` (
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) DEFAULT NULL,
  `permissions_id` bigint(20) DEFAULT NULL,
  `partitions_id` bigint(20) DEFAULT NULL,
  `magic` varchar(70) DEFAULT NULL,
  `setting` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1620 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_dock_tabs`
--

DROP TABLE IF EXISTS `system_dock_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_dock_tabs` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `security_client_types_id` bigint(20) DEFAULT NULL,
  `system_dock_types_id` bigint(20) DEFAULT NULL,
  `dock_items_id` bigint(20) DEFAULT NULL,
  `dock_subitems_id` bigint(20) DEFAULT NULL,
  `tab_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `description` text,
  `weighting` smallint(6) DEFAULT NULL,
  `picture_path` varchar(500) DEFAULT NULL,
  `tab_action` varchar(500) DEFAULT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_field_translations`
--

DROP TABLE IF EXISTS `system_field_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_field_translations` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `tables_id` bigint(20) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `translation` text,
  `global_languages_id` bigint(20) DEFAULT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_log_transactions`
--

DROP TABLE IF EXISTS `system_log_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log_transactions` (
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_table_uuid` binary(16) DEFAULT NULL,
  `log_timestamp` timestamp NULL DEFAULT NULL,
  `session_uuid` binary(16) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `modules_id` bigint(20) DEFAULT NULL,
  `foreign_modules_id` bigint(20) DEFAULT NULL,
  `tables_id` bigint(20) DEFAULT NULL,
  `foreign_tables_id` bigint(20) DEFAULT NULL,
  `system_log_types_id` bigint(20) DEFAULT NULL,
  `human_readable` text,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy_vocabularies`
--

DROP TABLE IF EXISTS `taxonomy_vocabularies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_vocabularies` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `modules_id` bigint(20) DEFAULT NULL,
  `vocabulary_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_dock_tabs_permissions`
--

DROP TABLE IF EXISTS `security_dock_tabs_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_dock_tabs_permissions` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `dock_tabs_id` bigint(20) DEFAULT NULL,
  `permissions_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_partitions`
--

DROP TABLE IF EXISTS `system_partitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_partitions` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `partition_name` varchar(100) DEFAULT NULL,
  `description` text,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_dock_items_permissions`
--

DROP TABLE IF EXISTS `security_dock_items_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_dock_items_permissions` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `dock_items_id` bigint(20) DEFAULT NULL,
  `permissions_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_price_sell_breaks`
--

DROP TABLE IF EXISTS `product_price_sell_breaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price_sell_breaks` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `price_seasons_id` bigint(20) DEFAULT NULL,
  `currencies_id` bigint(20) DEFAULT NULL,
  `break_number` tinyint(4) DEFAULT NULL,
  `amount` decimal(19,4) DEFAULT NULL,
  `begin_age` tinyint(4) DEFAULT NULL,
  `end_age` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `description` text,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_lookup_product_information_types`
--

DROP TABLE IF EXISTS `configuration_lookup_product_information_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_lookup_product_information_types` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `name_label` varchar(100) DEFAULT NULL,
  `display_label` varchar(100) DEFAULT NULL,
  `magic` varchar(70) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_lookup_security_client_types`
--

DROP TABLE IF EXISTS `configuration_lookup_security_client_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_lookup_security_client_types` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `name_label` varchar(100) DEFAULT NULL,
  `display_label` varchar(100) DEFAULT NULL,
  `description` text,
  `magic` varchar(70) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT '0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_reservation_request_texts`
--

DROP TABLE IF EXISTS `product_reservation_request_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_reservation_request_texts` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  `reservation_text_types_id` bigint(20) DEFAULT NULL,
  `content` text,
  `picture_path` varchar(500) DEFAULT NULL,
  `caption` varchar(200) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT NULL,
  `is_active` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_docks`
--

DROP TABLE IF EXISTS `system_docks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_docks` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `security_client_types_id` bigint(20) DEFAULT NULL,
  `dock_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `description` text,
  `weighting` smallint(6) DEFAULT NULL,
  `picture_path` varchar(500) DEFAULT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_quantities`
--

DROP TABLE IF EXISTS `product_quantities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_quantities` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `quantity_total` smallint(6) DEFAULT NULL,
  `quantity_allocated` smallint(6) DEFAULT NULL,
  `quantity_sold` smallint(6) DEFAULT NULL,
  `quantity_held` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_users_roles`
--

DROP TABLE IF EXISTS `security_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_users_roles` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `roles_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_users_groups`
--

DROP TABLE IF EXISTS `user_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_users_groups` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `groups_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_alerts`
--

DROP TABLE IF EXISTS `product_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alerts` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  `alert_name` varchar(100) DEFAULT NULL,
  `content` text,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `weighting` smallint(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_lookup_system_log_types`
--

DROP TABLE IF EXISTS `configuration_lookup_system_log_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_lookup_system_log_types` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `name_label` varchar(45) DEFAULT NULL,
  `display_label` varchar(45) DEFAULT NULL,
  `description` text,
  `magic` varchar(70) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT '0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_lookup_system_dock_types`
--

DROP TABLE IF EXISTS `configuration_lookup_system_dock_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_lookup_system_dock_types` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `name_label` varchar(45) DEFAULT NULL,
  `display_label` varchar(45) DEFAULT NULL,
  `description` text,
  `magic` varchar(70) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT '0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_price_seasons`
--

DROP TABLE IF EXISTS `product_price_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price_seasons` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  `price_season_types_id` bigint(20) DEFAULT NULL,
  `commissions_id` bigint(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `currencies_id` bigint(20) DEFAULT NULL,
  `payment_timings_id` bigint(20) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy_terms_products`
--

DROP TABLE IF EXISTS `taxonomy_terms_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_terms_products` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `vocabularies_id` bigint(20) DEFAULT NULL,
  `terms_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `principal_principals`
--

DROP TABLE IF EXISTS `principal_principals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `principal_principals` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `principal_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `principal_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_globals`
--

DROP TABLE IF EXISTS `configuration_globals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_globals` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `name_label` varchar(100) NOT NULL,
  `display_label` varchar(100) DEFAULT NULL,
  `magic` varchar(70) DEFAULT NULL,
  `text_setting` text,
  `integer_setting` bigint(20) DEFAULT NULL,
  `float_setting` double DEFAULT NULL,
  `datetime_setting` datetime DEFAULT NULL,
  `uuid_setting` binary(16) DEFAULT NULL,
  `bit_setting` bit(1) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_docks_permissions`
--

DROP TABLE IF EXISTS `security_docks_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_docks_permissions` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `docks_id` bigint(20) DEFAULT NULL,
  `permissions_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_roles_permissions`
--

DROP TABLE IF EXISTS `security_roles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_roles_permissions` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `roles_id` bigint(20) DEFAULT NULL,
  `permissions_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_products_third_parties`
--

DROP TABLE IF EXISTS `product_products_third_parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_products_third_parties` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  `product_code` varchar(20) DEFAULT NULL,
  `third_parties_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_voucher_texts`
--

DROP TABLE IF EXISTS `product_voucher_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_voucher_texts` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  `voucher_name` varchar(100) DEFAULT NULL,
  `content` text,
  `picture_path` varchar(500) DEFAULT NULL,
  `caption` varchar(200) DEFAULT NULL,
  `weighting` smallint(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_currencies`
--

DROP TABLE IF EXISTS `currency_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_currencies` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `currency_name` varchar(100) DEFAULT NULL,
  `currency_code` varchar(20) DEFAULT NULL,
  `currency_symbol` varchar(20) DEFAULT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_products_partitions`
--

DROP TABLE IF EXISTS `product_products_partitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_products_partitions` (
  `_table_id` bigint(20) NOT NULL,
  `_table_uuid` binary(16) NOT NULL,
  `_system_auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_system_valid_from` timestamp NULL DEFAULT NULL,
  `_system_valid_to` timestamp NULL DEFAULT NULL,
  `_system_is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `_system_is_valid` bit(1) NOT NULL DEFAULT b'1',
  `_system_transaction_uuid` binary(16) DEFAULT NULL,
  `_system_previous_id` bigint(20) DEFAULT NULL,
  `_system_next_id` bigint(20) DEFAULT NULL,
  `products_id` bigint(20) DEFAULT NULL,
  `partitions_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_system_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'butr'
--
/*!50003 DROP FUNCTION IF EXISTS `f_BinToSha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `f_BinToSha`(bin BINARY(32)) RETURNS char(64) CHARSET utf8
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
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

    IF ISNULL(bin) THEN
        RETURN NULL;
    ELSE
        RETURN LOWER(HEX(bin));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_BinToUuid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `f_BinToUuid`(bin BINARY(16)) RETURNS char(36) CHARSET utf8
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE hex CHAR(32);

    IF ISNULL(bin) THEN
        RETURN NULL;
    ELSE
        SET hex := HEX(bin);

        RETURN LOWER(CONCAT(LEFT(hex, 8),'-'
                          ,SUBSTR(hex, 9,4),'-'
                          ,SUBSTR(hex,13,4),'-'
                          ,SUBSTR(hex,17,4),'-'
                          ,RIGHT(hex, 12)
                          ));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_BitToOutput` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `f_BitToOutput`(dat BIT(1)) RETURNS tinyint(4)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
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

     RETURN CASE WHEN COALESCE(dat, 0)=1 THEN 1 ELSE 0 END;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_DatetimeToOutput` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `f_DatetimeToOutput`(dat DATETIME) RETURNS varchar(50) CHARSET utf8
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
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

    IF ISNULL(dat) THEN
        RETURN '';
    ELSE
        RETURN DATE_FORMAT(dat, '%Y-%m-%d %T.%s');
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_DatetimeToString` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `f_DatetimeToString`(dat DATETIME) RETURNS varchar(50) CHARSET utf8
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
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

    IF ISNULL(dat) THEN
        RETURN '';
    ELSE
        RETURN DATE_FORMAT(dat, '%e %M %Y %T.%s');
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_DateToOutput` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `f_DateToOutput`(dat DATETIME) RETURNS varchar(50) CHARSET utf8
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
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

    IF ISNULL(dat) THEN
        RETURN '';
    ELSE
        RETURN DATE_FORMAT(dat, '%Y-%m-%d');
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_DateToString` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `f_DateToString`(dat DATETIME) RETURNS varchar(50) CHARSET utf8
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
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

    IF ISNULL(dat) THEN
        RETURN '';
    ELSE
        RETURN DATE_FORMAT(dat, '%e %M %Y');
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_ShaToBin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `f_ShaToBin`(sha CHAR(64) CHARSET utf8) RETURNS binary(32)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
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

    RETURN UNHEX(sha);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_UuidToBin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `f_UuidToBin`(uuid CHAR(36) CHARSET utf8) RETURNS binary(16)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
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

    RETURN UNHEX(REPLACE(uuid, '-',''));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_AddGlobal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_AddGlobal`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_TextSetting TEXT CHARSET utf8,
    IN i_IntegerSetting BIGINT,
    IN i_FloatSetting DOUBLE,
    IN i_DateTimeSetting DATETIME,
    IN i_UuidSetting CHAR(36) CHARSET utf8,
    IN i_BitSetting BIT(1),
    IN i_Description TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_UuidSetting CHAR(36) CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_globals
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        IF i_UuidSetting = '' THEN
            SET v_UuidSetting := NULL;
        ELSE
            SET v_UuidSetting := i_UuidSetting;
        END IF;

        CALL p_system_LockTable('configuration_globals', v_TableId);

        INSERT configuration_globals (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            name_label, display_label,
            magic, text_setting, integer_setting, float_setting,
            datetime_setting, uuid_setting, description, bit_setting)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_NameLabel, i_DisplayLabel,
            i_Magic, i_TextSetting, i_IntegerSetting, i_FloatSetting,
            i_DateTimeSetting, f_UuidToBin(v_UuidSetting), i_Description,
            i_BitSetting);

        CALL p_system_UnlockTable('configuration_globals');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'configuration', 0, 'configuration_globals', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_AddGlobalLanguage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_AddGlobalLanguage`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_LanguageCode VARCHAR(20) CHARSET utf8,
    IN i_LanguageFamily VARCHAR(20) CHARSET utf8,
    IN i_CountryUuid CHAR(36) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_CountryId BIGINT;

    SELECT _table_id
    INTO v_CountryId
    FROM location_countries
    WHERE _table_uuid = f_UuidToBin(i_CountryUuid)
        AND _system_is_valid = 1
        AND _system_is_deleted = 0
    LIMIT 1;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_global_languages
        WHERE language_code = i_LanguageCode AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('configuration_lookup_global_languages', v_TableId);

        INSERT configuration_lookup_global_languages (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, name_label, display_label, countries_id,
            description, language_family, language_code, weighting, is_active)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_NameLabel, i_DisplayLabel, v_CountryId, 
            i_Description, i_LanguageFamily, i_LanguageCode, i_Weighting, i_IsActive);

        CALL p_system_UnlockTable('configuration_lookup_global_languages');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'configuration', 0, 'configuration_lookup_global_languages', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_AddGlobalTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_AddGlobalTitle`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_global_titles
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('configuration_lookup_global_titles', v_TableId);

        INSERT configuration_lookup_global_titles (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, name_label, display_label,
            description, weighting, is_active)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_NameLabel, i_DisplayLabel, 
            i_Description, i_Weighting, i_IsActive);

        CALL p_system_UnlockTable('configuration_lookup_global_titles');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'configuration', 0, 'configuration_lookup_global_titles', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_AddSecurityAuthenticationMethod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_AddSecurityAuthenticationMethod`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_security_authentication_methods
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('configuration_lookup_security_authentication_methods', v_TableId);

        INSERT configuration_lookup_security_authentication_methods (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, name_label, display_label,
            description, magic, weighting, is_active)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_NameLabel, i_DisplayLabel, 
            i_Description, i_Magic, i_Weighting, i_IsActive);

        CALL p_system_UnlockTable('configuration_lookup_security_authentication_methods');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'configuration', 0, 'configuration_lookup_security_authentication_methods', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_AddSecurityClientType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_AddSecurityClientType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_security_client_types
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('configuration_lookup_security_client_types', v_TableId);

        INSERT configuration_lookup_security_client_types (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, name_label, display_label,
            description, weighting, is_active, magic)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_NameLabel, i_DisplayLabel, 
            i_Description, i_Weighting, i_IsActive, i_Magic);

        CALL p_system_UnlockTable('configuration_lookup_security_client_types');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'configuration', 0, 'configuration_lookup_security_client_types', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_AddSystemDockType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_AddSystemDockType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_system_dock_types
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('configuration_lookup_system_dock_types', v_TableId);

        INSERT configuration_lookup_system_dock_types (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, name_label, display_label,
            description, magic, weighting, is_active)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_NameLabel, i_DisplayLabel, 
            i_Description, i_Magic, i_Weighting, i_IsActive);

        CALL p_system_UnlockTable('configuration_lookup_system_dock_types');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'configuration', 0, 'configuration_lookup_system_dock_types', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_AddSystemLogType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_AddSystemLogType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_system_log_types
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('configuration_lookup_system_log_types', v_TableId);

        INSERT configuration_lookup_system_log_types (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, name_label, display_label,
            description, magic, weighting, is_active)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_NameLabel, i_DisplayLabel, 
            i_Description, i_Magic, i_Weighting, i_IsActive);

        CALL p_system_UnlockTable('configuration_lookup_system_log_types');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'configuration', 0, 'configuration_lookup_system_log_types', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_FetchGlobal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_FetchGlobal`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_Magic CHAR(50) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF COALESCE(i_TableUuid, '') != '' AND COALESCE(i_TableUuid, '') != '0' THEN
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    ELSEIF COALESCE(i_Magic, '') != '' THEN
        SELECT _table_uuid INTO v_TableUuid
        FROM configuration_globals
        WHERE magic = i_Magic
            AND _system_is_valid = 1 AND _system_is_deleted = 0
        LIMIT 1;
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        name_label, display_label, magic, text_setting,
        integer_setting, float_setting,
        f_DatetimeToOutput(datetime_setting) AS 'datetime_setting',
        f_BinToUuid(uuid_setting) AS 'uuid_setting',
        f_BitToOutput(bit_setting) AS 'bit_setting',
        description
    FROM configuration_globals
    WHERE _table_uuid = v_TableUuid AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_FetchGlobalLanguage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_FetchGlobalLanguage`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(l._table_uuid) AS '_table_uuid',
        l.name_label AS 'name_label',
        l.display_label AS 'display_label',
        l.description AS 'description',
        l.language_code AS 'language_code',
        l.language_family AS 'language_family',
        f_BinToUuid(c._table_uuid) AS 'country_uuid',
        c.country_name AS 'country_name',
        c.display_name AS 'country_display_name',
        l.weighting AS 'weighting',
        f_BitToOutput(l.is_active) AS 'is_active'
    FROM configuration_lookup_global_languages AS l
        LEFT OUTER JOIN location_countries AS c ON c._table_id=l.countries_id AND c._system_is_valid = 1 AND c._system_is_deleted = 0
    WHERE l._table_uuid = v_TableUuid AND l._system_is_valid = 1 AND l._system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_FetchGlobalTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_FetchGlobalTitle`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        name_label, display_label, description,
        weighting, f_BitToOutput(is_active) AS 'is_active'
    FROM configuration_lookup_global_titles
    WHERE _table_uuid = v_TableUuid AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_FetchSecurityAuthenticationMethod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_FetchSecurityAuthenticationMethod`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        name_label, display_label, description,
        weighting, magic,
        f_BitToOutput(is_active) AS 'is_active'
    FROM configuration_lookup_security_authentication_methods
    WHERE _table_uuid = v_TableUuid AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_FetchSecurityClientType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_FetchSecurityClientType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        name_label, display_label, description, magic,
        weighting, f_BitToOutput(is_active) AS 'is_active'
    FROM configuration_lookup_security_client_types
    WHERE _table_uuid = v_TableUuid AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_FetchSystemDockType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_FetchSystemDockType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        name_label, display_label, description,
        magic, weighting, f_BitToOutput(is_active) AS 'is_active'
    FROM configuration_lookup_system_dock_types
    WHERE _table_uuid = v_TableUuid AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_FetchSystemLogType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_FetchSystemLogType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        name_label, display_label, description,
        magic, weighting, f_BitToOutput(is_active) AS 'is_active'
    FROM configuration_lookup_system_log_types
    WHERE _table_uuid = v_TableUuid AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ListGlobal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ListGlobal`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM configuration_globals
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT name_label, display_label, magic, text_setting, integer_setting,
        float_setting, f_DatetimeToOutput(datetime_setting) AS datetime_setting,
        f_BinToUuid(uuid_setting) AS 'uuid_setting', CASE WHEN bit_setting = 1 THEN 1 ELSE 0 END AS bit_setting,
        description, f_BinToUuid(_table_uuid) AS '_table_uuid',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM configuration_globals
    WHERE _system_is_valid = 1
        AND _system_is_deleted = 0
    ORDER BY name_label;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ListGlobalLanguage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ListGlobalLanguage`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM configuration_lookup_global_languages
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT l.name_label AS 'name_label',
        l.display_label AS 'display_label',
        f_BinToUuid(l._table_uuid) AS '_table_uuid',
        l.language_code AS 'language_code',
        c.country_name AS 'country_name',
        c.display_name AS 'country_display_name',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM configuration_lookup_global_languages AS l
        LEFT OUTER JOIN location_countries AS c ON c._table_id = l.countries_id AND c._system_is_valid = 1 AND c._system_is_deleted = 0
    WHERE l._system_is_valid = 1
        AND l._system_is_deleted = 0
    ORDER BY COALESCE(l.weighting, 0), l.name_label,
        c.display_name, c.country_name;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ListGlobalTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ListGlobalTitle`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM configuration_lookup_global_titles
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT name_label, display_label, f_BinToUuid(_table_uuid) AS '_table_uuid',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM configuration_lookup_global_titles
    WHERE _system_is_valid = 1
        AND _system_is_deleted = 0
    ORDER BY COALESCE(weighting, 0), name_label;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ListSecurityAuthenticationMethod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ListSecurityAuthenticationMethod`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM configuration_lookup_security_authentication_methods
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT name_label, display_label, f_BinToUuid(_table_uuid) AS '_table_uuid',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM configuration_lookup_security_authentication_methods
    WHERE _system_is_valid = 1
        AND _system_is_deleted = 0
    ORDER BY COALESCE(weighting, 0), name_label;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ListSecurityClientType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ListSecurityClientType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM configuration_lookup_security_client_types
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT name_label, display_label, f_BinToUuid(_table_uuid) AS '_table_uuid',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM configuration_lookup_security_client_types
    WHERE _system_is_valid = 1
        AND _system_is_deleted = 0
    ORDER BY COALESCE(weighting, 0), name_label;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ListSystemDockType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ListSystemDockType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM configuration_lookup_system_dock_types
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT name_label, display_label, f_BinToUuid(_table_uuid) AS '_table_uuid',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM configuration_lookup_system_dock_types
    WHERE _system_is_valid = 1
        AND _system_is_deleted = 0
    ORDER BY COALESCE(weighting, 0), name_label;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ListSystemLogType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ListSystemLogType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM configuration_lookup_system_log_types
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT name_label, display_label, f_BinToUuid(_table_uuid) AS '_table_uuid',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM configuration_lookup_system_log_types
    WHERE _system_is_valid = 1
        AND _system_is_deleted = 0
    ORDER BY COALESCE(weighting, 0), name_label;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ModifyGlobal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ModifyGlobal`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_TextSetting TEXT CHARSET utf8,
    IN i_IntegerSetting BIGINT,
    IN i_FloatSetting DOUBLE,
    IN i_DateTimeSetting DATETIME,
    IN i_UuidSetting CHAR(36) CHARSET utf8,
    IN i_BitSetting BIT(1),
    IN i_Description TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_UuidSetting CHAR(36) CHARSET utf8;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_old_NameLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DisplayLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Magic VARCHAR(70) CHARSET utf8;
    DECLARE v_old_TextSetting TEXT CHARSET utf8;
    DECLARE v_old_IntegerSetting BIGINT;
    DECLARE v_old_FloatSetting DOUBLE;
    DECLARE v_old_DateTimeSetting DATETIME;
    DECLARE v_old_UuidSetting CHAR(36) CHARSET utf8;
    DECLARE v_old_BitSetting BIT(1);
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_TranslatedLogMessage TEXT CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_globals
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, name_label,
            display_label, magic, text_setting, integer_setting,
            float_setting, datetime_setting, uuid_setting, bit_setting,
            description
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_NameLabel,
            v_old_DisplayLabel, v_old_Magic, v_old_TextSetting,
            v_old_IntegerSetting, v_old_FloatSetting, v_old_DateTimeSetting,
            v_old_UuidSetting, v_old_BitSetting, v_old_Description
        FROM configuration_globals
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '')
            OR COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '')
            OR COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '')
            OR COALESCE(i_TextSetting, '') != COALESCE(v_old_TextSetting, '')
            OR COALESCE(i_IntegerSetting, 0) != COALESCE(v_old_IntegerSetting, 0)
            OR COALESCE(i_FloatSetting, 0.0) != COALESCE(v_old_FloatSetting, 0.0)
            OR COALESCE(i_DatetimeSetting, CAST('01 Jan 2010' AS DATETIME)) != COALESCE(v_old_DatetimeSetting, CAST('01 Jan 2010' AS DATETIME))
            OR COALESCE(i_UuidSetting, '') != COALESCE(v_old_UuidSetting, '')
            OR COALESCE(i_BitSetting, 0) != COALESCE(v_old_BitSetting, 0)
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            IF i_UuidSetting = '' THEN
                SET v_UuidSetting := NULL;
            ELSE
                SET v_UuidSetting := i_UuidSetting;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();
     
            INSERT configuration_globals (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                name_label, display_label, magic, text_setting, integer_setting,
                float_setting, datetime_setting, uuid_setting, bit_setting,
                description)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, f_UuidToBin(v_TransactionUuid), v_SystemPreviousId,
                NULL, i_NameLabel, i_DisplayLabel, i_Magic, i_TextSetting,
                i_IntegerSetting, i_FloatSetting, i_DatetimeSetting, i_UuidSetting,
                i_BitSetting, i_Description
            FROM configuration_globals
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE configuration_globals SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_globals', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_globals', v_TableId, 'name_label', v_old_NameLabel,
                    i_NameLabel, 'Name Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_globals', v_TableId, 'display_label', v_old_DisplayLabel,
                    i_DisplayLabel, 'Display Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_globals', v_TableId, 'magic', v_old_DisplayLabel,
                    i_DisplayLabel, 'Magic', v_HumanReadable);
            END IF;

            IF COALESCE(i_TextSetting, '') != COALESCE(v_old_TextSetting, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_globals', v_TableId, 'text_setting', v_old_TextSetting,
                    i_TextSetting, 'Text Setting', v_HumanReadable);
            END IF;

            IF COALESCE(i_IntegerSetting, 0) != COALESCE(v_old_IntegerSetting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_globals', v_TableId, 'integer_setting', v_old_IntegerSetting,
                    i_IntegerSetting, 'Integer Setting', v_HumanReadable);
            END IF;

            IF COALESCE(i_FloatSetting, 0.0) != COALESCE(v_old_FloatSetting, 0.0) THEN
                CALL p_system_LogTransactionDetailFloat(v_TransactionId,
                    'configuration_globals', v_TableId, 'float_setting', v_old_FloatSetting,
                    i_FloatSetting, 'Float Setting', v_HumanReadable);
            END IF;

            IF COALESCE(i_DatetimeSetting, CAST('01 Jan 2010' AS DATETIME)) != COALESCE(v_old_DatetimeSetting, CAST('01 Jan 2010' AS DATETIME)) THEN
                CALL p_system_LogTransactionDetailDatetime(v_TransactionId,
                    'configuration_globals', v_TableId, 'datetime_setting', v_old_DatetimeSetting,
                    i_DatetimeSetting, 'Datetime Setting', v_HumanReadable);
            END IF;

            IF COALESCE(i_UuidSetting, '') != COALESCE(v_old_UuidSetting, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_globals', v_TableId, 'uuid_setting', v_old_UuidSetting,
                    i_UuidSetting, 'Uuid Setting', v_HumanReadable);
            END IF;

            IF COALESCE(i_BitSetting, 0) != COALESCE(v_old_BitSetting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_globals', v_TableId, 'bit_setting', v_old_BitSetting,
                    i_BitSetting, 'Bit Setting', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_globals', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);

        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ModifyGlobalLanguage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ModifyGlobalLanguage`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_LanguageCode VARCHAR(20) CHARSET utf8,
    IN i_LanguageFamily VARCHAR(20) CHARSET utf8,
    IN i_CountryUuid CHAR(36) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_CountryId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_old_NameLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DisplayLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_LanguageCode VARCHAR(20) CHARSET utf8;
    DECLARE v_old_LanguageFamily VARCHAR(20) CHARSET utf8;
    DECLARE v_old_CountryId BIGINT;
    DECLARE v_old_Weighting SMALLINT;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_CountryLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_CountryLookupLabel VARCHAR(100) CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_global_languages
        WHERE language_code = i_LanguageCode AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, name_label,
            display_label, description, language_code, language_family,
            countries_id, weighting, is_active
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_NameLabel,
            v_old_DisplayLabel, v_old_Description, v_old_LanguageCode,
            v_old_LanguageFamily, v_old_CountryId, v_old_Weighting,
            v_old_IsActive
        FROM configuration_lookup_global_languages
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        SELECT _table_id
        INTO v_CountryId
        FROM location_countries
        WHERE _table_uuid = f_UuidToBin(i_CountryUuid)
            AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '')
            OR COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_LanguageCode, '') != COALESCE(v_old_LanguageCode, '')
            OR COALESCE(i_LanguageFamily, '') != COALESCE(v_old_LanguageFamily, '')
            OR COALESCE(v_CountryId, 0) != COALESCE(v_old_CountryId, 0)
            OR COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT configuration_lookup_global_languages (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                name_label, display_label, description, language_code, language_family,
                countries_id, weighting, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_NameLabel, i_DisplayLabel, i_Description, i_LanguageCode, i_LanguageFamily,
                v_CountryId, i_Weighting, i_IsActive
            FROM configuration_lookup_global_languages
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE configuration_lookup_global_languages SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_global_languages', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_global_languages', v_TableId, 'name_label', v_old_NameLabel,
                    i_NameLabel, 'Name Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_global_languages', v_TableId, 'display_label', v_old_DisplayLabel,
                    i_DisplayLabel, 'Display Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_global_languages', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_LanguageCode, '') != COALESCE(v_old_LanguageCode, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_global_languages', v_TableId, 'language_code', v_old_LanguageCode,
                    i_LanguageCode, 'Language Code', v_HumanReadable);
            END IF;

            IF COALESCE(i_LanguageFamily, '') != COALESCE(v_old_LanguageFamily, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_global_languages', v_TableId, 'language_family', v_old_LanguageFamily,
                    i_LanguageFamily, 'Language Family', v_HumanReadable);
            END IF;

            IF COALESCE(v_CountryId, 0) != COALESCE(v_old_CountryId, 0) THEN
                SELECT country_name
                INTO v_old_CountryLookupLabel
                FROM location_countries
                WHERE _table_id = v_old_CountryId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT country_name
                INTO v_CountryLookupLabel
                FROM location_countries
                WHERE _table_id = v_CountryId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'configuration_lookup_global_languages', v_TableId, 'countries_id', v_old_CountryId,
                    v_CountryId, 'Country', v_old_CountryLookupLabel, v_CountryLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_global_languages', v_TableId, 'weighting', v_old_Weighting,
                    i_Weighting, 'Weighting', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_global_languages', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ModifyGlobalTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ModifyGlobalTitle`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_old_NameLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DisplayLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_Weighting SMALLINT;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_global_titles
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, name_label,
            display_label, description, weighting, is_active
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_NameLabel,
            v_old_DisplayLabel, v_old_Description, v_old_Weighting,
            v_old_IsActive
        FROM configuration_lookup_global_titles
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '')
            OR COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT configuration_lookup_global_titles (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                name_label, display_label, description, weighting, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_NameLabel, i_DisplayLabel, i_Description, i_Weighting, i_IsActive
            FROM configuration_lookup_global_titles
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE configuration_lookup_global_titles SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_global_titles', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_global_titles', v_TableId, 'name_label', v_old_NameLabel,
                    i_NameLabel, 'Name Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_global_titles', v_TableId, 'display_label', v_old_DisplayLabel,
                    i_DisplayLabel, 'Display Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_global_titles', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_global_titles', v_TableId, 'weighting', v_old_Weighting,
                    i_Weighting, 'Weighting', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_global_titles', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ModifySecurityAuthenticationMethod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ModifySecurityAuthenticationMethod`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_old_NameLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DisplayLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_Magic VARCHAR(70) CHARSET utf8;
    DECLARE v_old_Weighting SMALLINT;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_security_authentication_methods
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, name_label,
            display_label, description, weighting, is_active, magic
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_NameLabel,
            v_old_DisplayLabel, v_old_Description, v_old_Weighting,
            v_old_IsActive, v_old_Magic
        FROM configuration_lookup_security_authentication_methods
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '')
            OR COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '')
            OR COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT configuration_lookup_security_authentication_methods (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                name_label, display_label, description, magic, weighting, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_NameLabel, i_DisplayLabel, i_Description, i_Magic, i_Weighting, i_IsActive
            FROM configuration_lookup_security_authentication_methods
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE configuration_lookup_security_authentication_methods SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_security_authentication_methods', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_security_authentication_methods', v_TableId, 'name_label', v_old_NameLabel,
                    i_NameLabel, 'Name Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_security_authentication_methods', v_TableId, 'display_label', v_old_DisplayLabel,
                    i_DisplayLabel, 'Display Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_security_authentication_methods', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_security_authentication_methods', v_TableId, 'magic', v_old_Magic,
                    i_Magic, 'Magic', v_HumanReadable);
            END IF;

            IF COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_security_authentication_methods', v_TableId, 'weighting', v_old_Weighting,
                    i_Weighting, 'Weighting', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_security_authentication_methods', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ModifySecurityClientType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ModifySecurityClientType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_old_NameLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DisplayLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_Weighting SMALLINT;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_old_Magic VARCHAR(70) CHARSET utf8;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_security_client_types
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, name_label,
            display_label, description, weighting, is_active, magic
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_NameLabel,
            v_old_DisplayLabel, v_old_Description, v_old_Weighting,
            v_old_IsActive, v_old_Magic
        FROM configuration_lookup_security_client_types
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '')
            OR COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0)
            OR COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '') THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT configuration_lookup_security_client_types (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                name_label, display_label, description, weighting, is_active, magic)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_NameLabel, i_DisplayLabel, i_Description, i_Weighting,
                i_IsActive, i_Magic
            FROM configuration_lookup_security_client_types
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE configuration_lookup_security_client_types SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_security_client_types', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_security_client_types', v_TableId, 'name_label', v_old_NameLabel,
                    i_NameLabel, 'Name Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_security_client_types', v_TableId, 'display_label', v_old_DisplayLabel,
                    i_DisplayLabel, 'Display Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_security_client_types', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_security_client_types', v_TableId, 'magic', v_old_DisplayLabel,
                    i_DisplayLabel, 'Display Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_security_client_types', v_TableId, 'weighting', v_old_Weighting,
                    i_Weighting, 'Weighting', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_security_client_types', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ModifySystemDockType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ModifySystemDockType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_old_NameLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DisplayLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_Magic VARCHAR(70) CHARSET utf8;
    DECLARE v_old_Weighting SMALLINT;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_system_dock_types
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, name_label,
            display_label, description, weighting, is_active, magic
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_NameLabel,
            v_old_DisplayLabel, v_old_Description, v_old_Weighting,
            v_old_IsActive, v_old_Magic
        FROM configuration_lookup_system_dock_types
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '')
            OR COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '')
            OR COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT configuration_lookup_system_dock_types (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                name_label, display_label, description, magic, weighting, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_NameLabel, i_DisplayLabel, i_Description, i_Magic, i_Weighting, i_IsActive
            FROM configuration_lookup_system_dock_types
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE configuration_lookup_system_dock_types SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_system_dock_types', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_system_dock_types', v_TableId, 'name_label', v_old_NameLabel,
                    i_NameLabel, 'Name Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_system_dock_types', v_TableId, 'display_label', v_old_DisplayLabel,
                    i_DisplayLabel, 'Display Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_system_dock_types', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_system_log_types', v_TableId, 'magic', v_old_Magic,
                    i_Magic, 'Magic', v_HumanReadable);
            END IF;

            IF COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_system_log_types', v_TableId, 'weighting', v_old_Weighting,
                    i_Weighting, 'Weighting', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_system_dock_types', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_ModifySystemLogType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_ModifySystemLogType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_NameLabel VARCHAR(100) CHARSET utf8,
    IN i_DisplayLabel VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_old_NameLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DisplayLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_Magic VARCHAR(70) CHARSET utf8;
    DECLARE v_old_Weighting SMALLINT;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM configuration_lookup_system_log_types
        WHERE name_label = i_NameLabel AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, name_label,
            display_label, description, weighting, is_active, magic
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_NameLabel,
            v_old_DisplayLabel, v_old_Description, v_old_Weighting,
            v_old_IsActive, v_old_Magic
        FROM configuration_lookup_system_log_types
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '')
            OR COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '')
            OR COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT configuration_lookup_system_log_types (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                name_label, display_label, description, magic, weighting, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_NameLabel, i_DisplayLabel, i_Description, i_Magic, i_Weighting, i_IsActive
            FROM configuration_lookup_system_log_types
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE configuration_lookup_system_log_types SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_system_log_types', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_NameLabel, '') != COALESCE(v_old_NameLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_system_log_types', v_TableId, 'name_label', v_old_NameLabel,
                    i_NameLabel, 'Name Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayLabel, '') != COALESCE(v_old_DisplayLabel, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_system_log_types', v_TableId, 'display_label', v_old_DisplayLabel,
                    i_DisplayLabel, 'Display Label', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_system_log_types', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'configuration_lookup_system_log_types', v_TableId, 'magic', v_old_Magic,
                    i_Magic, 'Magic', v_HumanReadable);
            END IF;

            IF COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_system_log_types', v_TableId, 'weighting', v_old_Weighting,
                    i_Weighting, 'Weighting', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'configuration_lookup_system_log_types', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_RemoveGlobal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_RemoveGlobal`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM configuration_globals
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
        AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT configuration_globals (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            name_label, display_label, magic, text_setting, integer_setting,
            float_setting, datetime_setting, uuid_setting, bit_setting,
            description)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, name_label, display_label, magic, text_setting,
            integer_setting, float_setting, datetime_setting, uuid_setting,
            bit_setting, description
        FROM configuration_globals
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE configuration_globals SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_globals', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_RemoveGlobalLanguage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_RemoveGlobalLanguage`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM configuration_lookup_global_languages
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
        AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM system_string_translations
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND global_languages_id = v_TableId;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM system_field_translations
        WHERE _system_is_valid = 1 AND _system_is_deleted = 0
            AND global_languages_id = v_TableId;
    END IF;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM user_users
        WHERE _system_is_valid = 1 AND _system_is_deleted = 0
            AND preferred_global_languages_id = v_TableId;
    END IF;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT configuration_lookup_global_languages (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            name_label, display_label, description, language_code, language_family,
            countries_id, weighting, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            0, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, name_label, display_label, description, language_code, language_family,
            countries_id, weighting, is_active
        FROM configuration_lookup_global_languages
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE configuration_lookup_global_languages SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_global_languages', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_RemoveGlobalTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_RemoveGlobalTitle`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM configuration_lookup_global_titles
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
        AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM system_users
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND global_titles_id = v_TableId;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT configuration_lookup_global_titles (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            name_label, display_label, description, magic, weighting, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, name_label, display_label, description, magic, weighting, is_active
        FROM configuration_lookup_global_titles
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE configuration_lookup_global_titles SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_global_titles', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_RemoveSecurityAuthenticationMethod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_RemoveSecurityAuthenticationMethod`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM configuration_lookup_security_authentication_methods
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
        AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM security_users_credentials
    WHERE _system_is_active = 1 AND _system_is_deleted = 0
        AND security_authentication_methods_id = v_TableId;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT configuration_lookup_security_authentication_methods (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            name_label, display_label, description, weighting, magic, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, name_label, display_label, description, weighting, magic, is_active
        FROM configuration_lookup_security_authentication_methods
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE configuration_lookup_security_authentication_methods SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_security_authentication_methods', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_RemoveSecurityClientType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_RemoveSecurityClientType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM configuration_lookup_security_client_types
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
        AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM system_registrations
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND security_client_types_id = v_TableId;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM system_docks
        WHERE _system_is_valid = 1 AND _system_is_deleted = 0
            AND security_client_types_id = v_TableId;
    END IF;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM system_dock_items
        WHERE _system_is_valid = 1 AND _system_is_deleted = 0
            AND security_client_types_id = v_TableId;
    END IF;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM system_dock_subitems
        WHERE _system_is_valid = 1 AND _system_is_deleted = 0
            AND security_client_types_id = v_TableId;
    END IF;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT configuration_lookup_security_client_types (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            name_label, display_label, description, magic, weighting, is_active, magic)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, name_label, display_label, description, magic, weighting, is_active,
            magic
        FROM configuration_lookup_security_client_types
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE configuration_lookup_security_client_types SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_security_client_types', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_RemoveSystemDockType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_RemoveSystemDockType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM configuration_lookup_system_dock_types
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
        AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM system_docks
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND system_dock_types_id = v_TableId;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT configuration_lookup_system_dock_types (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            name_label, display_label, description, magic, weighting, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, name_label, display_label, description, magic, weighting, is_active
        FROM configuration_lookup_system_dock_types
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE configuration_lookup_system_dock_types SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_system_dock_types', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_configuration_RemoveSystemLogType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_configuration_RemoveSystemLogType`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM configuration_lookup_system_log_types
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
        AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM system_log_transactions
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND system_log_types_id = v_TableId;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT configuration_lookup_system_log_types (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            name_label, display_label, description, magic, weighting, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, name_label, display_label, description, magic, weighting, is_active
        FROM configuration_lookup_system_log_types
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE configuration_lookup_system_log_types SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'configuration', 0, 'configuration_lookup_system_log_types', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_location_AddCountry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_location_AddCountry`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_CountryName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_CountryCode VARCHAR(20) CHARSET utf8,
    IN i_AlternateCode VARCHAR(20) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := (SELECT COUNT(*) FROM location_countries
        WHERE country_name = i_CountryName AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('location_countries', v_TableId);

        INSERT location_countries (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id,
            country_name, display_name, description, country_code, alternate_code,
            weighting, is_active)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL,
            i_CountryName, i_DisplayName, i_Description, i_CountryCode, i_AlternateCode,
            i_Weighting, i_IsActive);

        CALL p_system_UnlockTable('location_countries');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'security', 0, 'location_countries', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_location_FetchCountry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_location_FetchCountry`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        country_name, display_name, description,
        country_code, alternate_code, weighting,
        f_BitToOutput(is_active) AS 'is_active'
    FROM location_countries
    WHERE _table_uuid = v_TableUuid AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_location_ListCountry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_location_ListCountry`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM location_countries
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        country_name,
        display_name,
        f_BitToOutput(is_active) AS 'is_active',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM location_countries
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
    ORDER BY COALESCE(weighting, 0), country_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_location_ModifyCountry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_location_ModifyCountry`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_CountryName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_CountryCode VARCHAR(20) CHARSET utf8,
    IN i_AlternateCode VARCHAR(20) CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_PartitionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_Timestamp DATETIME;

    DECLARE v_old_CountryName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DisplayName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_CountryCode VARCHAR(20) CHARSET utf8;
    DECLARE v_old_AlternateCode VARCHAR(20) CHARSET utf8;
    DECLARE v_old_Weighting SMALLINT;
    DECLARE v_old_IsActive BIT(1);

    SET v_RowCount := (SELECT COUNT(*) FROM location_countries
        WHERE country_name = i_CountryName AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            country_name, display_name, description,
            country_code, alternate_code, weighting, is_active
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_CountryName,
            v_old_DisplayName, v_old_Description, v_old_CountryCode,
            v_old_AlternateCode, v_old_Weighting, v_old_IsActive
        FROM location_countries
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_CountryName, '') != COALESCE(v_old_CountryName, '')
            OR COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_CountryCode, '') != COALESCE(v_old_CountryCode, '')
            OR COALESCE(i_AlternateCode, '') != COALESCE(v_old_AlternateCode, '')
            OR COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT location_countries (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                country_name, display_name, description, country_code,
                alternate_code, weighting, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_CountryName, i_DisplayName, i_Description, i_CountryCode,
                i_AlternateCode, i_Weighting, i_IsActive
            FROM location_countries
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE location_countries SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'location', 0, 'location_countries', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_CountryName, '') != COALESCE(v_old_CountryName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'location_counties', v_TableId, 'country_name', v_old_CountryName,
                    i_CountryName, 'Country Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'location_counties', v_TableId, 'display_name', v_old_DisplayName,
                    i_DisplayName, 'Display Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'location_countries', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_CountryCode, '') != COALESCE(v_old_CountryCode, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'location_countries', v_TableId, 'country_code', v_old_CountryCode,
                    i_CountryCode, 'Country Code', v_HumanReadable);
            END IF;

            IF COALESCE(i_AlternateCode, '') != COALESCE(v_old_AlternateCode, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'location_countries', v_TableId, 'alternate_code', v_old_AlternateCode,
                    i_AlternateCode, 'Alternate Code', v_HumanReadable);
            END IF;

            IF COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'location_countries', v_TableId, 'weighting', v_old_Weighting,
                    i_Weighting, 'Weighting', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailBit(v_TransactionId,
                    'security_roles', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_location_RemoveCountry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_location_RemoveCountry`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM location_countries
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM configuration_lookup_global_languages
    WHERE _system_is_active = 1 AND _system_is_deleted = 0
        AND countries_id = v_TableId;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT location_countries (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            country_name, display_name, description, country_code,
            alternate_code, weighting, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, country_name, display_name, description, country_code,
            alternate_code, weighting, is_active
        FROM location_countries
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE location_countries SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'location', 0, 'location_countries', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddDockItemPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddDockItemPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_DockItemUuid CHAR(36) CHARSET utf8,
    IN i_PermissionUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_DockItemId BIGINT;
    DECLARE v_PermissionId BIGINT;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := 0;

    SELECT _table_id INTO v_PermissionId
    FROM security_permissions
    WHERE _table_uuid = f_UuidToBin(i_PermissionUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockItemId
    FROM system_dock_items
    WHERE _table_uuid = f_UuidToBin(i_DockItemUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    IF v_DockItemId > 0 AND v_PermissionId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*)
            FROM security_dock_items_permissions
            WHERE _system_is_valid = 1 AND dock_items_id = v_DockItemId
                AND permissions_id = v_PermissionId AND _system_is_deleted = 0);
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_dock_items_permissions', v_TableId);

        INSERT security_dock_items_permissions (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, dock_items_id, permissions_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_DockItemId, v_PermissionId);

        CALL p_system_UnlockTable('security_dock_items_permissions');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'security', 0, 'security_dock_items_permissions', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddDockPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddDockPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_DockUuid CHAR(36) CHARSET utf8,
    IN i_PermissionUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_DockId BIGINT;
    DECLARE v_PermissionId BIGINT;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := 0;

    SELECT _table_id INTO v_PermissionId
    FROM security_permissions
    WHERE _table_uuid = f_UuidToBin(i_PermissionUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockId
    FROM system_docks
    WHERE _table_uuid = f_UuidToBin(i_DockUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    IF v_DockId > 0 AND v_PermissionId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*)
            FROM security_docks_permissions
            WHERE _system_is_valid = 1 AND docks_id = v_DockId
                AND permissions_id = v_PermissionId AND _system_is_deleted = 0);
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_docks_permissions', v_TableId);

        INSERT security_docks_permissions (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, docks_id, permissions_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_DockId, v_PermissionId);

        CALL p_system_UnlockTable('security_docks_permissions');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'security', 0, 'security_docks_permissions', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddDockSubitemPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddDockSubitemPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_DockSubitemUuid CHAR(36) CHARSET utf8,
    IN i_PermissionUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_DockSubitemId BIGINT;
    DECLARE v_PermissionId BIGINT;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := 0;

    SELECT _table_id INTO v_PermissionId
    FROM security_permissions
    WHERE _table_uuid = f_UuidToBin(i_PermissionUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockSubitemId
    FROM system_dock_subitems
    WHERE _table_uuid = f_UuidToBin(i_DockSubitemUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    IF v_DockSubitemId > 0 AND v_PermissionId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*)
            FROM security_dock_subitems_permissions
            WHERE _system_is_valid = 1 AND dock_subitems_id = v_DockSubitemId
                AND permissions_id = v_PermissionId AND _system_is_deleted = 0);
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_dock_subitems_permissions', v_TableId);

        INSERT security_dock_subitems_permissions (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, dock_subitems_id, permissions_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_DockSubitemId, v_PermissionId);

        CALL p_system_UnlockTable('security_dock_subitems_permissions');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'security', 0, 'security_dock_subitems_permissions', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddDockTabPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddDockTabPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_DockTabUuid CHAR(36) CHARSET utf8,
    IN i_PermissionUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_DockTabId BIGINT;
    DECLARE v_PermissionId BIGINT;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := 0;

    SELECT _table_id INTO v_PermissionId
    FROM security_permissions
    WHERE _table_uuid = f_UuidToBin(i_PermissionUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockTabId
    FROM system_dock_tabs
    WHERE _table_uuid = f_UuidToBin(i_DockTabUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    IF v_DockTabId > 0 AND v_PermissionId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*)
            FROM security_dock_tabs_permissions
            WHERE _system_is_valid = 1 AND dock_tabs_id = v_DockTabId
                AND permissions_id = v_PermissionId AND _system_is_deleted = 0);
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_dock_tabs_permissions', v_TableId);

        INSERT security_dock_tabs_permissions (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, dock_tabs_id, permissions_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_DockTabId, v_PermissionId);

        CALL p_system_UnlockTable('security_dock_tabs_permissions');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'security', 0, 'security_dock_tabs_permissions', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddMessagePermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddMessagePermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_MessageUuid CHAR(36) CHARSET utf8,
    IN i_PermissionUuid CHAR(36) CHARSET utf8,
    IN i_DoPartitionCheck BIT(1),
    IN i_RunUnauthenticated BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_MessageId BIGINT;
    DECLARE v_PermissionId BIGINT;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := 0;

    SELECT _table_id INTO v_PermissionId
    FROM security_permissions
    WHERE _table_uuid = f_UuidToBin(i_PermissionUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_MessageId
    FROM system_messages
    WHERE _table_uuid = f_UuidToBin(i_MessageUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    IF v_MessageId > 0 AND v_PermissionId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*)
            FROM security_messages_permissions
            WHERE _system_is_valid = 1 AND messages_id = v_MessageId
                AND permissions_id = v_PermissionId AND _system_is_deleted = 0);
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_messages_permissions', v_TableId);

        INSERT security_messages_permissions (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, messages_id,
            permissions_id, do_partition_check, run_unauthenticated)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_MessageId, 
            v_PermissionId, i_DoPartitionCheck, i_RunUnauthenticated);

        CALL p_system_UnlockTable('security_messages_permissions');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'security', 0, 'security_messages_permissions', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_ModuleUuid CHAR(36) CHARSET utf8,
    IN i_PermissionName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Importance TINYINT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_ModuleId BIGINT;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_Importance TINYINT;

    SET v_ModuleId := (SELECT _table_id FROM system_modules
        WHERE _table_uuid = f_UuidToBin(i_ModuleUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_ModuleId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*) FROM security_permissions
            WHERE modules_id = v_ModuleId AND magic = i_Magic AND _system_is_valid = 1 AND _system_is_deleted = 0);
    ELSE
        SET v_RowCount := 1;
    END IF;

    IF ISNULL(i_Importance) THEN
        SET v_Importance = 0;
    ELSE
        SET v_Importance = i_Importance;
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_permissions', v_TableId);

        INSERT security_permissions (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, modules_id,
            permission_name, description, magic, importance)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_ModuleId, 
            i_PermissionName, i_Description, i_Magic, v_Importance);

        CALL p_system_UnlockTable('security_permissions');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'security', 0, 'security_permissions', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddRegistration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddRegistration`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_ApiPublic CHAR(36) CHARSET utf8,
    IN i_ApiPrivate CHAR(64) CHARSET utf8,
    IN i_SecurityClientTypeUuid CHAR(36) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_SecurityClientTypeId BIGINT;
    DECLARE v_TransactionId BIGINT;

    SET v_SecurityClientTypeId := (SELECT _table_id FROM configuration_lookup_security_client_types
        WHERE _table_uuid = f_UuidToBin(i_PartitionUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_SecurityClientTypeId != 0 AND NOT ISNULL(v_SecurityClientTypeId) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_registrations', v_TableId);

        INSERT security_registrations (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, api_public, api_private,
            security_client_types_id, created, description, is_active)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, f_UuidToBin(i_ApiPublic),
            f_ShaToBin(i_ApiPrivate), v_SecurityClientTypeId, UTC_TIMESTAMP(),
            i_Description, i_IsActive);

        CALL p_system_UnlockTable('security_registrations');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'security', 0, 'security_registrations', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddRole`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_PartitionUuid CHAR(36) CHARSET utf8,
    IN i_RoleName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_PartitionId BIGINT;
    DECLARE v_TransactionId BIGINT;

    SET v_PartitionId := (SELECT _table_id FROM system_partitions
        WHERE _table_uuid = f_UuidToBin(i_PartitionUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_PartitionId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*) FROM security_roles
            WHERE partitions_id = v_PartitionId AND _system_is_valid = 1 AND _system_is_deleted = 0);
    ELSE
        SET v_RowCount := 1;
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_roles', v_TableId);

        INSERT security_roles (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, partitions_id,
            role_name, description, is_active)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_PartitionId, 
            i_RoleName, i_Description, i_IsActive);

        CALL p_system_UnlockTable('security_roles');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'security', 0, 'security_roles', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddRolePermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddRolePermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_RoleUuid CHAR(36) CHARSET utf8,
    IN i_PermissionUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_RoleId BIGINT;
    DECLARE v_PermissionId BIGINT;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := 0;

    SELECT _table_id INTO v_PermissionId
    FROM security_permissions
    WHERE _table_uuid = f_UuidToBin(i_PermissionUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_RoleId
    FROM security_roles
    WHERE _table_uuid = f_UuidToBin(i_RoleUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    IF v_RoleId > 0 AND v_PermissionId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*)
            FROM security_roles_permissions
            WHERE _system_is_valid = 1 AND roles_id = v_RoleId
                AND permissions_id = v_PermissionId AND _system_is_deleted = 0);
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_roles_permissions', v_TableId);

        INSERT security_roles_permissions (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, roles_id,
            permissions_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_RoleId, 
            v_PermissionId);

        CALL p_system_UnlockTable('security_roles_permissions');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'security', 0, 'security_roles_permissions', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddSession`(IN i_TokenUuid CHAR(36) CHARSET utf8,
    IN i_UserUuid CHAR(36) CHARSET utf8,
    IN i_RegistrationUuid CHAR(36) CHARSET utf8,
    IN i_Nonce CHAR(36) CHARSET utf8,
    IN i_Data TEXT CHARSET utf8,
    IN i_LanguageCode VARCHAR(20) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TokenUuid BINARY(16);
    DECLARE v_UserId BIGINT;
    DECLARE v_RegistrationId BIGINT;
    DECLARE v_SessionLength BIGINT;
    DECLARE v_SessionId BIGINT;
    DECLARE v_NonceCount INT;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT CHARSET utf8;
    DECLARE v_Expiry DATETIME;

    SET v_NonceCount := (SELECT COUNT(*) FROM security_nonces
        WHERE nonce = f_UuidToBin(i_Nonce)
            AND first_used > DATE_ADD(UTC_TIMESTAMP(), INTERVAL -7 DAY));

    IF v_NonceCount = 0 THEN
        SET v_UserId := (SELECT _table_id FROM user_users
            WHERE _table_uuid = f_UuidToBin(i_UserUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);

        SET v_RegistrationId := (SELECT _table_id FROM security_registrations
            WHERE _table_uuid = f_UuidToBin(i_RegistrationUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);

        IF i_TokenUuid = '' OR ISNULL(i_TokenUuid) THEN
            SET v_TokenUuid := f_UuidToBin(UUID());
        ELSE
            SET v_TokenUuid := f_UuidToBin(i_TokenUuid);
        END IF;
    END IF;

    IF v_UserId > 0 AND v_RegistrationId > 0 AND NOT ISNULL(v_TokenUuid) AND v_NonceCount = 0 THEN
        SELECT integer_setting INTO v_SessionLength
        FROM configuration_globals
        WHERE magic = 'session_timeout'
            AND _system_is_valid = 1
        ORDER BY _system_auto_id
        LIMIT 1;

        IF ISNULL(v_SessionLength) THEN
            SET v_SessionLength := 20;
        END IF;

        SET v_Expiry := DATE_ADD(UTC_TIMESTAMP(), INTERVAL v_SessionLength MINUTE);

        INSERT INTO security_sessions (_table_uuid, users_id, registrations_id,
            data, language_code, expiry, session_length, created)
        VALUES (v_TokenUuid, v_UserId, v_RegistrationId, i_Data, i_LanguageCode,
            DATE_ADD(UTC_TIMESTAMP(), INTERVAL v_SessionLength MINUTE), v_SessionLength,
            UTC_TIMESTAMP());

        SET v_SessionId := LAST_INSERT_ID();

        INSERT security_nonces (sessions_id, nonce, first_used)
        SELECT v_SessionId, f_UuidToBin(i_Nonce), UTC_TIMESTAMP;

        -- Human readable transaction log
        CALL p_system_QuickTranslateString('Session Created.', v_TranslatedLogMessage);

        CALL p_system_LogTransaction(v_TokenUuid, NULL,
            'user', v_UserId, 'security_session', v_SessionId,
            'record_added', v_TranslatedLogMessage, v_TransactionId);

        SELECT f_BinToUuid(v_TokenUuid) AS 'token', v_Expiry AS 'expiry';
    ELSE
        SELECT NULL AS 'token', NULL AS 'expiry';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddUserCredential` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddUserCredential`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_UserUuid CHAR(36) CHARSET utf8,
    IN i_SecurityAuthenticationMethodUuid CHAR(36) CHARSET utf8,
    IN i_RemoteUsername VARCHAR(100) CHARSET utf8,
    IN i_Password CHAR(64) CHARSET utf8,
    IN i_BearerToken VARCHAR(200) CHARSET utf8,
    IN i_Setting BIT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_UserId BIGINT;
    DECLARE v_SecurityAuthenticationMethodId BIGINT;
    DECLARE v_Password BINARY(32);
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT;

    SET v_RowCount := 0;

    SELECT _table_id INTO v_UserId
    FROM user_users
    WHERE _table_uuid = f_UuidToBin(i_UserUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_SecurityAuthenticationMethodId
    FROM configuration_lookup_security_authentication_methods
    WHERE _table_uuid = f_UuidToBin(i_SecurityAuthenticationMethodUuid) AND _system_is_valid = 1
        AND _system_is_deleted = 0 AND is_active = 1;

    IF v_UserId > 0 AND v_SecurityAuthenticationMethodId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*)
            FROM security_users_credentials
            WHERE _system_is_valid = 1 AND users_id = v_UserId
                AND security_authentication_methods_id = v_SecurityAuthenticationMethodId
                AND _system_is_deleted = 0);
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_users_credentials', v_TableId);

        INSERT security_users_credentials (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, users_id,
            security_authentication_methods_id, remote_username, password, bearer_token,
            setting)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_UserId, 
            v_SecurityAuthenticationMethodId, i_RemoteUsername, f_ShaToBin(i_Password),
            i_BearerToken, i_Setting);

        CALL p_system_UnlockTable('security_users_credentials');

        -- Human readable transaction log
        CALL p_system_QuickTranslateString('Security Credential added.', v_TranslatedLogMessage);

        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'user', v_UserId, 'security_users_credentials', v_TableId,
            'record_added', v_TranslatedLogMessage, v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddUserPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddUserPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_UserUuid CHAR(36) CHARSET utf8,
    IN i_PartitionUuid CHAR(36) CHARSET utf8,
    IN i_PermissionUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_UserId BIGINT;
    DECLARE v_PermissionId BIGINT;
    DECLARE v_PartitionId BIGINT;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT;

    SET v_RowCount := 0;

    SELECT _table_id INTO v_PermissionId
    FROM security_permissions
    WHERE _table_uuid = f_UuidToBin(i_PermissionUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_UserId
    FROM user_users
    WHERE _table_uuid = f_UuidToBin(i_UserUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_PartitionId
    FROM system_partitions
    WHERE _table_uuid = f_UuidToBin(i_PartitionUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    IF v_UserId > 0 AND v_PermissionId > 0 AND v_PartitionId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*)
            FROM security_users_permissions
            WHERE _system_is_valid = 1 AND users_id = v_UserId
                AND permissions_id = v_PermissionId
                AND partitions_id = v_PartitionId AND _system_is_deleted = 0);
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_users_permissions', v_TableId);

        INSERT security_users_permissions (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, users_id, partitions_id,
            permissions_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_UserId, v_PartitionId,
            v_PermissionId);

        CALL p_system_UnlockTable('security_users_permissions');

        -- Human readable transaction log
        CALL p_system_QuickTranslateString('User Permission assigned.', v_TranslatedLogMessage);

        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'user', v_UserId, 'security_users_permissions', v_TableId,
            'record_added', v_TranslatedLogMessage, v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_AddUserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_AddUserRole`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_UserUuid CHAR(36) CHARSET utf8,
    IN i_RoleUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_UserId BIGINT;
    DECLARE v_RoleId BIGINT;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT;
    
    SET v_RowCount := 0;

    SELECT _table_id INTO v_UserId
    FROM user_users
    WHERE _table_uuid = f_UuidToBin(i_UserUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_RoleId
    FROM security_roles
    WHERE _table_uuid = f_UuidToBin(i_RoleUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    IF v_UserId > 0 AND v_RoleId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*)
            FROM security_users_roles
            WHERE _system_is_valid = 1 AND users_id = v_UserId
                AND roles_id = v_RoleId AND _system_is_deleted = 0);
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('security_users_roles', v_TableId);

        INSERT security_users_roles (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, users_id, roles_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_UserId, v_RoleId);

        CALL p_system_UnlockTable('security_users_roles');

        -- Human readable transaction log
        CALL p_system_QuickTranslateString('Role assigned to user.', v_TranslatedLogMessage);

        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'user', v_UserId, 'security_users_roles', v_TableId,
            'record_added', v_TranslatedLogMessage, v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_CheckSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_CheckSession`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    OUT o_DoesExist BIT(1))
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_SessionUuid CHAR(36);

    SET v_SessionUuid := '';

    SELECT f_BinToUuid(_table_uuid)
    INTO v_SessionUuid
    FROM security_sessions
    WHERE _table_uuid = f_UuidToBin(i_SessionUuid)
        AND expiry >= UTC_TIMESTAMP()
    LIMIT 1;

    IF v_SessionUuid = i_SessionUuid THEN
        SET o_DoesExist = 1;
    ELSE
        SET o_DoesExist = 0;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_EndSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_EndSession`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableId BIGINT;
    DECLARE v_SessionLength BIGINT;
    DECLARE v_Expiry DATETIME;
    DECLARE v_TranslatedLogMessage TEXT;
    DECLARE v_UserId BIGINT;
    DECLARE v_TransactionId BIGINT;

    SELECT _system_auto_id, users_id
    INTO v_TableId, v_UserId
    FROM security_sessions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid)
        AND expiry > UTC_TIMESTAMP();

    IF COALESCE(v_TableId, 0) > 0 THEN
        SET v_Expiry := UTC_TIMESTAMP();

        UPDATE security_sessions SET expiry = v_Expiry
        WHERE _system_auto_id = v_TableId;

        -- Human readable transaction log
        CALL p_system_QuickTranslateString('Session Ended.', v_TranslatedLogMessage);

        CALL p_system_LogTransaction(i_TableUuid, NULL,
            'user', v_UserId, 'security_session', v_TableId,
            'record_added', v_TranslatedLogMessage, v_TransactionId);

        SELECT i_TableUuid AS 'token', v_Expiry AS 'expiry';
    ELSE
        SELECT NULL AS 'token', NULL AS 'expiry';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ExtendSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ExtendSession`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableId BIGINT;
    DECLARE v_SessionLength BIGINT;

    DECLARE v_old_Expiry DATETIME;
    DECLARE v_Expiry DATETIME;

    SELECT _system_auto_id, expiry, session_length
    INTO v_TableId, v_old_Expiry, v_SessionLength
    FROM security_sessions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid)
        AND expiry > UTC_TIMESTAMP();

    IF COALESCE(v_TableId, 0) > 0 THEN
        IF ISNULL(v_SessionLength) THEN
            SET v_SessionLength := 20;
        END IF;

        SET v_Expiry := DATE_ADD(UTC_TIMESTAMP(), INTERVAL v_SessionLength MINUTE);

        UPDATE security_sessions SET expiry = v_Expiry
        WHERE _system_auto_id = v_TableId;

        SELECT i_TableUuid AS 'token', v_Expiry AS 'expiry';
    ELSE
        SELECT NULL AS 'token', NULL AS 'expiry';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_FetchNonce` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_FetchNonce`(IN i_Nonce CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_NonceCount INT;

    SET v_NonceCount := (SELECT COUNT(*) FROM security_nonces
        WHERE nonce = f_UuidToBin(i_Nonce)
            AND first_used > DATE_ADD(UTC_TIMESTAMP(), INTERVAL -7 DAY));

    IF ISNULL(v_NonceCount) THEN
        SELECT 0 AS nonce_count;
    ELSE
        SELECT v_NonceCount AS nonce_count;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_FetchPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_FetchPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(p._table_uuid) AS '_table_uuid',
        f_BinToUuid(m._table_uuid) AS 'module_uuid',
        m.module_name AS 'module_name',
        p.permission_name AS 'permission_name',
        p.description AS 'description',
        p.magic AS 'magic',
        p.importance AS 'importance'
    FROM security_permissions AS p
        LEFT OUTER JOIN system_modules AS m ON m._table_id=p.modules_id
            AND m._system_is_valid = 1 AND m._system_is_deleted = 0
    WHERE p._table_uuid = v_TableUuid AND p._system_is_valid = 1 AND p._system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_FetchRegistration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_FetchRegistration`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(r._table_uuid) AS '_table_uuid',
        f_BinToUuid(t._table_uuid) AS 'security_client_type_uuid',
        t.name_label AS 'security_client_type_name_label',
        t.display_label AS 'security_client_type_display_label',
        r.api_public AS 'api_public',
        r.api_private AS 'api_private',
        r.description AS 'description',
        f_DateToOutput(r.created) AS 'created',
        f_BitToOutput(r.is_active) AS 'is_active'
    FROM security_registrations AS r
        LEFT OUTER JOIN configuration_lookup_security_client_types AS t ON t._table_id=r.security_client_types_id
            AND t._system_is_valid = 1 AND t._system_is_deleted = 0
    WHERE r._table_uuid = v_TableUuid AND r._system_is_valid = 1 AND rp_security_FetchRegistration._system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_FetchRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_FetchRole`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(u._table_uuid) AS '_table_uuid',
        f_BinToUuid(p._table_uuid) AS 'partition_uuid',
        p.partition_name AS 'partition_name',
        r.role_name AS 'role_name',
        r.description AS 'description',
        f_BitToOutput(r.is_active) AS 'is_active'
    FROM security_roles AS r
        LEFT OUTER JOIN system_partitions AS p ON p._table_id=r.partitions_id
            AND p._system_is_valid = 1 AND p._system_is_deleted = 0
    WHERE r._table_uuid = v_TableUuid AND r._system_is_valid = 1
        AND r._system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_FetchSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_FetchSession`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_SessionUuid BINARY(16);

    IF i_SessionUuid = '' OR ISNULL(i_SessionUuid) THEN
        SET v_SessionUuid := NULL;
    ELSE
        SET v_SessionUuid := f_UuidToBin(i_SessionUuid);
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS token, f_DatetimeToOutput(expiry) AS expiry,
        data, language_code, session_length
    FROM security_sessions
    WHERE _table_uuid = v_SessionUuid
        AND expiry >= UTC_TIMESTAMP()
    LIMIT 1;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_FetchUserSessionBasic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_FetchUserSessionBasic`(IN i_UserUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_LanguageCode VARCHAR(20) CHARSET utf8;

    SELECT text_setting INTO v_LanguageCode
    FROM configuration_globals
    WHERE magic = 'default_language' AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    SELECT t.name_label AS 'title',
        u.first_name AS 'first_name',
        u.last_name AS 'last_name',
        f_BinToUuid(u._table_uuid) AS '_table_uuid',
        u._table_id AS '_table_id',
        COALESCE(l.language_code, v_LanguageCode) AS 'language_code'
    FROM user_users u
        LEFT JOIN configuration_lookup_global_titles AS t ON t._table_id = u.global_titles_id
            AND t._system_is_valid = 1 AND t._system_is_deleted = 0
        LEFT JOIN configuration_lookup_global_languages AS l ON l._table_id = u.preferred_global_languages_id
            AND l._system_is_valid = 1 AND l._system_is_deleted = 0
    WHERE u._table_uuid = f_UuidToBin(i_UserUuid)
        AND u._system_is_valid = 1 AND u._system_is_deleted = 0
    LIMIT 1;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_GenerateEffectivePermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_GenerateEffectivePermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_UserUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_UserId BIGINT;
    DECLARE v_TransactionId BIGINT;

    CREATE TEMPORARY TABLE temp_effective_permissions (`users_id` BIGINT,
        `permissions_id` BIGINT,
        `modules_id` BIGINT,
        `roles_id` BIGINT,
        `partitions_id` BIGINT,
        `magic` VARCHAR(70) CHARSET utf8,
        `setting` BIT(1),
        `importance` TINYINT)
    ENGINE=memory DEFAULT CHARSET=utf8;

    CREATE TEMPORARY TABLE temp_lower_permissions (`users_id` BIGINT,
        `permissions_id` BIGINT,
        `modules_id` BIGINT,
        `roles_id` BIGINT,
        `partitions_id` BIGINT,
        `magic` VARCHAR(70) CHARSET utf8,
        `setting` BIT(1),
        `importance` TINYINT)
    ENGINE=memory DEFAULT CHARSET=utf8;

    SET v_UserId := (SELECT _table_id FROM user_users WHERE _table_uuid = f_UuidToBin(i_UserUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);

    INSERT temp_effective_permissions (users_id, partitions_id, permissions_id, magic,
        setting, importance, modules_id)
    SELECT up.users_id, up.partitions_id, up.permissions_id, p.magic, 1,
        p.importance, p.modules_id
    FROM security_users_permissions AS up
        JOIN security_permissions AS p ON p._table_id = up.permissions_id AND p._system_is_valid = 1 AND p._system_is_deleted = 0
    WHERE up.users_id = v_UserId AND up._system_is_valid = 1 AND up._system_is_deleted = 0;

    INSERT temp_effective_permissions (users_id, partitions_id, roles_id, permissions_id,
        magic, setting, importance, modules_id)
    SELECT ur.users_id, r.partitions_id, rp.roles_id, rp.permissions_id, p.magic, 1,
        p.importance, p.modules_id
    FROM security_roles_permissions AS rp
        JOIN security_users_roles AS ur ON ur.roles_id = rp.roles_id AND ur._system_is_valid = 1 AND ur._system_is_deleted = 0
        JOIN security_roles AS r on r._table_id = rp.roles_id AND r._system_is_valid = 1 AND r._system_is_deleted = 0
        JOIN security_permissions p ON p._table_id = rp.permissions_id AND p._system_is_valid = 1 AND p._system_is_deleted = 0
    WHERE ur.users_id = v_UserId AND rp._system_is_valid = 1 AND rp._system_is_deleted = 0;

    -- Inherit lower permissions
    INSERT temp_lower_permissions (users_id, partitions_id, roles_id, setting, permissions_id,
        importance, magic)
    SELECT t.users_id, t.partitions_id, t.roles_id, t.setting, p._table_id, p.importance,
        p.magic
    FROM temp_effective_permissions AS t
        JOIN security_permissions AS p ON p.modules_id=t.modules_id AND p.importance < t.importance
    WHERE t.setting = 1;

    INSERT temp_effective_permissions (users_id, partitions_id, roles_id, setting, permissions_id,
        importance, magic)
    SELECT users_id, partitions_id, roles_id, setting, permissions_id,
        importance, magic
    FROM temp_lower_permissions;

    DELETE FROM security_effective_permissions WHERE users_id = v_UserId;

    INSERT security_effective_permissions (users_id, partitions_id, permissions_id, magic, setting)
    SELECT users_id, partitions_id, permissions_id, magic, MAX(setting) AS setting
    FROM temp_effective_permissions
    GROUP BY users_id, partitions_id, permissions_id, magic
    HAVING MAX(setting)=1;

    -- Human readable transaction log
    CALL p_system_LogTransaction(i_SessionUuid, NULL,
        'user', v_UserId, 'security_effective_permissions', v_UserId,
        'permissions_regenerated', '', v_TransactionId);

    DROP TEMPORARY TABLE IF EXISTS temp_effective_permissions;
    DROP TEMPORARY TABLE IF EXISTS temp_lower_permissions;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ListMessagePermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ListMessagePermission`()
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    SELECT m.message_name AS message_name,
        m.magic AS message_magic,
        p.permission_name AS permission_name,
        p.magic AS permission_magic,
        CASE WHEN mp.do_partition_check = 1 THEN 1 ELSE 0 END AS do_partition_check,
        CASE WHEN mp.run_unauthenticated = 1 THEN 1 ELSE 0 END AS run_unauthenticated
    FROM security_messages_permissions AS mp
        INNER JOIN system_messages AS m ON m._table_id = mp.messages_id AND m._system_is_valid = 1 AND m._system_is_deleted = 0
        INNER JOIN security_permissions AS p ON p._table_id = mp.permissions_id AND p._system_is_valid = 1 AND p._system_is_deleted = 0
    WHERE mp._system_is_valid = 1 AND mp._system_is_deleted = 0
    ORDER BY m.message_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ListPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ListPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT COUNT(*) INTO v_TotalCount
    FROM security_permissions
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(p._table_uuid) AS '_table_uuid',
        m.module_name AS 'module_name',
        f_BinToUuid(m._table_uuid) AS 'module_uuid',
        p.permission_name AS 'permission_name',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM security_permissions AS p
        LEFT OUTER JOIN system_modules AS m ON m._table_id=p.modules_id
            AND m._system_is_valid = 1 AND m._system_is_deleted = 0 AND m.is_active = 1
    WHERE p._system_is_valid = 1 AND p._system_is_deleted = 0
    ORDER BY p.permission_name, COALESCE(m.module_name, '');

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ListRegistration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ListRegistration`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM security_registrations
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(r._table_uuid) AS '_table_uuid',
        t.name_label AS 'security_client_type_name_label',
        t.display_label AS 'security_client_type_display_label',
        f_BinToUuid(t._table_uuid) AS 'security_client_type_uuid',
        r.api_public AS 'api_public',
        f_BitToOutput(r.is_active) AS 'is_active',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM security_registrations AS r
        LEFT OUTER JOIN configuration_lookup_security_client_types AS t ON t._table_id=r.security_client_types_id
            AND t._system_is_valid = 1 AND t._system_is_deleted = 0 AND t.is_active = 1
    WHERE r._system_is_valid = 1 AND r._system_is_deleted = 0
    ORDER BY r.is_active DESC, COALESCE(t.name_label, ''), r.api_public;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ListRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ListRole`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT COUNT(*) INTO v_TotalCount
    FROM system_roles
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(r._table_uuid) AS '_table_uuid',
        p.module_name AS 'partition_name',
        f_BinToUuid(p._table_uuid) AS 'partition_uuid',
        r.role_name AS 'role_name',
        f_BitToOutput(r.is_active) AS 'is_active',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM security_roles AS r
        LEFT OUTER JOIN system_partitions AS p
            ON p._table_id = r.partitions_id
            AND p._system_is_valid = 1 AND p._system_is_deleted = 0
            AND p.is_active = 1
    WHERE r._system_is_valid = 1 AND r._system_is_deleted = 0
    ORDER BY r.is_active DESC, r.role_name, p.partition_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ListUserCredential` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ListUserCredential`(IN i_Username VARCHAR(100) CHARSET utf8,
    IN i_Method VARCHAR(100) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_Username VARCHAR(100) CHARSET utf8;
    DECLARE v_Method VARCHAR(50) CHARSET utf8;

    IF i_Username = '' OR ISNULL(i_Username) THEN
        SET v_Username := NULL;
    ELSE
        SET v_Username := i_Username;
    END IF;

    IF i_Method = '' OR ISNULL(i_Method) THEN
        SET v_Method := '';
    ELSE
        SET v_Method := i_Method;
    END IF;

    SELECT f_BinToUuid(u._table_uuid) AS '_table_uuid',
        u._table_id AS '_table_id',
        u.username AS 'username',
        s.remote_username AS 'remote_username',
        f_BinToSha(s.password) AS 'password',
        s.bearer_token AS 'bearer_token'
    FROM user_users AS u
        INNER JOIN security_users_credentials AS s ON s.users_id = u._table_id
        INNER JOIN configuration_lookup_security_authentication_methods AS m ON m._table_id = s.security_authentication_methods_id
    WHERE u.username = v_Username
        AND LOWER(m.magic) = LOWER(v_Method)
        AND s._system_is_valid = 1 AND s._system_is_deleted = 0
        AND u._system_is_valid = 1 AND u._system_is_deleted = 0
        AND m._system_is_valid = 1 AND m._system_is_deleted = 0 AND m.is_active = 1
    LIMIT 1;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ListUserDockItemPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ListUserDockItemPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientType VARCHAR(50) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_UserId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE magic = LOWER(i_SecurityClientType)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT users_id
    INTO v_UserId
    FROM security_sessions
    WHERE _table_uuid = f_UuidToBin(i_SessionUuid)
        AND expiry >= UTC_TIMESTAMP();

    SELECT f_BinToUuid(di._table_uuid) AS '_table_uuid',
        di.item_name AS 'item_name',
        di.display_name AS 'display_name',
        di.description AS 'description',
        t.magic AS 'item_magic',
        di.weighting AS 'weighting',
        di.picture_path AS 'picture_path',
        di.item_action AS 'item_action',
        f_BinToUuid(d._table_uuid) AS 'docks_uuid',
        p.permission_name AS 'permission_name',
        p.magic AS 'permission_magic'
    FROM security_dock_items_permissions AS dip
        INNER JOIN system_dock_items AS di ON di._table_id = dip.dock_items_id AND di._system_is_valid = 1 AND di._system_is_deleted = 0
            AND di.security_client_types_id = v_SecurityClientTypeId
        INNER JOIN system_docks AS d ON d._table_id = di.docks_id AND d._system_is_valid = 1 AND d._system_is_deleted = 0
            AND d.security_client_types_id = v_SecurityClientTypeId
        INNER JOIN security_permissions AS p ON p._table_id = dip.permissions_id AND p._system_is_valid = 1 AND p._system_is_deleted = 0
        INNER JOIN security_effective_permissions AS ep ON ep.permissions_id = dip.permissions_id AND ep.users_id = v_UserId
        LEFT OUTER JOIN configuration_lookup_system_dock_types AS t ON t._table_id = di.system_dock_types_id AND t._system_is_valid = 1 AND t._system_is_deleted = 0
    WHERE dip._system_is_valid = 1 AND dip._system_is_deleted = 0 AND d.is_active = 1 AND di.is_active = 1
    ORDER BY d.weighting DESC, d.dock_name DESC, di.weighting, di.item_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ListUserDockPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ListUserDockPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientType VARCHAR(50) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_UserId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE magic = LOWER(i_SecurityClientType)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT users_id
    INTO v_UserId
    FROM security_sessions
    WHERE _table_uuid = f_UuidToBin(i_SessionUuid)
        AND expiry >= UTC_TIMESTAMP();

    SELECT f_BinToUuid(d._table_uuid) AS '_table_uuid',
        d.dock_name AS 'dock_name',
        d.display_name AS 'display_name',
        d.description AS 'description',
        d.weighting AS 'weighting',
        d.picture_path AS 'picture_path',
        p.permission_name AS 'permission_name',
        p.magic AS 'permission_magic'
    FROM security_docks_permissions AS dp
        INNER JOIN system_docks AS d ON d._table_id = dp.docks_id AND d._system_is_valid = 1 AND d._system_is_deleted = 0
            AND d.security_client_types_id = v_SecurityClientTypeId
        INNER JOIN security_permissions AS p ON p._table_id = dp.permissions_id AND p._system_is_valid = 1 AND p._system_is_deleted = 0
        INNER JOIN security_effective_permissions AS ep ON ep.permissions_id = dp.permissions_id AND ep.users_id = v_UserId
    WHERE dp._system_is_valid = 1 AND dp._system_is_deleted = 0 AND d.is_active = 1
    ORDER BY d.weighting, d.dock_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ListUserDockSubitemPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ListUserDockSubitemPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientType VARCHAR(50) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_UserId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE magic = LOWER(i_SecurityClientType)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT users_id
    INTO v_UserId
    FROM security_sessions
    WHERE _table_uuid = f_UuidToBin(i_SessionUuid)
        AND expiry >= UTC_TIMESTAMP();

    SELECT f_BinToUuid(di._table_uuid) AS '_table_uuid',
        ds.subitem_name AS 'subitem_name',
        ds.display_name AS 'display_name',
        ds.description AS 'description',
        t.magic AS 'subitem_magic',
        ds.weighting AS 'weighting',
        ds.picture_path AS 'picture_path',
        ds.subitem_action AS 'subitem_action',
        f_BinToUuid(d._table_uuid) AS 'docks_uuid',
        f_BinToUuid(di._table_uuid) AS 'dock_items_uuid',
        p.permission_name AS 'permission_name',
        p.magic AS 'permission_magic'
    FROM security_dock_subitems_permissions AS dsp
        INNER JOIN system_dock_subitems AS ds ON ds._table_id = dsp.dock_subitems_id AND ds._system_is_valid = 1
            AND ds._system_is_deleted = 0 AND ds.security_client_types_id = v_SecurityClientTypeId
        INNER JOIN system_dock_items AS di ON di._table_id = ds.dock_items_id AND di._system_is_valid = 1
            AND di._system_is_deleted = 0 AND di.security_client_types_id = v_SecurityClientTypeId
        INNER JOIN system_docks AS d ON d._table_id = di.docks_id AND d._system_is_valid = 1 AND d._system_is_deleted = 0
            AND d.security_client_types_id = v_SecurityClientTypeId
        INNER JOIN security_permissions AS p ON p._table_id = dsp.permissions_id AND p._system_is_valid = 1 AND p._system_is_deleted = 0
        INNER JOIN security_effective_permissions AS ep ON ep.permissions_id = dsp.permissions_id AND ep.users_id = v_UserId
        LEFT OUTER JOIN configuration_lookup_system_dock_types AS t ON t._table_id = ds.system_dock_types_id AND t._system_is_valid = 1 AND t._system_is_deleted = 0
    WHERE dsp._system_is_valid = 1 AND dsp._system_is_deleted = 0 AND d.is_active = 1 AND di.is_active = 1 AND ds.is_active = 1
    ORDER BY d.weighting DESC, d.dock_name DESC, di.weighting DESC, di.item_name DESC, ds.weighting, ds.subitem_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ListUserDockTabPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ListUserDockTabPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientType VARCHAR(50) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_UserId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;

    DROP TEMPORARY TABLE IF EXISTS temp_tab_permissions;

    CREATE TEMPORARY TABLE temp_tab_permissions (`_system_auto_id` BIGINT AUTO_INCREMENT,
        `_table_id` BIGINT,
        `_table_uuid` CHAR(36),
        `tab_name` VARCHAR(50) CHARSET utf8,
        `display_name` VARCHAR(50) CHARSET utf8,
        `weighting` SMALLINT,
        `picture_path` VARCHAR(500) CHARSET utf8,
        `tab_action` VARCHAR(500) CHARSET utf8,
        `dock_items_uuid` CHAR(36) CHARSET utf8,
        `dock_subitems_uuid` CHAR(36) CHARSET utf8,
        `permission_name` VARCHAR(50) CHARSET utf8,
        `permission_magic` VARCHAR(50) CHARSET utf8,
        PRIMARY KEY (`_system_auto_id`))
    ENGINE=memory DEFAULT CHARSET=utf8;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE magic = LOWER(i_SecurityClientType)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT users_id
    INTO v_UserId
    FROM security_sessions
    WHERE _table_uuid = f_UuidToBin(i_SessionUuid)
        AND expiry >= UTC_TIMESTAMP();

    INSERT temp_tab_permissions (_table_uuid, tab_name,
        display_name, weighting, picture_path,
        tab_action, dock_items_uuid, dock_subitems_uuid,
        permission_name, permission_magic, _table_id)
    SELECT f_BinToUuid(dt._table_uuid), dt.tab_name,
        dt.display_name, dt.weighting, dt.picture_path,
        dt.tab_action, f_BinToUuid(di._table_uuid), '',
        p.permission_name, p.magic, dt._table_id
    FROM security_dock_tabs_permissions AS dtp
        INNER JOIN system_dock_tabs AS dt ON dt._table_id = dtp.dock_tabs_id AND dt._system_is_valid = 1 AND dt._system_is_deleted = 0
            AND dt.security_client_types_id = v_SecurityClientTypeId
        INNER JOIN system_dock_items AS di ON di._table_id = dt.dock_items_id AND di._system_is_valid = 1 AND di._system_is_deleted = 0
            AND di.security_client_types_id = v_SecurityClientTypeId
        INNER JOIN security_permissions AS p ON p._table_id = dtp.permissions_id AND p._system_is_valid = 1 AND p._system_is_deleted = 0
        INNER JOIN security_effective_permissions AS ep ON ep.permissions_id = dtp.permissions_id AND ep.users_id = v_UserId
    WHERE dtp._system_is_valid = 1 AND dtp._system_is_deleted = 0 AND dt.is_active = 1 AND di.is_active = 1
    ORDER BY di.weighting DESC, di.item_name DESC, dt.weighting, dt.tab_name;

    INSERT temp_tab_permissions (_table_uuid, tab_name,
        display_name, weighting, picture_path,
        tab_action, dock_items_uuid, dock_subitems_uuid,
        permission_name, permission_magic, _table_id)
    SELECT f_BinToUuid(dt._table_uuid),
        dt.tab_name, dt.display_name,
        dt.weighting, dt.picture_path,
        dt.tab_action, '', f_BinToUuid(ds._table_uuid),
        p.permission_name, p.magic, dt._table_id
    FROM security_dock_tabs_permissions AS dtp
        INNER JOIN system_dock_tabs AS dt ON dt._table_id = dtp.dock_tabs_id AND dt._system_is_valid = 1 AND dt._system_is_deleted = 0
            AND dt.security_client_types_id = v_SecurityClientTypeId
        INNER JOIN system_dock_subitems AS ds ON ds._table_id = dt.dock_subitems_id AND ds._system_is_valid = 1 AND ds._system_is_deleted = 0
            AND ds.security_client_types_id = v_SecurityClientTypeId
        INNER JOIN security_permissions AS p ON p._table_id = dtp.permissions_id AND p._system_is_valid = 1 AND p._system_is_deleted = 0
        INNER JOIN security_effective_permissions AS ep ON ep.permissions_id = dtp.permissions_id AND ep.users_id = v_UserId
    WHERE dtp._system_is_valid = 1 AND dtp._system_is_deleted = 0 AND dt.is_active = 1 AND ds.is_active = 1
    ORDER BY ds.weighting DESC, ds.subitem_name DESC, dt.weighting, dt.tab_name;

    SELECT t._table_uuid AS '_table_uuid',
        t.tab_name AS 'tab_name',
        t.display_name AS 'display_name',
        dt.description AS 'description',
        t.weighting AS 'weighting',
        t.picture_path AS 'picture_path',
        t.tab_action AS 'tab_action',
        t.dock_items_uuid AS 'dock_items_uuid',
        t.dock_subitems_uuid AS 'dock_subitems_uuid',
        t.permission_name AS 'permission_name',
        t.permission_magic AS 'permission_magic'
    FROM temp_tab_permissions AS t
        INNER JOIN system_dock_tabs AS dt ON dt._table_id=t._table_id
    ORDER BY t._system_auto_id;

    DROP TEMPORARY TABLE IF EXISTS temp_tab_permissions;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ListUserSessionPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ListUserSessionPermission`(IN i_UserUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    SELECT ep.users_id AS 'users_id',
        f_BinToUuid(u._table_uuid) AS 'users_uuid',
        ep.partitions_id AS 'partitions_id',
        f_BinToUuid(pa._table_uuid) AS 'partitions_uuid',
        ep.permissions_id AS 'permissions_id',
        f_BinToUuid(pe._table_uuid) AS 'permissions_uuid',
        pe.permission_name AS 'permission_name',
        ep.magic AS 'magic',
        ep.setting AS 'setting'
    FROM security_effective_permissions AS ep
        JOIN user_users AS u ON u._table_id=ep.users_id AND u._system_is_valid = 1 AND u._system_is_deleted = 0
        JOIN system_partitions AS pa ON pa._table_id=ep.partitions_id AND pa._system_is_valid = 1 AND pa._system_is_deleted = 0
        JOIN security_permissions AS pe ON pe._table_id=ep.partitions_id AND pe._system_is_valid = 1 AND pe._system_is_deleted = 0
    WHERE u._table_uuid = f_UuidToBin(i_UserUuid)
    ORDER BY ep.magic;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ModifyPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ModifyPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_ModuleUuid CHAR(36) CHARSET utf8,
    IN i_PermissionName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Importance TINYINT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_ModuleId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_old_ModuleId BIGINT;
    DECLARE v_old_PermissionName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_Magic VARCHAR(70) CHARSET utf8;
    DECLARE v_old_Importance TINYINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_ModuleLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_ModuleLookupLabel VARCHAR(100) CHARSET utf8;

    SELECT _table_id
    INTO v_ModuleId
    FROM system_modules
    WHERE _table_uuid = f_UuidToBin(i_ModuleUuid)
        AND _system_is_valid = 1;

    SET v_RowCount := (SELECT COUNT(*) FROM security_permissions
        WHERE permission_name = i_PermissionName AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0 AND modules_id = v_ModuleId);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, permission_name,
            description, magic, importance, modules_id
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_PermissionName,
            v_old_Description, v_old_Magic, v_old_Importance, v_old_ModuleId
        FROM security_permissions
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_PermissionName, '') != COALESCE(v_old_PermissionName, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '')
            OR COALESCE(v_ModuleId, 0) != COALESCE(v_old_ModuleId, 0)
            OR COALESCE(i_Importance, 0) != COALESCE(v_old_Importance, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT security_permissions (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                permission_name, description, magic, modules_id,
                importance)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_PermissionName, i_Description, i_Magic, v_ModuleId,
                i_Importance
            FROM security_permissions
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE security_permissions SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_permissions', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_PermissionName, '') != COALESCE(v_old_PermissionName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'security_permissions', v_TableId, 'permission_name', v_old_PermissionName,
                    i_PermissionName, 'Permission Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'security_permissions', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'security_permissions', v_TableId, 'magic', v_old_Magic,
                    i_Magic, 'Magic', v_HumanReadable);
            END IF;

            IF COALESCE(v_ModuleId, 0) != COALESCE(v_old_ModuleId, 0) THEN
                SELECT module_name
                INTO v_old_ModuleLookupLabel
                FROM system_modules
                WHERE _table_id = v_old_ModuleId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT module_name
                INTO v_ModuleLookupLabel
                FROM system_modules
                WHERE _table_id = v_ModuleId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'security_permissions', v_TableId, 'modules_id', v_old_ModuleId,
                    v_ModuleId, 'Module', v_old_ModuleLookupLabel, v_ModuleLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_Importance, 0) != COALESCE(v_old_Importance, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'security_permissions', v_TableId, 'importance', v_old_Importance,
                    i_Importance, 'Importance', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ModifyRegistration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ModifyRegistration`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_ApiPublic CHAR(36) CHARSET utf8,
    IN i_ApiPrivate CHAR(64) CHARSET utf8,
    IN i_SecurityClientTypeUuid CHAR(36) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_old_ApiPublic CHAR(36) CHARSET utf8;
    DECLARE v_old_ApiPrivate CHAR(64) CHARSET utf8;
    DECLARE v_old_SecurityClientTypeId CHAR(36) CHARSET utf8;
    DECLARE v_ApiPrivate CHAR(64) CHARSET utf8;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_SecurityClientTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_SecurityClientTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_IsActive BIT(1);

    SELECT _table_id
    INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE _table_uuid = f_UuidToBin(i_SecurityClientTypeUuid)
        AND _system_is_active = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM security_registrations
        WHERE api_public = f_UuidToBin(i_ApiPublic) AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0 AND security_client_types_id = v_SecurityClientTypeId);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            f_BinToUuid(api_public), f_BinToSha(api_private), security_client_types_id,
            description, is_active
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_ApiPublic,
            v_old_ApiPrivate, v_old_SecurityClientTypeId, v_old_Description,
            v_old_IsActive
        FROM security_registrations
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_ApiPrivate, '') = '' THEN
            SET v_ApiPrivate := v_old_ApiPrivate;
        ELSE
            SET v_ApiPrivate := i_ApiPrivate;
        END IF;

        IF COALESCE(i_ApiPublic, '') != COALESCE(v_old_ApiPublic, '')
            OR COALESCE(v_ApiPrivate, '') != COALESCE(v_old_ApiPrivate, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(v_SecurityClientId, 0) != COALESCE(v_old_SecurityClientTypeId, 0)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT security_registrations (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                api_public, api_private, security_client_types_id, description, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, f_UuidToBin(i_ApiPublic), f_ShaToBin(v_ApiPrivate),
                v_SecurityClientTypeId, i_Description, is_active
            FROM security_registrations
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE security_registrations SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_registrations', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_ApiPublic, '') != COALESCE(v_old_ApiPublic, '') THEN
                CALL p_system_LogTransactionDetailUuid(v_TransactionId,
                    'security_registrations', v_TableId, 'api_public', v_old_PermissionName,
                    i_PermissionName, 'API Public', v_HumanReadable);
            END IF;

            IF COALESCE(v_ApiPrivate, '') != COALESCE(v_old_ApiPrivate, '') THEN
                CALL p_system_LogTransactionDetailSha(v_TransactionId,
                    'security_registrations', v_TableId, 'api_private', v_old_ApiPrivate,
                    v_ApiPrivate, 'API Private', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailSha(v_TransactionId,
                    'security_registrations', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_SecurityClientTypeId, 0) != COALESCE(v_old_SecurityClientTypeId, 0) THEN
                SELECT name_label
                INTO v_old_SecurityClientTypeLookupLabel
                FROM configuration_lookup_security_client_types
                WHERE _table_id = v_old_SecurityClientTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_SecurityClientTypeLookupLabel
                FROM configuration_lookup_security_client_types
                WHERE _table_id = v_SecurityClientTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'security_registrations', v_TableId, 'security_client_types_id', v_old_SecurityClientTypeId,
                    v_SecurityClientTypeId, 'Security Client Type', v_old_SecurityClientTypeLookupLabel,
                    v_SecurityClientTypeLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailBit(v_TransactionId,
                    'security_registrations', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ModifyRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ModifyRole`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_PartitionUuid CHAR(36) CHARSET utf8,
    IN i_RoleName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_PartitionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_old_PartitionId BIGINT;
    DECLARE v_old_RoleName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_PartitionLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_PartitionLookupLabel VARCHAR(100) CHARSET utf8;

    SELECT _table_id
    INTO v_PartitionId
    FROM system_partitions
    WHERE _table_uuid = f_UuidToBin(i_PartitionUuid)
        AND _system_is_active = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM security_roles
        WHERE role_name = i_RoleName AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0 AND partitions_id = v_PartitionId);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            partitions_id, role_name, description, is_active
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_PartitionId,
            v_old_RoleName, v_old_Description, v_old_IsActive
        FROM security_roles
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_RoleName, '') != COALESCE(v_old_RoleName, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(v_PartitionId, 0) != COALESCE(v_old_PartitionId, 0)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT security_roles (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                role_name, partitions_id, description, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_RoleName, v_PartitionId, i_Description, i_IsActive
            FROM security_roles
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE security_roles SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_roles', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_RoleName, '') != COALESCE(v_old_RoleName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'security_roles', v_TableId, 'role_name', v_old_RoleName,
                    i_RoleName, 'Role Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'security_roles', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_PartitionId, 0) != COALESCE(v_old_PartitionId, 0) THEN
                SELECT partition_name
                INTO v_old_PartitionLookupLabel
                FROM system_partitions
                WHERE _table_id = v_old_PartitionId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT partition_name
                INTO v_PartitionLookupLabel
                FROM system_partitions
                WHERE _table_id = v_PartitionId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'security_roles', v_TableId, 'partitions_id', v_old_PartitionId,
                    v_PartitionId, 'Paritition', v_old_PartitionLookupLabel,
                    v_PartitionLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailBit(v_TransactionId,
                    'security_roles', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ModifySession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ModifySession`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8, 
    IN i_Data TEXT CHARSET utf8,
    IN i_LanguageCode VARCHAR(20) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_UserId BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_SessionLength BIGINT;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;

    DECLARE v_old_Data TEXT CHARSET utf8;
    DECLARE v_old_LanguageCode VARCHAR(20) CHARSET utf8;
    DECLARE v_old_Expiry DATETIME;
    DECLARE v_Expiry DATETIME;

    SELECT _system_auto_id, data, expiry, language_code, users_id,
        session_length, _table_uuid
    INTO v_TableId, v_old_Data, v_old_Expiry, v_old_LanguageCode,
        v_UserId, v_SessionLength, v_TableUuid
    FROM security_sessions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid)
        AND expiry > UTC_TIMESTAMP();

    IF COALESCE(v_TableId, 0) > 0 THEN
        IF ISNULL(v_SessionLength) THEN
            SET v_SessionLength := 20;
        END IF;

        SET v_Expiry := DATE_ADD(UTC_TIMESTAMP(), INTERVAL v_SessionLength MINUTE);

        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        UPDATE security_sessions SET expiry = v_Expiry, data = i_Data,
            language_code = i_LanguageCode
        WHERE _system_auto_id = v_TableId;

        -- Human readable transaction log
        CALL p_system_QuickTranslateString('Session Modified', v_TranslatedLogMessage);

        CALL p_system_LogTransaction(v_TableUuid, NULL,
            'user', v_UserId, 'security_session', v_TableId,
            'record_modified', v_TranslatedLogMessage, v_TransactionId);

        SELECT i_SessionUuid AS 'token', v_Expiry AS 'expiry';
    ELSE
        SELECT NULL AS 'token', NULL AS 'expiry';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_ModifyUserCredential` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_ModifyUserCredential`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_UserUuid CHAR(36) CHARSET utf8,
    IN i_SecurityAuthenticationMethodUuid CHAR(36) CHARSET utf8,
    IN i_RemoteUsername VARCHAR(100) CHARSET utf8,
    IN i_Password CHAR(64) CHARSET utf8,
    IN i_bearer_token VARCHAR(200) CHARSET utf8,
    IN i_Setting BIT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_UserId BIGINT;
    DECLARE v_SecurityAuthenticationMethodId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_old_UserId BIGINT;
    DECLARE v_old_SecurityAuthenticationMethodId BIGINT;
    DECLARE v_old_RemoteUsername VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Password CHAR(64) CHARSET utf8;
    DECLARE v_old_BearerToken VARCHAR(200) CHARSET utf8;
    DECLARE v_old_Setting BIT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_UserLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_UserLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_SecurityAuthenticationMethodLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_SecurityAuthenticationMethodLookupLabel VARCHAR(100) CHARSET utf8;

    SELECT _table_id
    INTO v_UserId
    FROM user_users
    WHERE _table_uuid = f_UuidToBin(i_UserUuid)
        AND _system_is_active = 1 AND _system_is_deleted = 0;

    SELECT _table_id
    INTO v_SecurityAuthenticationMethodId
    FROM p_configuration_AddSecurityAuthenticationMethod
    WHERE _table_uuid = f_UuidToBin(i_SecurityAuthenticationMethodUuid)
        AND _system_is_active = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM security_users_credentials
        WHERE _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0 AND users_id = v_UserId
            AND security_authentication_methods_id = v_SecurityAuthenticationMethodId);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            users_id, security_authentication_methods_id, remote_username,
            f_BinToSha(password), bearer_token, setting
        INTO v_TableUuid, v_TableId, v_SystemPreviousId,
            v_old_UserId, v_old_SecurityAuthenticationMethodId,
            v_old_RemoteUsername, v_old_Password, v_old_BearerToken, v_old_Setting
        FROM security_users_credentials
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(v_UserId, 0) != COALESCE(v_old_UserId, 0)
            OR COALESCE(v_SecurityAuthenticationMethodId, 0) != COALESCE(v_old_SecurityAuthenticationMethodId, 0)
            OR COALESCE(i_RemoteUsername, '') != COALESCE(v_old_RemoteUsername, '')
            OR COALESCE(i_Password, '') != COALESCE(v_old_Password, '')
            OR COALESCE(i_BearerToken, '') != COALESCE(v_old_BearerToken, '')
            OR COALESCE(i_Setting, 0) != COALESCE(v_old_Setting, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT security_users_credentials (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                users_id, security_authentication_methods_id, remote_username,
                password, bearer_token, setting)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, v_UserId, v_SecurityAuthenticationMethodId, i_RemoteUsername,
                i_Password, i_BearerToken, i_Setting
            FROM security_users_credentials
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE security_users_credentials SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_users_credentials', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_UserId, 0) != COALESCE(v_old_UserId, 0) THEN
                SELECT CONCAT(t.name_label, ' ', u.first_name, ' ', u.last_name)
                INTO v_old_UserLookupLabel
                FROM user_users AS u
                    LEFT JOIN configuration_lookup_global_titles AS t ON t._table_id = u.global_titles_id
                        AND t._system_is_valid = 1 AND t._system_is_deleted = 0 AND t.is_active = 1
                WHERE u._table_id = v_old_UserId AND u._system_is_valid = 1 AND u._system_is_deleted = 0
                LIMIT 1;

                SELECT CONCAT(t.name_label, ' ', u.first_name, ' ', u.last_name)
                INTO v_UserLookupLabel
                FROM user_users AS u
                    LEFT JOIN configuration_lookup_global_titles AS t ON t._table_id = u.global_titles_id
                        AND t._system_is_valid = 1 AND t._system_is_deleted = 0 AND t.is_active = 1
                WHERE u._table_id = v_UserId AND u._system_is_valid = 1 AND u._system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'security_users_credentials', v_TableId, 'users_id', v_old_UserId,
                    v_UserId, 'User', v_old_UserLookupLabel,
                    v_UserLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_SecurityAuthenticationMethodId, 0) != COALESCE(v_old_SecurityAuthenticationMethodId, 0) THEN
                SELECT permission_name
                INTO v_old_SecurityAuthenticationMethodLookupLabel
                FROM security_permissions
                WHERE _table_id = v_old_SecurityAuthenticationMethodId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT permission_name
                INTO v_SecurityAuthenticationMethodLookupLabel
                FROM security_permissions
                WHERE _table_id = v_SecurityAuthenticationMethodId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'security_users_credentials', v_TableId, 'security_authentication_method_id', v_old_SecurityAuthenticationMethodId,
                    v_SecurityAuthenticationMethodId, 'Permission', v_old_SecurityAuthenticationMethodLookupLabel,
                    v_SecurityAuthenticationMethodLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_RemoteUsername, '') != COALESCE(v_old_RemoteUsername, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'security_users_credentials', v_TableId, 'remote_username', v_old_RemoteUsername,
                    i_RemoteUsername, 'Remote Username', v_HumanReadable);
            END IF;

            IF COALESCE(i_Password, '') != COALESCE(v_old_Password, '') THEN
                CALL p_system_LogTransactionDetailSha(v_TransactionId,
                    'security_users_credentials', v_TableId, 'password', v_old_Password,
                    i_Password, 'Password', v_HumanReadable);
            END IF;

            IF COALESCE(i_BearerToken, '') != COALESCE(v_old_BearerToken, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'security_users_credentials', v_TableId, 'bearer_token', v_old_BearerToken,
                    i_BearerToken, 'Bearer Token', v_HumanReadable);
            END IF;

            IF COALESCE(i_Setting, 0) != COALESCE(v_old_Setting, 0) THEN
                CALL p_system_LogTransactionDetailBit(v_TransactionId,
                    'security_users_credentials', v_TableId, 'setting', v_old_Setting,
                    i_Setting, 'Setting', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_QuickFetchRegistration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_QuickFetchRegistration`(IN i_ApiKey CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    SELECT f_BinToUuid(api_public) AS 'api_public',
        f_BinToSha(api_private) AS 'api_private',
        f_BinToUuid(_table_uuid) AS '_table_uuid',
        _table_id
    FROM security_registrations
    WHERE api_public = f_UuidToBin(i_ApiKey)
        AND _system_is_valid = 1 AND _system_is_deleted = 0
        AND is_active = 1
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemoveDockItemPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemoveDockItemPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM security_dock_items_permissions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_dock_items_permissions (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            dock_items_id, permissions_id, do_partition_check)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, dock_items_id, permissions_id, do_partition_check
        FROM security_dock_items_permissions
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_dock_items_permissions SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_dock_items_permissions', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemoveDockPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemoveDockPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM security_docks_permissions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_docks_permissions (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            docks_id, permissions_id, do_partition_check)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, docks_id, permissions_id, do_partition_check
        FROM security_docks_permissions
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_docks_permissions SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_docks_permissions', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemoveDockSubitemPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemoveDockSubitemPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM security_dock_subitems_permissions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_dock_subitems_permissions (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            dock_items_id, permissions_id, do_partition_check)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, dock_items_id, permissions_id, do_partition_check
        FROM security_dock_subitems_permissions
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_dock_subitems_permissions SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_dock_subitems_permissions', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemoveDockTabPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemoveDockTabPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM security_dock_tabs_permissions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_dock_tabs_permissions (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            dock_items_id, permissions_id, do_partition_check)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, dock_items_id, permissions_id, do_partition_check
        FROM security_dock_tabs_permissions
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_dock_tabs_permissions SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_dock_tabs_permissions', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemoveMessagePermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemoveMessagePermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM security_messages_permissions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_messages_permissions (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            messages_id, permissions_id, do_partition_check, run_unauthenticated)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, messages_id, permissions_id, do_partition_check, run_unauthenticated
        FROM security_messages_permissions
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_messages_permissions SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_messages_permissions', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemovePermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemovePermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM security_permissions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM security_roles_permissions
    WHERE _system_is_active = 1 AND _system_is_deleted = 0
        AND permissions_id = v_TableId;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM security_users_permissions
        WHERE _system_is_active = 1 AND _system_is_deleted = 0
            AND permissions_id = v_TableId;
    END IF;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_permissions (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            modules_id, permission_name, description, magic, importance)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, modules_id, permission_name, description, magic, importance
        FROM security_permissions
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_permissions SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        DELETE FROM security_effective_permissions WHERE permissions_id = v_TableId;

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_permissions', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemoveRegistration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemoveRegistration`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM security_registrations
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_registrations (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _ssytem_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            api_public, api_private, security_client_types_id, created, description,
            is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, api_public, api_private, security_client_types_id,
            created, description, is_active
        FROM security_registrations
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_registrations SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_registrations', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemoveRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemoveRole`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM security_roles
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM security_roles_permissions
    WHERE _system_is_active = 1 AND _system_is_deleted = 0
        AND roles_id = v_TableId;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM security_users_roles
        WHERE _system_is_active = 1 AND _system_is_deleted = 0
            AND roles_id = v_TableId;
    END IF;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_roles (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            partitions_id, role_name, description, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, partitions_id, role_name, description, is_active
        FROM security_roles
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_roles SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_roles', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemoveRolePermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemoveRolePermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM security_roles_permissions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_roles_permissions (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            roles_id, permissions_id, setting)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, roles_id, permissions_id, setting
        FROM security_roles_permissions
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_roles_permissions SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'security', 0, 'security_roles_permissions', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemoveUserCredential` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemoveUserCredential`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UserId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, users_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_UserId
    FROM security_users_credentials
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_users_credentials (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            users_id, security_authentication_methods_id, remote_username, password, bearer_token)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, users_id, security_authentication_methods_id, remote_username, password, bearer_token
        FROM security_users_credentials
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_users_credentials SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_QuickTranslateString('Security Credential removed.', v_TranslatedLogMessage);

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'user', v_UserId, 'security_users_credentials', v_TableId,
                'record_removed', v_TranslatedLogMessage, v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemoveUserPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemoveUserPermission`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UserId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, users_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_UserId
    FROM security_users_permissions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_users_permissions (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            users_id, permissions_id, partitions_id, setting)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, users_id, permissions_id, partitions_id, setting
        FROM security_users_permissions
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_users_permissions SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_QuickTranslateString('User Permission removed.', v_TranslatedLogMessage);

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'user', v_UserId, 'security_users_permissions', v_TableId,
                'record_removed', v_TranslatedLogMessage, v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_security_RemoveUserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_security_RemoveUserRole`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UserId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, users_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_UserId
    FROM security_users_roles
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT security_users_roles (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            roles_id, users_id)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, roles_id, users_id
        FROM security_users_roles
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE security_users_roles SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_QuickTranslateString('Role removed from user.', v_TranslatedLogMessage);

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'user', v_UserId, 'security_users_roles', v_TableId,
                'record_removed', v_TranslatedLogMessage, v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_AddDock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_AddDock`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientTypeUuid CHAR(36) CHARSET utf8,
    IN i_DockName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_PicturePath VARCHAR(500) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;

    DECLARE v_SecurityClientTypeId BIGINT;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE _table_uuid = f_UuidToBin(i_SecurityClientTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM system_docks
        WHERE dock_name = i_DockName AND _system_is_valid = 1 AND _system_is_deleted = 0
            AND security_client_types_id =  v_SecurityClientTypeId);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('system_docks', v_TableId);

        INSERT system_docks (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, dock_name, display_name,
            description, weighting, picture_path, is_active, security_client_types_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_DockName, i_DisplayName,
            i_Description, i_Weighting, i_PicturePath, i_IsActive, v_SecurityClientTypeId);

        CALL p_system_UnlockTable('system_docks');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'system', 0, 'system_docks', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_AddDockItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_AddDockItem`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_DockUuid CHAR(36) CHARSET utf8,
    IN i_SystemDockTypeUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientTypeUuid CHAR(36) CHARSET utf8,
    IN i_ItemName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_PicturePath VARCHAR(500) CHARSET utf8,
    IN i_ItemAction VARCHAR(500) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_DockId BIGINT;
    DECLARE v_SystemDockTypeId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE _table_uuid = f_UuidToBin(i_SecurityClientTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockId
    FROM system_docks
    WHERE _table_uuid = f_UuidToBin(i_DockUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_SystemDockTypeId
    FROM configuration_lookup_system_dock_types
    WHERE _table_uuid = f_UuidToBin(i_SystemDockTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM system_dock_items
        WHERE item_name = i_ItemName AND _system_is_valid = 1 AND _system_is_deleted = 0
            AND system_dock_types_id = v_SystemDockTypeId AND docks_id = v_DockId
            AND security_client_types_id = v_SecurityClientTypeId);

    IF v_RowCount = 0 AND COALESCE(v_DockId, 0) > 0 AND COALESCE(v_SystemDockTypeId, 0) > 0
        AND COALESCE(v_SecurityClientTypeId, 0) > 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('system_dock_items', v_TableId);

        INSERT system_dock_items (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, item_name, display_name,
            description, weighting, picture_path, is_active, item_action, system_dock_types_id,
            docks_id, security_client_types_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_ItemName, i_DisplayName,
            i_Description, i_Weighting, i_PicturePath, i_IsActive, i_ItemAction,
            v_SystemDockTypeId, v_DockId, v_SecurityClientTypeId);

        CALL p_system_UnlockTable('system_dock_items');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'system', 0, 'system_dock_items', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_AddDockSubitem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_AddDockSubitem`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_DockItemUuid CHAR(36) CHARSET utf8,
    IN i_SystemDockTypeUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientTypeUuid CHAR(36) CHARSET utf8,
    IN i_SubitemName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_PicturePath VARCHAR(500) CHARSET utf8,
    IN i_SubitemAction VARCHAR(500) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_DockItemId BIGINT;
    DECLARE v_SystemDockTypeId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE _table_uuid = f_UuidToBin(i_SecurityClientTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockItemId
    FROM system_dock_items
    WHERE _table_uuid = f_UuidToBin(i_DockItemUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_SystemDockTypeId
    FROM configuration_lookup_system_dock_types
    WHERE _table_uuid = f_UuidToBin(i_SystemDockTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM system_dock_subitems
        WHERE subitem_name = i_SubitemName AND _system_is_valid = 1 AND _system_is_deleted = 0
            AND system_dock_types_id = v_SystemDockTypeId AND dock_items_id = v_DockItemId
            AND security_client_types_id = v_SecurityClientTypeId);

    IF v_RowCount = 0 AND COALESCE(v_DockItemId, 0) > 0 AND COALESCE(v_SystemDockTypeId, 0) > 0
        AND COALESCE(v_SecurityClientTypeId, 0) > 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('system_dock_subitems', v_TableId);

        INSERT system_dock_subitems (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, subitem_name, display_name,
            description, weighting, picture_path, is_active, subitem_action, system_dock_types_id,
            dock_items_id, security_client_types_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_SubitemName, i_DisplayName,
            i_Description, i_Weighting, i_PicturePath, i_IsActive, i_SubitemAction,
            v_SystemDockTypeId, v_DockItemId, v_SecurityClientTypeId);

        CALL p_system_UnlockTable('system_dock_subitems');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'system', 0, 'system_dock_subitems', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_AddDockTab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_AddDockTab`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientTypeUuid CHAR(36) CHARSET utf8,
    IN i_SystemDockTypeUuid CHAR(36) CHARSET utf8,
    IN i_DockItemUuid CHAR(36) CHARSET utf8,
    IN i_DockSubItemUuid CHAR(36) CHARSET utf8,
    IN i_TabName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_PicturePath VARCHAR(500) CHARSET utf8,
    IN i_TabAction VARCHAR(500) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_DockItemId BIGINT;
    DECLARE v_DockSubitemId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;
    DECLARE v_SystemDockTypeId BIGINT;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE _table_uuid = f_UuidToBin(i_SecurityClientTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockItemId
    FROM system_dock_items
    WHERE _table_uuid = f_UuidToBin(i_DockItemUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockSubitemId
    FROM system_dock_subitems
    WHERE _table_uuid = f_UuidToBin(i_DockSubitemUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_SystemDockTypeId
    FROM configuration_lookup_system_dock_types
    WHERE _table_uuid = f_UuidToBin(i_SystemDockTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM system_dock_tabs
        WHERE tab_name = i_TabName AND _system_is_valid = 1 AND _system_is_deleted = 0
            AND COALESCE(dock_items_id, 0) = COALESCE(v_DockItemId, 0)
            AND COALESCE(dock_subitems_id, 0) = COALESCE(v_DockSubitemId, 0)
            AND system_dock_types_id = v_SystemDockTypeId
            AND security_client_types_id = v_SecurityClientTypeId);

    IF v_RowCount = 0 AND (COALESCE(v_DockItemId, 0) > 0 OR COALESCE(v_DockSubitemId, 0) > 0)
        AND COALESCE(v_SecurityClientTypeId, 0) > 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('system_dock_tabss', v_TableId);

        INSERT system_dock_tabs (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, tab_name, display_name,
            description, weighting, picture_path, is_active, tab_action, dock_items_id,
            dock_subitems_id, security_client_types_id, system_dock_types_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_TabName, i_DisplayName,
            i_Description, i_Weighting, i_PicturePath, i_IsActive, i_TabAction,
            v_DockItemId, v_DockSubitemId, v_SecurityClientTypeId,
            v_SystemDockTypeId);

        CALL p_system_UnlockTable('system_dock_tabs');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'system', 0, 'system_dock_tabs', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_AddFieldTranslation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_AddFieldTranslation`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    IN i_FieldName VARCHAR(255) CHARSET utf8,
    IN i_Translation TEXT CHARSET utf8,
    IN i_GlobalLanguageUuid CHAR(36) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_ForeignTableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_GlobalLanguageId BIGINT;
    
    IF ISNULL(i_TableName) = FALSE && i_TableName != '' THEN
        SET v_ForeignTableId := (SELECT _table_id FROM system_tables
            WHERE table_name = i_TableName AND _system_is_valid = 1);
    END IF;

    IF ISNULL(i_GlobalLanguageUuid) = FALSE && i_GlobalLanguageUuid != '' THEN
        SET v_GlobalLanguageId := (SELECT _table_id FROM configuration_lookup_global_languages
            WHERE _table_uuid = f_UuidToBin(i_GlobalLanguageUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);
    END IF;

    SET v_RowCount := (SELECT COUNT(*) FROM system_field_translations
        WHERE field_name = i_FieldName AND tables_id = v_ForeignTableId AND global_languages_id = v_GlobalLanguageId
            AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 AND v_GlobalLanguageId != 0 AND NOT ISNULL(v_GlobalLanguageId) AND v_ForeignTableId != 0 AND NOT ISNULL(v_ForeignTableId) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('system_field_translations', v_TableId);

        INSERT system_field_translations (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, tables_id, is_active,
            field_name, translation, global_languages_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_ForeignTableId, i_IsActive,
            i_FieldName, i_Translation, v_GlobalLanguageId);

        CALL p_system_UnlockTable('system_field_translations');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'system', 0, 'system_field_translations', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_AddMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_AddMessage`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_MessageName VARCHAR(100) CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_ModuleUuid CHAR(36) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_ModuleId BIGINT;
    DECLARE v_TransactionId BIGINT;

    SET v_ModuleId := (SELECT _table_id FROM system_modules
        WHERE _table_uuid = f_UuidToBin(i_ModuleUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_ModuleId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*) FROM system_messages
            WHERE modules_id = v_ModuleId AND magic = i_Magic AND _system_is_valid = 1 AND _system_is_deleted = 0);
    ELSE
        SET v_RowCount := 1;
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('system_messages', v_TableId);

        INSERT system_messages (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, message_name, modules_id,
            magic, description, is_active)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_MessageName, 
            v_ModuleId, i_Magic, i_Description, i_IsActive);

        CALL p_system_UnlockTable('system_messages');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'system', 0, 'system_messages', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_AddModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_AddModule`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_ModuleName VARCHAR(100) CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := (SELECT COUNT(*) FROM system_modules WHERE magic = i_Magic AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('system_modules', v_TableId);

        INSERT system_modules (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, module_name, magic,
            description, is_active)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_ModuleName,
            i_Magic, i_Description, i_IsActive);

        CALL p_system_UnlockTable('system_modules');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'system', 0, 'system_modules', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_AddPartition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_AddPartition`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_PartitionName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := (SELECT COUNT(*) FROM system_partitions
        WHERE partition_name = i_PartitionName AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('system_partitions', v_TableId);

        INSERT system_partitions (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, partition_name, is_active,
            description)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_PartitionName, i_IsActive,
            i_Description);

        CALL p_system_UnlockTable('system_partitions');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'system', 0, 'system_partitions', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_AddStringTranslation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_AddStringTranslation`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_Source TEXT CHARSET utf8,
    IN i_Translation TEXT CHARSET utf8,
    IN i_GlobalLanguageUuid CHAR(36) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_GlobalLanguageId BIGINT;
    
    IF ISNULL(i_GlobalLanguageUuid) = FALSE && i_GlobalLanguageUuid != '' THEN
        SET v_GlobalLanguageId := (SELECT _table_id FROM configuration_lookup_global_languages
            WHERE _table_uuid = f_UuidToBin(i_GlobalLanguageUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);
    END IF;

    SET v_RowCount := (SELECT COUNT(*) FROM system_string_translations
        WHERE source = i_Source AND global_languages_id = v_GlobalLanguageId AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 AND v_GlobalLanguageId != 0 AND NOT ISNULL(v_GlobalLanguageId) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('system_string_translations', v_TableId);

        INSERT system_string_translations (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, is_active,
            source, translation, global_languages_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_IsActive,
            i_Source, i_Translation, v_GlobalLanguageId);

        CALL p_system_UnlockTable('system_string_translations');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'system', 0, 'system_string_translations', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_AddTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_AddTable`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    OUT o_TableId BIGINT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_MaxId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;

    SET o_TableId := 0;
    SET v_TableUuid := '';

    SET v_RowCount := (SELECT COUNT(*) FROM system_tables
        WHERE table_name = i_TableName AND _system_is_valid = 1);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_RowCount := (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = i_TableName);

        IF v_RowCount > 0 THEN
            SET v_MaxId := (SELECT AUTO_INCREMENT - 1 FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = i_TableName);

            IF ISNULL(v_MaxId) THEN
                SET v_MaxId := 0;
            END IF;

            SET v_TableUuid := UUID();

            INSERT system_tables (_system_is_valid, table_name, current_id, mutex, _table_uuid)
            VALUES (1, i_TableName, v_MaxId, 0, v_TableUuid);

            SET o_TableId := LAST_INSERT_ID();

            UPDATE system_tables SET _table_id = _system_auto_id WHERE _system_auto_id = o_TableId;

            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_tables', o_TableId,
                'record_added', '', v_TransactionId);
        END IF;
    END IF;

    SELECT o_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_FetchDock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_FetchDock`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(d._table_uuid) AS '_table_uuid',
        f_BinToUuid(c._table_uuid) AS 'security_client_type_uuid',
        c.name_label AS 'security_client_type_name_label',
        c.display_label AS 'security_client_type_display_label',
        d.dock_name AS 'dock_name',
        d.display_name AS 'display_name',
        d.description AS 'description',
        d.weighting AS 'weighting',
        d.picture_path AS 'picture_path',
        f_BitToOutput(d.is_active) AS 'is_active'
    FROM system_docks AS d
        LEFT OUTER JOIN configuration_lookup_security_client_types AS c
            ON c._table_id = d.security_client_types_id AND c._system_is_valid = 1
            AND c._system_is_deleted = 0 AND c.is_active = 1
    WHERE d._table_uuid = v_TableUuid AND d._system_is_valid = 1 AND d._system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_FetchDockItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_FetchDockItem`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(di._table_uuid) AS '_table_uuid',
        f_BinToUuid(d._table_uuid) AS 'dock_uuid',
        d.dock_name AS 'dock_name',
        d.display_name AS 'dock_display_name',
        f_BinToUuid(dt._table_uuid) AS 'system_dock_type_uuid',
        dt.name_label AS 'system_dock_type_name_label',
        dt.display_label AS 'system_dock_type_display_label',
        f_BinToUuid(c._table_uuid) AS 'security_client_type_uuid',
        c.name_label AS 'security_client_type_name_label',
        c.display_label AS 'security_client_type_display_label',
        di.item_name AS 'item_name',
        di.display_name AS 'display_name',
        di.description AS 'description',
        di.weighting AS 'weighting',
        di.picture_path AS 'picture_path',
        di.item_action AS 'item_action',
        f_BitToOutput(di.is_active) AS 'is_active'
    FROM system_dock_items AS di
        LEFT OUTER JOIN system_docks AS d ON d._table_id = di.docks_id
            AND d._system_is_valid = 1 AND d._system_is_deleted = 0
        LEFT OUTER JOIN configuration_lookup_security_client_types AS c
            ON c._table_id = d.security_client_types_id AND c._system_is_valid = 1
            AND c._system_is_deleted = 0 AND c.is_active = 1
        LEFT OUTER JOIN configuration_lookup_system_dock_types AS dt
            ON dt._table_id = di.system_dock_types_id AND dt._system_is_valid = 1
            AND dt._system_is_deleted = 0 AND dt.is_active = 1
    WHERE di._table_uuid = v_TableUuid AND di._system_is_valid = 1 AND di._system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_FetchDockSubitem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_FetchDockSubitem`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(ds._table_uuid) AS '_table_uuid',
        f_BinToUuid(di._table_uuid) AS 'dock_item_uuid',
        di.item_name AS 'dock_item_name',
        di.display_name AS 'dock_item_display_name',
        f_BinToUuid(dt._table_uuid) AS 'system_dock_type_uuid',
        dt.name_label AS 'system_dock_type_name_label',
        dt.display_label AS 'system_dock_type_display_label',
        f_BinToUuid(c._table_uuid) AS 'security_client_type_uuid',
        c.name_label AS 'security_client_type_name_label',
        c.display_label AS 'security_client_type_display_label',
        ds.subitem_name AS 'subitem_name',
        ds.display_name AS 'display_name',
        ds.description AS 'description',
        ds.weighting AS 'weighting',
        ds.picture_path AS 'picture_path',
        ds.subitem_action AS 'subitem_action',
        f_BitToOutput(ds.is_active) AS 'is_active'
    FROM system_dock_subitems AS ds
        LEFT OUTER JOIN system_dock_items AS di ON di._table_id = ds.dock_items_id
            AND di._system_is_valid = 1 AND di._system_is_deleted = 0
        LEFT OUTER JOIN configuration_lookup_security_client_types AS c
            ON c._table_id = ds.security_client_types_id AND c._system_is_valid = 1
            AND c._system_is_deleted = 0 AND c.is_active = 1
        LEFT OUTER JOIN configuration_lookup_system_dock_types AS dt
            ON dt._table_id = di.system_dock_types_id AND dt._system_is_valid = 1
            AND dt._system_is_deleted = 0 AND dt.is_active = 1
    WHERE ds._table_uuid = v_TableUuid AND ds._system_is_valid = 1 AND ds._system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_FetchDockTab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_FetchDockTab`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(t._table_uuid) AS '_table_uuid',
        f_BinToUuid(di._table_uuid) AS 'dock_item_uuid',
        di.item_name AS 'dock_item_name',
        di.display_name AS 'dock_item_display_name',
        f_BinToUuid(ds._table_uuid) AS 'dock_subitem_uuid',
        ds.subitem_name AS 'dock_subitem_name',
        di.display_name AS 'dock_subitem_display_name',
        f_BinToUuid(dt._table_uuid) AS 'system_dock_type_uuid',
        dt.name_label AS 'system_dock_type_name_label',
        dt.display_label AS 'system_dock_type_display_label',
        f_BinToUuid(c._table_uuid) AS 'security_client_type_uuid',
        c.name_label AS 'security_client_type_name_label',
        c.display_label AS 'security_client_type_display_label',
        t.tab_name AS 'tab_name',
        t.display_name AS 'display_name',
        t.description AS 'description',
        t.weighting AS 'weighting',
        t.picture_path AS 'picture_path',
        t.tab_action AS 'tab_action',
        f_BitToOutput(t.is_active) AS 'is_active'
    FROM system_dock_tabs AS t
        LEFT OUTER JOIN system_dock_items AS di ON di._table_id = t.dock_items_id
            AND di._system_is_valid = 1 AND di._system_is_deleted = 0
        LEFT OUTER JOIN system_dock_subitems AS ds ON ds._table_id = t.dock_subitems_id
            AND ds._system_is_valid = 1 AND ds._system_is_deleted = 0
        LEFT OUTER JOIN configuration_lookup_security_client_types AS c
            ON c._table_id = t.security_client_types_id AND c._system_is_valid = 1
            AND c._system_is_deleted = 0 AND c.is_active = 1
        LEFT OUTER JOIN configuration_lookup_system_dock_types AS dt
            ON dt._table_id = t.system_dock_types_id AND dt._system_is_valid = 1
            AND dt._system_is_deleted = 0 AND dt.is_active = 1
    WHERE t._table_uuid = v_TableUuid AND t._system_is_valid = 1 AND t._system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_FetchLogTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_FetchLogTransaction`(IN i_TransactionId BIGINT)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    SELECT f_BinToUuid(lt._table_uuid) AS _table_uuid,
        lt.log_timestamp AS log_timestamp,
        f_BinToUuid(lt.session_uuid) AS session_uuid,
        u.first_name+' '+u.last_name AS user,
        m.module_name AS module,
        t.table_name AS table_name,
        lt.foreign_tables_id AS foreign_tables_id,
        l.name_label AS log_type,
        lt.human_readable
    FROM system_log_transactions AS lt
        LEFT JOIN user_users AS u ON u._table_id = lt.users_id
            AND u._system_is_valid = 1 AND u._system_is_deleted = 0
        LEFT JOIN system_modules AS m ON m._table_id = lt.modules_id
            AND m._system_is_valid = 1 AND m._system_is_deleted = 0
        LEFT JOIN configuration_lookup_system_log_types AS l ON l._table_id = lt.system_log_types_id
            AND l._system_is_valid = 1 AND l._system_is_deleted = 0 AND l.is_active = 1
        LEFT JOIN system_tables AS t ON t._table_id = lt.tables_id AND t._system_is_valid = 1
    WHERE lt._system_auto_id = i_TransactionId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_FetchMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_FetchMessage`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(me._table_uuid) AS '_table_uuid',
        f_BinToUuid(mo._table_uuid) AS 'module_uuid',
        mo.module_name AS 'module_name',
        me.message_name AS 'message_name',
        me.description AS 'description',
        me.magic AS 'magic',
        f_BitToOutput(me.is_active) AS 'is_active'
    FROM system_messages AS me
        LEFT OUTER JOIN system_modules AS mo
            ON mo._table_id = me.modules_id AND mo._system_is_valid = 1
            AND mo._system_is_deleted = 0 AND mo.is_active = 1
    WHERE me._table_uuid = v_TableUuid AND me._system_is_valid = 1 AND me._system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_FetchModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_FetchModule`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        module_name, magic, description,
        f_BitToOutput(is_active) AS 'is_active'
    FROM system_modules
    WHERE _table_uuid = v_TableUuid AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_FetchPartition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_FetchPartition`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        partition_name, description,
        f_BitToOutput(is_active) AS 'is_active'
    FROM system_partitions
    WHERE _table_uuid = v_TableUuid AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_FetchTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_FetchTable`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        table_name, current_id, mutex
    FROM system_tables
    WHERE _table_uuid = v_TableUuid AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ListDock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ListDock`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM system_docks
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(d._table_uuid) AS '_table_uuid',
        c.name_label AS 'security_client_type_name_label',
        c.display_label AS 'security_client_type_display_label',
        f_BinToUuid(c._table_uuid) AS 'security_client_type_uuid',
        d.dock_name AS 'dock_name',
        d.display_name AS 'display_name',
        f_BitToOutput(d.is_active) AS 'is_active',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM system_docks AS d
        LEFT OUTER JOIN configuration_lookup_security_client_types AS c
            ON c._table_id = d.security_client_types_id
            AND c._system_is_valid = 1 AND c._system_is_deleted = 0
            AND c.is_active = 1
    WHERE d._system_is_valid = 1 AND d._system_is_deleted = 0
    ORDER BY COALESCE(d.weighting, 0), d.dock_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ListDockItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ListDockItem`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM system_dock_items
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(di._table_uuid) AS '_table_uuid',
        c.name_label AS 'security_client_type_name_label',
        c.display_label AS 'security_client_type_display_label',
        f_BinToUuid(c._table_uuid) AS 'security_client_type_uuid',
        dt.name_label AS 'system_dock_type_name_label',
        dt.display_label AS 'system_dock_type_display_label',
        f_BinToUuid(dt._table_uuid) AS 'system_dock_type_uuid',
        d.dock_name AS 'dock_name',
        d.display_name AS 'dock_display_name',
        f_BinToUuid(d._table_uuid) AS 'dock_uuid',
        di.item_name AS 'item_name',
        di.display_name AS 'display_name',
        f_BitToOutput(di.is_active) AS 'is_active',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM system_dock_items AS di
        LEFT OUTER JOIN configuration_lookup_security_client_types AS c
            ON c._table_id = di.security_client_types_id
            AND c._system_is_valid = 1 AND c._system_is_deleted = 0
            AND c.is_active = 1
        LEFT OUTER JOIN configuration_lookup_system_dock_types AS dt
            ON dt._table_id = di.system_dock_types_id
            AND dt._system_is_valid = 1 AND dt._system_is_deleted = 0
            AND dt.is_active = 1
        LEFT OUTER JOIN system_docks AS d
            ON d._table_id = di.docks_id
            AND d._system_is_valid = 1 AND d._system_is_deleted = 0
            AND d.is_active = 1
    WHERE di._system_is_valid = 1 AND di._system_is_deleted = 0
    ORDER BY COALESCE(di.weighting, 0), di.item_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ListDockSubitem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ListDockSubitem`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM system_dock_subitems
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(ds._table_uuid) AS '_table_uuid',
        c.name_label AS 'security_client_type_name_label',
        c.display_label AS 'security_client_type_display_label',
        f_BinToUuid(c._table_uuid) AS 'security_client_type_uuid',
        dt.name_label AS 'system_dock_type_name_label',
        dt.display_label AS 'system_dock_type_display_label',
        f_BinToUuid(dt._table_uuid) AS 'system_dock_type_uuid',
        di.item_name AS 'dock_item_name',
        di.display_name AS 'dock_item_display_name',
        f_BinToUuid(di._table_uuid) AS 'dock_item_uuid',
        ds.subitem_name AS 'subitem_name',
        ds.display_name AS 'display_name',
        f_BitToOutput(ds.is_active) AS 'is_active',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM system_dock_subitems AS ds
        LEFT OUTER JOIN configuration_lookup_security_client_types AS c
            ON c._table_id = ds.security_client_types_id
            AND c._system_is_valid = 1 AND c._system_is_deleted = 0
            AND c.is_active = 1
        LEFT OUTER JOIN configuration_lookup_system_dock_types AS dt
            ON dt._table_id = ds.system_dock_types_id
            AND dt._system_is_valid = 1 AND dt._system_is_deleted = 0
            AND dt.is_active = 1
        LEFT OUTER JOIN system_dock_items AS di
            ON di._table_id = ds.dock_items_id
            AND di._system_is_valid = 1 AND di._system_is_deleted = 0
            AND di.is_active = 1
    WHERE ds._system_is_valid = 1 AND ds._system_is_deleted = 0
    ORDER BY COALESCE(ds.weighting, 0), ds.subitem_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ListDockTab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ListDockTab`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM system_dock_tabs
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(t._table_uuid) AS '_table_uuid',
        c.name_label AS 'security_client_type_name_label',
        c.display_label AS 'security_client_type_display_label',
        f_BinToUuid(c._table_uuid) AS 'security_client_type_uuid',
        dt.name_label AS 'system_dock_type_name_label',
        dt.display_label AS 'system_dock_type_display_label',
        f_BinToUuid(dt._table_uuid) AS 'system_dock_type_uuid',
        di.item_name AS 'dock_item_name',
        di.display_name AS 'dock_item_display_name',
        f_BinToUuid(di._table_uuid) AS 'dock_item_uuid',
        ds.subitem_name AS 'dock_subitem_name',
        ds.display_name AS 'dock_subitem_display_name',
        f_BinToUuid(ds._table_uuid) AS 'dock_subitem_uuid',
        t.tab_name AS 'tab_name',
        t.display_name AS 'display_name',
        f_BitToOutput(ds.is_active) AS 'is_active',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM system_dock_tabs AS t
        LEFT OUTER JOIN configuration_lookup_security_client_types AS c
            ON c._table_id = t.security_client_types_id
            AND c._system_is_valid = 1 AND c._system_is_deleted = 0
            AND c.is_active = 1
        LEFT OUTER JOIN configuration_lookup_system_dock_types AS dt
            ON dt._table_id = t.system_dock_types_id
            AND dt._system_is_valid = 1 AND dt._system_is_deleted = 0
            AND dt.is_active = 1
        LEFT OUTER JOIN system_dock_items AS di
            ON di._table_id = t.dock_items_id
            AND di._system_is_valid = 1 AND di._system_is_deleted = 0
            AND di.is_active = 1
        LEFT OUTER JOIN system_dock_subitems AS ds
            ON ds._table_id = t.dock_subitems_id
            AND ds._system_is_valid = 1 AND ds._system_is_deleted = 0
            AND ds.is_active = 1
    WHERE t._system_is_valid = 1 AND t._system_is_deleted = 0
    ORDER BY COALESCE(t.weighting, 0), t.tab_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ListMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ListMessage`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM system_messages
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(me._table_uuid) AS '_table_uuid',
        mo.module_name AS 'module_name',
        f_BinToUuid(mo._table_uuid) AS 'module_uuid',
        me.message_name AS 'message_name',
        f_BitToOutput(me.is_active) AS 'is_active',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM system_messages AS me
        LEFT OUTER JOIN system_modules AS mo
            ON mo._table_id = me.modules_id
            AND mo._system_is_valid = 1 AND mo._system_is_deleted = 0
            AND mo.is_active = 1
    WHERE me._system_is_valid = 1 AND me._system_is_deleted = 0
    ORDER BY me.message_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ListModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ListModule`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM system_modules
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        module_name AS 'module_name',
        f_BitToOutput(is_active) AS 'is_active',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM system_modules
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
    ORDER BY module_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ListPartition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ListPartition`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM system_partitions
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        partition_name,
        f_BitToOutput(is_active) AS 'is_active',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM system_partitions
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
    ORDER BY partition_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ListTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ListTable`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM system_tables
    WHERE _system_is_valid = 1;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        table_name,
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM system_tables
    WHERE _system_is_valid = 1
    ORDER BY table_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LockTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LockTable`(IN i_TableName VARCHAR(255) CHARSET utf8,
    OUT o_NextTableId BIGINT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowsAffected BIGINT;
    DECLARE v_SleepStatus TINYINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_Loops BIGINT;
    DECLARE v_LoopLimit BIGINT;

    SET v_RowsAffected := 0;
    SET v_TableId := -1;
    SET v_Loops := 0;
    SET v_LoopLimit = 10;

    SELECT _system_auto_id
    INTO v_TableId
    FROM system_tables WHERE table_name = i_TableName AND _system_is_valid = 1
    LIMIT 1;

    IF COALESCE(v_TableId, -1) >= 0 THEN
        grab_mutex: WHILE v_RowsAffected = 0 DO
            UPDATE system_tables SET mutex = 1, current_id = current_id + 1
            WHERE _table_id = v_TableId AND mutex = 0;

            SELECT ROW_COUNT() INTO v_RowsAffected;

            IF v_RowsAffected > 0 THEN
                LEAVE grab_mutex;
            END IF;

            IF v_Loops >= v_LoopLimit THEN
                LEAVE grab_mutex;
            ELSE
                SET v_Loops = v_Loops + 1;
            END IF;
            
            SELECT SLEEP(0.25*v_Loops) INTO v_SleepStatus;
        END WHILE grab_mutex;

        IF v_Loops >= v_LoopLimit THEN
            SET o_NextTableId := 0;
        ELSE
            SET o_NextTableId := (SELECT current_id FROM system_tables
                WHERE _table_id = v_TableId AND mutex = 1);
        END IF;
    ELSE
        SET o_NextTableId := 0;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogMessage`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_MessageMagic VARCHAR(50) CHARSET utf8,
    IN i_LogTimestamp TIMESTAMP,
    IN i_UserUuid CHAR(36) CHARSET utf8,
    IN i_ExecutionTime INT,
    IN i_Request TEXT CHARSET utf8,
    IN i_Response TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_UserId BIGINT;
    DECLARE v_LogTimeStamp TIMESTAMP;
    DECLARE v_ExecutionTime INT;
    DECLARE v_MessageId BIGINT;

    IF NOT (ISNULL(i_MessageMagic) OR i_MessageMagic = '') THEN
        SET v_MessageId := (SELECT _table_id FROM system_messages
            WHERE magic = i_MessageMagic AND _system_is_valid = 1 AND _system_is_deleted = 0);
    ELSE
        SET v_MessageId := 0;
    END IF;

    IF i_UserUuid != '' OR ISNULL(i_UserUuid) = FALSE THEN
        SET v_UserId = (SELECT _table_id FROM user_users
            WHERE _table_uuid = f_UuidToBin(i_UserUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);
    END IF;

    IF ISNULL(i_ExecutionTime) THEN
        SET v_ExecutionTime := 0;
    ELSE
        SET v_ExecutionTime := i_ExecutionTime;
    END IF;

    IF ISNULL(i_LogTimestamp) THEN
        SET v_LogTimestamp := UTC_TIMESTAMP();
    ELSE
        SET v_LogTimestamp := i_LogTimestamp;
    END IF;

    INSERT system_log_messages (session_uuid, transaction_uuid, messages_id,
        log_timestamp, users_id, execution_time, request,
        response)
    SELECT f_UuidToBin(i_SessionUuid), f_UuidToBin(i_TransactionUuid),
        v_MessageId, v_LogTimestamp, v_UserId, v_ExecutionTime,
        i_Request, i_Response;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogQuery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogQuery`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_SqlQuery TEXT CHARSET utf8,
    IN i_LogTimestamp TIMESTAMP,
    IN i_UserUuid CHAR(36) CHARSET utf8,
    IN i_ExecutionTime INT,
    IN i_IsCacheable BIT(1),
    IN i_ResultFromCache BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_UserId BIGINT;
    DECLARE v_LogTimeStamp TIMESTAMP;
    DECLARE v_ExecutionTime INT;

    IF NOT (ISNULL(i_SqlQuery) OR i_SqlQuery = '') THEN
        IF i_UserUuid != '' OR ISNULL(i_UserUuid) = FALSE THEN
            SET v_UserId := (SELECT _table_id FROM user_users
                WHERE _table_uuid = f_UuidToBin(i_UserUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);
        END IF;

        IF ISNULL(i_ExecutionTime) THEN
            SET v_ExecutionTime := 0;
        ELSE
            SET v_ExecutionTime := i_ExecutionTime;
        END IF;

        IF ISNULL(i_LogTimestamp) THEN
            SET v_LogTimestamp := UTC_TIMESTAMP();
        ELSE
            SET v_LogTimestamp := i_LogTimestamp;
        END IF;

        INSERT system_log_queries (session_uuid, transaction_uuid, sql_query,
            log_timestamp, users_id, execution_time, is_cacheable,
            result_from_cache)
        SELECT f_UuidToBin(i_SessionUuid), f_UuidToBin(i_TransactionUuid),
            i_SqlQuery, v_LogTimestamp, v_UserId, v_ExecutionTime,
            i_IsCacheable, i_ResultFromCache;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogTransaction`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_ModuleName VARCHAR(50) CHARSET utf8,
    IN i_ForeignModuleId BIGINT,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    IN i_ForeignTableId BIGINT,
    IN i_LogType VARCHAR(100) CHARSET utf8,
    IN i_HumanReadable TEXT CHARSET utf8,
    OUT o_LogTransactionId BIGINT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_ModuleId BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_UserId BIGINT;
    DECLARE v_SystemLogTypeId BIGINT;
    DECLARE v_HumanReadable TEXT CHARSET utf8;

    SET o_LogTransactionId := 0;

    IF LEFT(i_HumanReadable, 1) = '\n' THEN
        SET v_HumanReadable := RIGHT(i_HumanReadable, LENGTH(i_HumanReadable)-1);
    ELSE
        SET v_HumanReadable := i_HumanReadable;
    END IF;

    SET v_HumanReadable := LTRIM(RTRIM(v_HumanReadable));

    IF ISNULL(i_ModuleName) = FALSE && i_ModuleName != '' THEN
        SET v_ModuleId := (SELECT _table_id FROM system_modules
            WHERE magic = i_ModuleName AND _system_is_valid = 1 AND _system_is_deleted = 0);
    END IF;

    IF ISNULL(i_TableName) = FALSE && i_TableName != '' THEN
        SET v_TableId := (SELECT _table_id FROM system_tables
            WHERE table_name = i_TableName AND _system_is_valid = 1);
    END IF;
    
    IF ISNULL(i_SessionUuid) = FALSE && i_SessionUuid != '' THEN
        SET v_UserId := (SELECT users_id FROM security_sessions WHERE _table_uuid = i_SessionUuid);
    END IF;

    IF ISNULL(i_LogType) = FALSE && i_LogType != '' THEN
        SET v_SystemLogTypeId := (SELECT _table_id FROM configuration_lookup_system_log_types WHERE magic = i_LogType AND _system_is_valid = 1);
    END IF;

    INSERT system_log_transactions (_table_uuid, log_timestamp, modules_id,
        tables_id, foreign_tables_id, human_readable, users_id, session_uuid,
        system_log_types_id, foreign_modules_id)
    SELECT f_UuidToBin(i_TransactionUuid), UTC_TIMESTAMP(), v_ModuleId,
        v_TableId, i_ForeignTableId, v_HumanReadable, v_UserId,
        f_UuidToBin(i_SessionUuid), v_SystemLogTypeId, i_ForeignModuleId;

    SET o_LogTransactionId := LAST_INSERT_ID();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogTransactionDetailBit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogTransactionDetailBit`(IN i_TransactionId BIGINT,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    IN i_ForeignTableId BIGINT,
    IN i_FieldName VARCHAR(255) CHARSET utf8,
    IN i_old_Bit BIT(1),
    IN i_Bit BIT(1),
    IN i_FieldLabel TEXT CHARSET utf8,
    INOUT io_HumanReadable TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT CHARSET utf8;
    DECLARE v_TranslatedTrue TEXT CHARSET utf8;
    DECLARE v_TranslatedFalse TEXT CHARSET utf8;

    IF ISNULL(io_HumanReadable) THEN
        SET io_HumanReadable := '';
    END IF;

    IF COALESCE(i_old_Bit, 0) != COALESCE(i_Bit, 0) THEN
        SET v_TranslatedLogMessage := '';

        CALL p_system_QuickTranslateString(i_FieldLabel, v_TranslatedLogMessage);
        CALL p_system_QuickTranslateString('True', v_TranslatedTrue);
        CALL p_system_QuickTranslateString('False', v_TranslatedFalse);

        SET io_HumanReadable := CONCAT(io_HumanReadable, '\n', v_TranslatedLogMessage,
            ': ', CASE WHEN ISNULL(i_old_Bit) THEN v_TranslatedFalse WHEN i_old_Bit = 1 THEN v_TranslatedTrue ELSE v_TranslatedFalse END,
            ' => ', CASE WHEN ISNULL(i_Bit) THEN v_TranslatedFalse WHEN i_Bit = 1 THEN v_TranslatedTrue ELSE v_TranslatedFalse END);

        IF ISNULL(i_TableName) = FALSE && i_TableName != '' THEN
            SET v_TableId := (SELECT _table_id FROM system_tables
                WHERE table_name = i_TableName AND _system_is_valid = 1);
        END IF;

        INSERT system_log_transaction_details (transaction_id, tables_id,
            foreign_tables_id, field_name, new_bit, old_bit)
        VALUES (i_TransactionId, v_TableId, i_ForeignTableId, i_FieldName,
            i_Bit, i_old_Bit);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogTransactionDetailDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogTransactionDetailDate`(IN i_TransactionId BIGINT,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    IN i_ForeignTableId BIGINT,
    IN i_FieldName VARCHAR(255) CHARSET utf8,
    IN i_old_DateTime DOUBLE,
    IN i_Datetime DOUBLE,
    IN i_FieldLabel TEXT CHARSET utf8,
    INOUT io_HumanReadable TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT CHARSET utf8;

    IF ISNULL(io_HumanReadable) THEN
        SET io_HumanReadable := '';
    END IF;

    IF COALESCE(i_old_Datetime, CAST('01 Jan 2010' AS DATETIME)) != COALESCE(i_Datetime, CAST('01 Jan 2010' AS DATETIME)) THEN

        SET v_TranslatedLogMessage := '';

        CALL p_system_QuickTranslateString(i_FieldLabel, v_TranslatedLogMessage);

        SET io_HumanReadable := CONCAT(io_HumanReadable, '\n', v_TranslatedLogMessage,
            ': ', f_DateToString(i_old_DateTime), 
            ' => ', f_DateToString(i_Datetime));

        IF ISNULL(i_TableName) = FALSE && i_TableName != '' THEN
            SET v_TableId := (SELECT _table_id FROM system_tables
                WHERE table_name = i_TableName AND _system_is_valid = 1);
        END IF;

        INSERT system_log_transaction_details (transaction_id, tables_id,
            foreign_tables_id, field_name, new_datetime, old_datetime)
        VALUES (i_TransactionId, v_TableId, i_ForeignTableId, i_FieldName,
            i_Datetime, i_old_Datetime);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogTransactionDetailDatetime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogTransactionDetailDatetime`(IN i_TransactionId BIGINT,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    IN i_ForeignTableId BIGINT,
    IN i_FieldName VARCHAR(255) CHARSET utf8,
    IN i_old_Datetime DOUBLE,
    IN i_Datetime DOUBLE,
    IN i_FieldLabel TEXT CHARSET utf8,
    INOUT io_HumanReadable TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT CHARSET utf8;

    IF ISNULL(io_HumanReadable) THEN
        SET io_HumanReadable := '';
    END IF;

    IF COALESCE(i_old_Datetime, CAST('01 Jan 2010' AS DATETIME)) != COALESCE(i_Datetime, CAST('01 Jan 2010' AS DATETIME)) THEN

        SET v_TranslatedLogMessage := '';

        CALL p_system_QuickTranslateString(i_FieldLabel, v_TranslatedLogMessage);

        SET io_HumanReadable := CONCAT(io_HumanReadable, '\n', v_TranslatedLogMessage,
            ': ', f_DatetimeToString(i_old_Datetime),
            ' => ', f_DatetimeToString(i_Datetime));

        IF ISNULL(i_TableName) = FALSE && i_TableName != '' THEN
            SET v_TableId := (SELECT _table_id FROM system_tables
                WHERE table_name = i_TableName AND _system_is_valid = 1);
        END IF;

        INSERT system_log_transaction_details (transaction_id, tables_id,
            foreign_tables_id, field_name, new_datetime, old_datetime)
        VALUES (i_TransactionId, v_TableId, i_ForeignTableId, i_FieldName,
            i_Datetime, i_old_Datetime);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogTransactionDetailFloat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogTransactionDetailFloat`(IN i_TransactionId BIGINT,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    IN i_ForeignTableId BIGINT,
    IN i_FieldName VARCHAR(255) CHARSET utf8,
    IN i_old_Float DOUBLE,
    IN i_Float DOUBLE,
    IN i_FieldLabel TEXT CHARSET utf8,
    INOUT io_HumanReadable TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT CHARSET utf8;

    IF ISNULL(io_HumanReadable) THEN
        SET io_HumanReadable := '';
    END IF;

    IF COALESCE(i_old_Float, 0.0) != COALESCE(i_Float, 0.0) THEN
        SET v_TranslatedLogMessage := '';

        CALL p_system_QuickTranslateString(i_FieldLabel, v_TranslatedLogMessage);

        SET io_HumanReadable := CONCAT(io_HumanReadable, '\n', v_TranslatedLogMessage,
            ': ', CASE WHEN ISNULL(i_old_Float) THEN '' ELSE CAST(i_old_Float AS CHAR(50)) END,
            ' => ', CASE WHEN ISNULL(i_Float) THEN '' ELSE CAST(i_Float AS CHAR(50)) END);

        IF ISNULL(i_TableName) = FALSE && i_TableName != '' THEN
            SET v_TableId := (SELECT _table_id FROM system_tables
                WHERE table_name = i_TableName AND _system_is_valid = 1);
        END IF;

        INSERT system_log_transaction_details (transaction_id, tables_id,
            foreign_tables_id, field_name, new_float, old_float)
        VALUES (i_TransactionId, v_TableId, i_ForeignTableId, i_FieldName,
            i_Float, i_old_Float);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogTransactionDetailInteger` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogTransactionDetailInteger`(IN i_TransactionId BIGINT,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    IN i_ForeignTableId BIGINT,
    IN i_FieldName VARCHAR(255) CHARSET utf8,
    IN i_old_Integer BIGINT,
    IN i_Integer BIGINT,
    IN i_FieldLabel TEXT CHARSET utf8,
    INOUT io_HumanReadable TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT CHARSET utf8;

    IF ISNULL(io_HumanReadable) THEN
        SET io_HumanReadable := '';
    END IF;

    IF COALESCE(i_old_Integer, 0) != COALESCE(i_Integer, 0) THEN
        SET v_TranslatedLogMessage := '';

        CALL p_system_QuickTranslateString(i_FieldLabel, v_TranslatedLogMessage);

        SET io_HumanReadable := CONCAT(io_HumanReadable, '\n', v_TranslatedLogMessage,
            ': ', CASE WHEN ISNULL(i_old_Integer) THEN '' ELSE CAST(i_old_Integer AS CHAR(50)) END,
            ' => ', CASE WHEN ISNULL(i_integer) THEN '' ELSE CAST(i_Integer AS CHAR(50)) END);

        IF ISNULL(i_TableName) = FALSE && i_TableName != '' THEN
            SET v_TableId := (SELECT _table_id FROM system_tables
                WHERE table_name = i_TableName AND _system_is_valid = 1);
        END IF;

        INSERT system_log_transaction_details (transaction_id, tables_id,
            foreign_tables_id, field_name, new_integer, old_integer)
        VALUES (i_TransactionId, v_TableId, i_ForeignTableId, i_FieldName,
            i_Integer, i_old_Integer);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogTransactionDetailLookup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogTransactionDetailLookup`(IN i_TransactionId BIGINT,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    IN i_ForeignTableId BIGINT,
    IN i_FieldName VARCHAR(255) CHARSET utf8,
    IN i_old_Integer BIGINT,
    IN i_Integer BIGINT,
    IN i_FieldLabel TEXT CHARSET utf8,
    IN i_old_LookupLabel VARCHAR(100) CHARSET utf8,
    IN i_LookupLabel VARCHAR(100) CHARSET utf8,
    INOUT io_HumanReadable TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT CHARSET utf8;

    IF ISNULL(io_HumanReadable) THEN
        SET io_HumanReadable := '';
    END IF;

    IF COALESCE(i_old_Integer, 0) != COALESCE(i_Integer, 0) THEN
        SET v_TranslatedLogMessage := '';

        CALL p_system_QuickTranslateString(i_FieldLabel, v_TranslatedLogMessage);

        SET io_HumanReadable := CONCAT(io_HumanReadable, '\n', v_TranslatedLogMessage,
            ': ', COALESCE(i_old_LookupLabel, ''), ' (',
            CASE WHEN ISNULL(i_old_Integer) THEN '' ELSE CAST(i_old_Integer AS CHAR(50)) END,
            ') => ', COALESCE(i_LookupLabel, ''), ' (',
            CASE WHEN ISNULL(i_integer) THEN '' ELSE CAST(i_Integer AS CHAR(50)) END);

        IF ISNULL(i_TableName) = FALSE && i_TableName != '' THEN
            SET v_TableId := (SELECT _table_id FROM system_tables
                WHERE table_name = i_TableName AND _system_is_valid = 1);
        END IF;

        INSERT system_log_transaction_details (transaction_id, tables_id,
            foreign_tables_id, field_name, new_integer, old_integer)
        VALUES (i_TransactionId, v_TableId, i_ForeignTableId, i_FieldName,
            i_Integer, i_old_Integer);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogTransactionDetailSha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogTransactionDetailSha`(IN i_TransactionId BIGINT,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    IN i_ForeignTableId BIGINT,
    IN i_FieldName VARCHAR(255) CHARSET utf8,
    IN i_old_Sha CHAR(64) CHARSET utf8,
    IN i_Sha CHAR(64) CHARSET utf8,
    IN i_FieldLabel TEXT CHARSET utf8,
    INOUT io_HumanReadable TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT CHARSET utf8;

    IF ISNULL(io_HumanReadable) THEN
        SET io_HumanReadable := '';
    END IF;

    IF COALESCE(i_old_Sha, '') != COALESCE(i_Sha, '') THEN
        SET v_TranslatedLogMessage := '';

        CALL p_system_QuickTranslateString(i_FieldLabel, v_TranslatedLogMessage);

        SET io_HumanReadable := CONCAT(io_HumanReadable, '\n', v_TranslatedLogMessage,
            ': ', COALESCE(i_old_Sha, ''), ' => ', COALESCE(i_Sha, ''));

        IF ISNULL(i_TableName) = FALSE && i_TableName != '' THEN
            SET v_TableId := (SELECT _table_id FROM system_tables
                WHERE table_name = i_TableName AND _system_is_valid = 1);
        END IF;

        INSERT system_log_transaction_details (transaction_id, tables_id,
            foreign_tables_id, field_name, new_sha, old_sha)
        VALUES (i_TransactionId, v_TableId, i_ForeignTableId, i_FieldName,
            f_ShaToBin(i_Sha), f_ShaToBin(v_old_Sha));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogTransactionDetailText` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogTransactionDetailText`(IN i_TransactionId BIGINT,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    IN i_ForeignTableId BIGINT,
    IN i_FieldName VARCHAR(255) CHARSET utf8,
    IN i_old_Text TEXT CHARSET utf8,
    IN i_Text TEXT CHARSET utf8,
    IN i_FieldLabel TEXT CHARSET utf8,
    INOUT io_HumanReadable TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT CHARSET utf8;

    IF ISNULL(io_HumanReadable) THEN
        SET io_HumanReadable := '';
    END IF;

    IF COALESCE(i_old_Text, '') != COALESCE(i_Text, '') THEN
        SET v_TranslatedLogMessage := '';

        CALL p_system_QuickTranslateString(i_FieldLabel, v_TranslatedLogMessage);

        SET io_HumanReadable := CONCAT(io_HumanReadable, '\n', v_TranslatedLogMessage,
            ': ', COALESCE(i_old_Text, ''), ' => ', COALESCE(i_Text, ''));

        IF ISNULL(i_TableName) = FALSE && i_TableName != '' THEN
            SET v_TableId := (SELECT _table_id FROM system_tables
                WHERE table_name = i_TableName AND _system_is_valid = 1);
        END IF;

        INSERT system_log_transaction_details (transaction_id, tables_id,
            foreign_tables_id, field_name, new_text, old_text)
        VALUES (i_TransactionId, v_TableId, i_ForeignTableId, i_FieldName,
            i_Text, i_old_Text);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogTransactionDetailUuid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogTransactionDetailUuid`(IN i_TransactionId BIGINT,
    IN i_TableName VARCHAR(255) CHARSET utf8,
    IN i_ForeignTableId BIGINT,
    IN i_FieldName VARCHAR(255) CHARSET utf8,
    IN i_old_Uuid CHAR(36) CHARSET utf8,
    IN i_Uuid CHAR(36) CHARSET utf8,
    IN i_FieldLabel TEXT CHARSET utf8,
    INOUT io_HumanReadable TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT CHARSET utf8;

    IF ISNULL(io_HumanReadable) THEN
        SET io_HumanReadable := '';
    END IF;

    IF COALESCE(i_old_Uuid, '') != COALESCE(i_Uuid, '') THEN
        SET v_TranslatedLogMessage := '';

        CALL p_system_QuickTranslateString(i_FieldLabel, v_TranslatedLogMessage);

        SET io_HumanReadable := CONCAT(io_HumanReadable, '\n', v_TranslatedLogMessage,
            ': ', COALESCE(i_old_Uuid, ''), ' => ', COALESCE(i_Uuid, ''));

        IF ISNULL(i_TableName) = FALSE && i_TableName != '' THEN
            SET v_TableId := (SELECT _table_id FROM system_tables
                WHERE table_name = i_TableName AND _system_is_valid = 1);
        END IF;

        INSERT system_log_transaction_details (transaction_id, tables_id,
            foreign_tables_id, field_name, new_uuid, old_uuid)
        VALUES (i_TransactionId, v_TableId, i_ForeignTableId, i_FieldName,
            f_UuidToBin(i_Uuid), f_UuidToBin(v_old_Uuid));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_LogTransactionHumanHeadable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_LogTransactionHumanHeadable`(IN i_TransactionId BIGINT,
    IN i_HumanReadable TEXT CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_HumanReadable TEXT CHARSET utf8;

    IF LEFT(i_HumanReadable, 1) = '\n' THEN
        SET v_HumanReadable := RIGHT(i_HumanReadable, LENGTH(i_HumanReadable)-1);
    ELSE
        SET v_HumanReadable := i_HumanReadable;
    END IF;

    SET v_HumanReadable := LTRIM(RTRIM(v_HumanReadable));

    IF COALESCE(v_HumanReadable, '') != '' AND COALESCE(i_TransactionId, 0) != 0 THEN
        UPDATE system_log_transactions SET human_readable = v_HumanReadable
        WHERE _system_auto_id = i_TransactionId;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ModifyDock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ModifyDock`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientTypeUuid CHAR(36) CHARSET utf8,
    IN i_DockName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_PicturePath VARCHAR(500) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;

    DECLARE v_old_DockName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_old_DisplayName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_Weighting SMALLINT;
    DECLARE v_old_PicturePath VARCHAR(500) CHARSET utf8;
    DECLARE v_old_SecurityClientTypeId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;
    DECLARE v_old_SecurityClientTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_SecurityClientTypeLookupLabel VARCHAR(100) CHARSET utf8;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE _table_uuid = f_UuidToBin(i_SecurityClientTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM system_docks
        WHERE dock_name = i_DockName AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0 AND security_client_types_id = v_SecurityClientTypeId);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            dock_name, is_active, display_name, description, weighting,
            picture_path, security_client_types_id
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_DockName,
            v_old_IsActive, v_old_DisplayName, v_old_Description, v_old_Weighting,
            v_old_PicturePath, v_old_SecurityClientTypeId
        FROM system_docks
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_DockName, '') != COALESCE(v_old_DockName, '')
            OR COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0)
            OR COALESCE(i_PicturePath, '') != COALESCE(v_old_PicturePath, '')
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0)
            OR COALESCE(v_SecurityClientTypeId, 0) != COALESCE(v_old_SecurityClientTypeId) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT system_docks (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                dock_name, is_active, display_name, description, weighting,
                picture_path, security_client_types_id)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_DockName, i_IsActive, i_DisplayName, i_Description, i_Weighting,
                i_PicturePath, v_SecurityClientTypeId
            FROM system_docks
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE system_docks SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_docks', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(v_SecurityClientTypeId, 0) != COALESCE(v_old_SecurityClientTypeId, 0) THEN
                SELECT name_label
                INTO v_old_SecurityClientTypeLookupLabel
                FROM configuration_lookup_security_client_types
                WHERE _table_id = v_SecurityClientTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_SecurityClientTypeLookupLabel
                FROM configuration_lookup_security_client_types
                WHERE _table_id = v_SecurityClientTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_docks', v_TableId, 'security_client_types_id', v_old_SecurityClientTypeId,
                    v_SecurityClientTypeId, 'Security Client Type', v_old_SecurityClientTypeLookupLabel,
                    v_SecurityClientTypeLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_DockName, '') != COALESCE(v_old_DockName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_docks', v_TableId, 'dock_name', v_old_DockName,
                    i_DockName, 'Dock Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_docks', v_TableId, 'display_name', v_old_DisplayName,
                    i_DisplayName, 'Display Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_docks', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'system_docks', v_TableId, 'weighting', v_old_Weighting,
                    i_Weighting, 'Weighting', v_HumanReadable);
            END IF;

            IF COALESCE(i_PicturePath, '') != COALESCE(v_old_PicturePath, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_docks', v_TableId, 'picture_path', v_old_PicturePath,
                    i_PicturePath, 'Picture Path', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailBit(v_TransactionId,
                    'system_docks', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ModifyDockItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ModifyDockItem`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_DockUuid CHAR(36) CHARSET utf8,
    IN i_SystemDockTypeUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientTypeUuid CHAR(36) CHARSET utf8,
    IN i_ItemName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_PicturePath VARCHAR(500) CHARSET utf8,
    IN i_ItemAction VARCHAR(500) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;

    DECLARE v_old_ItemName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_old_DisplayName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_Weighting SMALLINT;
    DECLARE v_old_PicturePath VARCHAR(500) CHARSET utf8;
    DECLARE v_DockId BIGINT;
    DECLARE v_old_DockId BIGINT;
    DECLARE v_SystemDockTypeId BIGINT;
    DECLARE v_old_SystemDockTypeId BIGINT;
    DECLARE v_DockLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DockLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_SystemDockTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_SystemDockTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_SecurityClientTypeId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;
    DECLARE v_old_SecurityClientTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_SecurityClientTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_ItemAction VARCHAR(500) CHARSET utf8;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE _table_uuid = f_UuidToBin(i_SecurityClientTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockId
    FROM system_docks
    WHERE _table_uuid = f_UuidToBin(i_DockUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_SystemDockTypeId
    FROM configuration_lookup_system_dock_types
    WHERE _table_uuid = f_UuidToBin(i_SystemDockTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM system_dock_items
        WHERE item_name = i_ItemName AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0 AND docks_id = v_DockId
            AND security_client_types_id = v_SecurityClientTypeId);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            item_name, is_active, display_name, description, weighting,
            picture_path, docks_id, system_dock_types_id, security_client_types_id,
            item_action
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_ItemName,
            v_old_IsActive, v_old_DisplayName, v_old_Description, v_old_Weighting,
            v_old_PicturePath, v_old_DockId, v_old_SystemDockTypeId, v_old_SecurityClientTypeId,
            v_old_ItemAction
        FROM system_dock_items
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_ItemName, '') != COALESCE(v_old_ItemName, '')
            OR COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0)
            OR COALESCE(i_PicturePath, '') != COALESCE(v_old_PicturePath, '')
            OR COALESCE(v_DockId, 0) != COALESCE(v_old_DockId, 0)
            OR COALESCE(v_SystemDockTypeId, 0) != COALESCE(v_old_SystemDockTypeId)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0)
            OR COALESCE(v_SecurityClientTypeId, 0) != COALESCE(v_old_SecurityClientTypeId, 0)
            OR COALESCE(i_ItemAction, '') != COALESCE(v_old_ItemAction, '') THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT system_dock_items (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                item_name, is_active, display_name, description, weighting,
                picture_path, docks_id, system_dock_types_id, security_client_types_id,
                item_action)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_ItemName, i_IsActive, i_DisplayName, i_Description, i_Weighting,
                i_PicturePath, v_DockId, v_SystemDockTypeId, v_SecurityClientTypeId,
                i_ItemAction
            FROM system_dock_items
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE system_dock_items SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_dock_items', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_ItemName, '') != COALESCE(v_old_ItemName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_items', v_TableId, 'item_name', v_old_ItemName,
                    i_ItemName, 'Item Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_items', v_TableId, 'display_name', v_old_DisplayName,
                    i_DisplayName, 'Display Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_items', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'system_dock_items', v_TableId, 'weighting', v_old_Weighting,
                    i_Weighting, 'Weighting', v_HumanReadable);
            END IF;

            IF COALESCE(i_PicturePath, '') != COALESCE(v_old_PicturePath, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_items', v_TableId, 'picture_path', v_old_PicturePath,
                    i_PicturePath, 'Picture Path', v_HumanReadable);
            END IF;

            IF COALESCE(v_DockId, 0) != COALESCE(v_old_DockId, 0) THEN
                SELECT dock_name
                INTO v_old_DockLookupLabel
                FROM system_docks
                WHERE _table_id = v_old_DockId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT dock_name
                INTO v_DockLookupLabel
                FROM system_docks
                WHERE _table_id = v_DockId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_dock_items', v_TableId, 'docks_id', v_old_DockId,
                    v_DockId, 'Dock', v_old_DockLookupLabel,
                    v_DockLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(v_SystemDockTypeId, 0) != COALESCE(v_old_SystemDockTypeId, 0) THEN
                SELECT name_label
                INTO v_old_SystemDockTypeLookupLabel
                FROM configuration_lookup_system_dock_types
                WHERE _table_id = v_old_SystemDockTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_SystemDockTypeLookupLabel
                FROM configuration_lookup_system_dock_types
                WHERE _table_id = v_SystemDockTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_dock_items', v_TableId, 'system_dock_types_id', v_old_SystemDockTypeId,
                    v_SystemDockTypeId, 'Dock Type', v_old_SystemDockTypeLookupLabel,
                    v_SystemDockTypeLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(v_SecurityClientTypeId, 0) != COALESCE(v_old_SecurityClientTypeId, 0) THEN
                SELECT name_label
                INTO v_old_SecurityClientTypeLookupLabel
                FROM configuration_lookup_security_client_types
                WHERE _table_id = v_SecurityClientTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_SecurityClientTypeLookupLabel
                FROM configuration_lookup_security_client_types
                WHERE _table_id = v_SecurityClientTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_dock_items', v_TableId, 'security_client_types_id', v_old_SecurityClientTypeId,
                    v_SecurityClientTypeId, 'Security Client Type', v_old_SecurityClientTypeLookupLabel,
                    v_SecurityClientTypeLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_ItemAction, '') != COALESCE(v_old_ItemAction, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_items', v_TableId, 'item_action', v_old_ItemAction,
                    i_ItemAction, 'Item Action', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailBit(v_TransactionId,
                    'system_dock_items', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ModifyDockSubitem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ModifyDockSubitem`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_DockItemUuid CHAR(36) CHARSET utf8,
    IN i_SystemDockTypeUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientTypeUuid CHAR(36) CHARSET utf8,
    IN i_SubitemName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_PicturePath VARCHAR(500) CHARSET utf8,
    IN i_SubitemAction VARCHAR(500) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;

    DECLARE v_old_SubitemName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_old_DisplayName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_Weighting SMALLINT;
    DECLARE v_old_PicturePath VARCHAR(500) CHARSET utf8;
    DECLARE v_DockItemId BIGINT;
    DECLARE v_old_DockItemId BIGINT;
    DECLARE v_SystemDockTypeId BIGINT;
    DECLARE v_old_SystemDockTypeId BIGINT;
    DECLARE v_DockItemLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DockItemLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_SystemDockTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_SystemDockTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_SecurityClientTypeId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;
    DECLARE v_old_SecurityClientTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_SecurityClientTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_SubitemAction VARCHAR(500) CHARSET utf8;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE _table_uuid = f_UuidToBin(i_SecurityClientTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockItemId
    FROM system_dock_items
    WHERE _table_uuid = f_UuidToBin(i_DockItemUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_SystemDockTypeId
    FROM configuration_lookup_system_dock_types
    WHERE _table_uuid = f_UuidToBin(i_SystemDockTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM system_dock_subitems
        WHERE subitem_name = i_SubitemName AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0
            AND dock_items_id = v_DockItemId AND security_client_types_id = v_SecurityClientTypeId);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            subitem_name, is_active, display_name, description, weighting,
            picture_path, dock_items_id, system_dock_types_id, security_client_types_id,
            subitem_action
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_SubitemName,
            v_old_IsActive, v_old_DisplayName, v_old_Description, v_old_Weighting,
            v_old_PicturePath, v_old_DockItemId, v_old_SystemDockTypeId, v_old_SecurityClientTypeId,
            v_old_SubitemAction
        FROM system_dock_subitems
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_SubitemName, '') != COALESCE(v_old_SubitemName, '')
            OR COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0)
            OR COALESCE(i_PicturePath, '') != COALESCE(v_old_PicturePath, '')
            OR COALESCE(v_DockItemId, 0) != COALESCE(v_old_DockItemId, 0)
            OR COALESCE(v_SystemDockTypeId, 0) != COALESCE(v_old_SystemDockTypeId)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0)
            OR COALESCE(v_SecurityClientTypeId, 0) != COALESCE(v_old_SecurityClientTypeId, 0)
            OR COALESCE(i_SubitemAction, '') != COALESCE(v_old_SubitemAction, '') THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT system_dock_subitems (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                subitem_name, is_active, display_name, description, weighting,
                picture_path, dock_items_id, system_dock_types_id, security_client_types_id,
                subitem_action)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_SubitemName, i_IsActive, i_DisplayName, i_Description, i_Weighting,
                i_PicturePath, v_DockItemId, v_SystemDockTypeId, v_SecurityClientTypeId,
                i_SubitemAction
            FROM system_dock_subitems
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE system_dock_subitems SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_dock_subitems', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_SubitemName, '') != COALESCE(v_old_SubitemName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_subitems', v_TableId, 'subitem_name', v_old_SubitemName,
                    i_SubitemName, 'Subitem Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_subitems', v_TableId, 'display_name', v_old_DisplayName,
                    i_DisplayName, 'Display Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_subitems', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'system_dock_subitems', v_TableId, 'weighting', v_old_Weighting,
                    i_Weighting, 'Weighting', v_HumanReadable);
            END IF;

            IF COALESCE(i_PicturePath, '') != COALESCE(v_old_PicturePath, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_subitems', v_TableId, 'icon', v_old_PicturePath,
                    i_PicturePath, 'Picture Path', v_HumanReadable);
            END IF;

            IF COALESCE(v_DockItemId, 0) != COALESCE(v_old_DockItemId, 0) THEN
                SELECT item_name
                INTO v_old_DockItemLookupLabel
                FROM system_dock_items
                WHERE _table_id = v_old_DockItemId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT item_name
                INTO v_DockItemLookupLabel
                FROM system_dock_items
                WHERE _table_id = v_DockItemId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_dock_subitems', v_TableId, 'dock_items_id', v_old_DockItemId,
                    v_DockItemId, 'Dock Item', v_old_DockItemLookupLabel,
                    v_DockItemLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_SystemDockTypeId, 0) != COALESCE(v_old_SystemDockTypeId, 0) THEN
                SELECT name_label
                INTO v_old_SystemDockTypeLookupLabel
                FROM configuration_lookup_system_dock_types
                WHERE _table_id = v_old_SystemDockTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_SystemDockTypeLookupLabel
                FROM configuration_lookup_system_dock_types
                WHERE _table_id = v_SystemDockTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_dock_subitems', v_TableId, 'system_dock_types_id', v_old_SystemDockTypeId,
                    v_SystemDockTypeId, 'Dock Type', v_old_SystemDockTypeLookupLabel,
                    v_SystemDockTypeLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(v_SecurityClientTypeId, 0) != COALESCE(v_old_SecurityClientTypeId, 0) THEN
                SELECT name_label
                INTO v_old_SecurityClientTypeLookupLabel
                FROM configuration_lookup_security_client_types
                WHERE _table_id = v_SecurityClientTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_SecurityClientTypeLookupLabel
                FROM configuration_lookup_security_client_types
                WHERE _table_id = v_SecurityClientTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_dock_subitems', v_TableId, 'security_client_types_id', v_old_SecurityClientTypeId,
                    v_SecurityClientTypeId, 'Security Client Type', v_old_SecurityClientTypeLookupLabel,
                    v_SecurityClientTypeLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_SubitemAction, '') != COALESCE(v_old_SubitemAction, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_subitems', v_TableId, 'subitem_action', v_old_SubitemAction,
                    i_SubitemAction, 'Subitem Action', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailBit(v_TransactionId,
                    'system_dock_subitems', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ModifyDockTab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ModifyDockTab`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_SecurityClientTypeUuid CHAR(36) CHARSET utf8,
    IN i_SystemDockTypeUuid CHAR(36) CHARSET utf8,
    IN i_DockItemUuid CHAR(36) CHARSET utf8,
    IN i_DockSubitemUuid CHAR(36) CHARSET utf8,
    IN i_TabName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_Weighting SMALLINT,
    IN i_PicturePath VARCHAR(500) CHARSET utf8,
    IN i_TabAction VARCHAR(500) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;

    DECLARE v_old_TabName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_old_DisplayName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_Weighting SMALLINT;
    DECLARE v_old_PicturePath VARCHAR(500) CHARSET utf8;
    DECLARE v_DockItemId BIGINT;
    DECLARE v_old_DockItemId BIGINT;
    DECLARE v_DockSubitemId BIGINT;
    DECLARE v_old_DockSubitemId BIGINT;
    DECLARE v_DockItemLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DockItemLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_DockSubitemLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_DockSubitemLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_SecurityClientTypeId BIGINT;
    DECLARE v_SecurityClientTypeId BIGINT;
    DECLARE v_old_SecurityClientTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_SecurityClientTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_TabAction VARCHAR(500) CHARSET utf8;
    DECLARE v_SystemDockTypeId BIGINT;
    DECLARE v_old_SystemDockTypeId BIGINT;
    DECLARE v_old_SystemDockTypeLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_SystemDockTypeLookupLabel VARCHAR(100) CHARSET utf8;

    SELECT _table_id INTO v_SecurityClientTypeId
    FROM configuration_lookup_security_client_types
    WHERE _table_uuid = f_UuidToBin(i_SecurityClientTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockItemId
    FROM system_dock_items
    WHERE _table_uuid = f_UuidToBin(i_DockItemUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_DockSubitemId
    FROM system_dock_subitems
    WHERE _table_uuid = f_UuidToBin(i_DockSubitemUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_SystemDockTypeId
    FROM configuration_lookup_system_dock_types
    WHERE _table_uuid = f_UuidToBin(i_SystemDockTypeUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM system_dock_tabs
        WHERE tab_name = i_TabName AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0 AND COALESCE(dock_items_id, 0) = COALESCE(v_DockItemId, 0)
            AND COALESCE(dock_subitems_id, 0) = COALESCE(v_DockSubitemId, 0)
            AND security_client_types_id = v_SecurityClientTypeId
            AND system_dock_types_id = v_SystemDockTypeId);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            tab_name, is_active, display_name, description, weighting,
            picture_path, dock_items_id, dock_subitems_id, security_client_types_id,
            tab_action, system_dock_types_id, dock_items_id,
            dock_subitems_id
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_TabName,
            v_old_IsActive, v_old_DisplayName, v_old_Description, v_old_Weighting,
            v_old_PicturePath, v_old_DockItemId, v_old_DockSubitemId, v_old_SecurityClientTypeId,
            v_old_TabAction, v_old_SystemDockTypeId, v_old_DockItemId,
            v_old_DockSubitemId
        FROM system_dock_tabs
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_TabName, '') != COALESCE(v_old_TabName, '')
            OR COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0)
            OR COALESCE(i_PicturePath, '') != COALESCE(v_old_PicturePath, '')
            OR COALESCE(v_DockItemId, 0) != COALESCE(v_old_DockItemId, 0)
            OR COALESCE(v_DockSubitemId, 0) != COALESCE(v_old_DockSubitemId, 0)
            OR COALESCE(v_SystemDockTypeId, 0) != COALESCE(v_old_SystemDockTypeId)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0)
            OR COALESCE(v_SecurityClientTypeId, 0) != COALESCE(v_old_SecurityClientTypeId, 0) 
            OR COALESCE(i_TabAction, '') != COALESCE(v_old_TabAction, '') THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT system_dock_tabs (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                tab_name, is_active, display_name, description, weighting,
                picture_path, dock_items_id, dock_subitems_id, security_client_types_id,
                tab_action, system_dock_types_id)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_TabName, i_IsActive, i_DisplayName, i_Description, i_Weighting,
                i_PicturePath, v_DockItemId, v_DockSubitemId, v_SecurityClientTypeId,
                i_TabAction, v_SystemDockTypeId
            FROM system_dock_tabs
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE system_dock_tabs SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_dock_tabs', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_TabName, '') != COALESCE(v_old_TabName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_tabs', v_TableId, 'tab_name', v_old_TabName,
                    i_TabName, 'Tab Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_tabs', v_TableId, 'display_name', v_old_DisplayName,
                    i_DisplayName, 'Display Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_tabs', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_Weighting, 0) != COALESCE(v_old_Weighting, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'system_dock_tabs', v_TableId, 'weighting', v_old_Weighting,
                    i_Weighting, 'Weighting', v_HumanReadable);
            END IF;

            IF COALESCE(i_PicturePath, '') != COALESCE(v_old_PicturePath, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_tabs', v_TableId, 'picture_path', v_old_PicturePath,
                    i_PicturePath, 'Picture Path', v_HumanReadable);
            END IF;

            IF COALESCE(v_DockItemId, 0) != COALESCE(v_old_DockItemId, 0) THEN
                SELECT item_name
                INTO v_old_DockItemLookupLabel
                FROM system_dock_items
                WHERE _table_id = v_old_DockItemId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT item_name
                INTO v_DockItemLookupLabel
                FROM system_dock_items
                WHERE _table_id = v_DockItemId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_dock_tabs', v_TableId, 'dock_items_id', v_old_DockItemId,
                    v_DockItemId, 'Dock', v_old_DockItemLookupLabel,
                    v_DockItemLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(v_DockSubitemId, 0) != COALESCE(v_old_DockSubitemId, 0) THEN
                SELECT subitem_name
                INTO v_old_DockSubitemLookupLabel
                FROM system_dock_subitems
                WHERE _table_id = v_old_DockSubitemId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT subitem_name
                INTO v_DockSubitemLookupLabel
                FROM system_dock_subitems
                WHERE _table_id = v_DockSubitemId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_dock_tabs', v_TableId, 'dock_subitems_id', v_old_DockSubitemId,
                    v_DockSubitemId, 'Dock', v_old_DockSubitemLookupLabel,
                    v_DockSubitemLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(v_SecurityClientTypeId, 0) != COALESCE(v_old_SecurityClientTypeId, 0) THEN
                SELECT name_label
                INTO v_old_SecurityClientTypeLookupLabel
                FROM configuration_lookup_security_client_types
                WHERE _table_id = v_SecurityClientTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_SecurityClientTypeLookupLabel
                FROM configuration_lookup_security_client_types
                WHERE _table_id = v_SecurityClientTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_dock_items', v_TableId, 'security_client_types_id', v_old_SecurityClientTypeId,
                    v_SecurityClientTypeId, 'Security Client Type', v_old_SecurityClientTypeLookupLabel,
                    v_SecurityClientTypeLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(v_SystemDockTypeId, 0) != COALESCE(v_old_SystemDockTypeId, 0) THEN
                SELECT name_label
                INTO v_old_SystemDockTypeLookupLabel
                FROM configuration_lookup_system_dock_types
                WHERE _table_id = v_old_SystemDockTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_SystemDockTypeLookupLabel
                FROM configuration_lookup_system_dock_types
                WHERE _table_id = v_SystemDockTypeId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_dock_tabs', v_TableId, 'system_dock_types_id', v_old_SystemDockTypeId,
                    v_SystemDockTypeId, 'Dock Type', v_old_SystemDockTypeLookupLabel,
                    v_SystemDockTypeLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_TabAction, '') != COALESCE(v_old_TabAction, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_dock_tabs', v_TableId, 'tab_action', v_old_TabAction,
                    i_TabAction, 'Tab Action', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailBit(v_TransactionId,
                    'system_dock_items', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ModifyFieldTranslation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ModifyFieldTranslation`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_ForeignTableUuid CHAR(36) CHARSET utf8,
    IN i_FieldName VARCHAR(255) CHARSET utf8,
    IN i_Translation TEXT CHARSET utf8,
    IN i_GlobalLanguageUuid CHAR(36) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;

    DECLARE v_ForeignTableId BIGINT;
    DECLARE v_old_ForeignTableId BIGINT;
    DECLARE v_old_FieldName VARCHAR(255) CHARSET utf8;
    DECLARE v_old_Translation TEXT CHARSET utf8;
    DECLARE v_old_GlobalLanguageId BIGINT;
    DECLARE v_GlobalLanguageId BIGINT;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_ForeignTableLookupLabel VARCHAR(255) CHARSET utf8;
    DECLARE v_old_ForeignTableLookupLabel VARCHAR(255) CHARSET utf8;
    DECLARE v_GlobalLanguageLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_GlobalLanguageLookupLabel VARCHAR(100) CHARSET utf8;

    SELECT _table_id
    INTO v_ForeignTableId
    FROM system_tables
    WHERE _table_uuid = f_UuidToBin(i_ForeignTableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id
    INTO v_GlobalLanguageId
    FROM configuration_lookup_global_languages
    WHERE _table_uuid = f_UuidToBin(i_GlobalLanguageUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM system_field_translations
        WHERE field_name = i_FieldName AND tables_id = v_ForeignTableId AND global_languages_id = v_GlobalLanguageId
            AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            tables_id, field_name, translation, global_languages_id, is_active
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_ForeignTableId,
            v_old_FieldName, v_old_Translation, v_old_GlobalLanguageId, v_old_IsActive
        FROM system_field_translations
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_ForeignTableId, 0) != COALESCE(v_old_ForeignTableId, 0)
            OR COALESCE(i_FieldName, '') != COALESCE(v_old_FieldName, '')
            OR COALESCE(i_Translation, '') != COALESCE(v_old_Translation, '')
            OR COALESCE(i_GlobalLanguageId, 0) != COALESCE(v_old_GlobalLanguageId, 0)
            OR COALESCE(v_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT system_field_translations (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                tables_id, field_name, translation, global_languages_id, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, v_ForeignTableId, i_FieldName, i_Translation,
                v_GlobalLanguageId, i_IsActive
            FROM system_field_translations
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE system_messages SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_field_translations', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_ForeignTableId, 0) != COALESCE(v_old_ForeignTableId, 0) THEN
                SELECT table_name
                INTO v_old_ForeignTableLookupLabel
                FROM system_tables
                WHERE _table_id = v_old_ForeignTableId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT table_name
                INTO v_ForeignTableLookupLabel
                FROM system_tables
                WHERE _table_id = v_ForeignTableId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_field_translations', v_TableId, 'tables_id', v_old_ForeignTableId,
                    v_ForeignTableId, 'Table', v_old_ForeignTableLookupLabel,
                    v_ForeignTableLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_FieldName, '') != COALESCE(v_old_FieldName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_field_translations', v_TableId, 'field_name', v_old_FieldName,
                    i_FieldName, 'Field Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Translation, '') != COALESCE(v_old_Translation, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_field_translations', v_TableId, 'translation', v_old_Translation,
                    i_Translation, 'Translation', v_HumanReadable);
            END IF;

            IF COALESCE(i_GlobalLanguageId, 0) != COALESCE(v_old_GlobalLanguageId, 0) THEN
                SELECT name_label
                INTO v_old_GlobalLanguageLookupLabel
                FROM configuration_lookup_global_languages
                WHERE _table_id = v_old_GlobalLanguageId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_GlobalLanguageLookupLabel
                FROM configuration_lookup_global_languages
                WHERE _table_id = v_GlobalLanguageId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_field_translations', v_TableId, 'global_languages_id', v_old_GlobalLanguageId,
                    v_GlobalLanguageId, 'Language', v_old_GlobalLanguageLookupLabel,
                    v_GlobalLanguageLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'system_field_translations', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ModifyMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ModifyMessage`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_MessageName VARCHAR(100) CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_ModuleUuid CHAR(36) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;

    DECLARE v_old_MessageName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_ModuleId BIGINT;
    DECLARE v_ModuleId BIGINT;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_Magic VARCHAR(70) CHARSET utf8;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_ModuleLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_ModuleLookupLabel VARCHAR(100) CHARSET utf8; 

    SET v_ModuleId := (SELECT _table_id FROM system_modules
        WHERE _table_uuid = f_UuidToBin(i_ModuleUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0);

    SET v_RowCount := (SELECT COUNT(*) FROM system_messages
        WHERE magic = i_Magic AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            message_name, modules_id, magic, description, is_active
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_MessageName,
            v_old_ModuleId, v_old_Magic, v_old_Description, v_old_IsActive
        FROM system_messages
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_MessageName, '') != COALESCE(v_old_MessageName, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '')
            OR COALESCE(v_ModuleId, 0) != COALESCE(v_old_ModuleId, 0)
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT system_messages (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                message_name, modules_id, magic, description, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_MessageName, v_ModuleId, i_Magic, i_Description, i_IsActive
            FROM system_messages
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE system_messages SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_messages', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_MessageName, '') != COALESCE(v_old_MessageName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_messages', v_TableId, 'message_name', v_old_MessageName,
                    i_MessageName, 'Message Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_messages', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_messages', v_TableId, 'magic', v_old_Magic,
                    i_Magic, 'Magic', v_HumanReadable);
            END IF;

            IF COALESCE(v_ModuleId, 0) != COALESCE(v_old_ModuleId, 0) THEN
                SELECT module_name
                INTO v_old_ModuleLookupLabel
                FROM system_modules
                WHERE _table_id = v_old_ModuleId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT module_name
                INTO v_ModuleLookupLabel
                FROM system_modules
                WHERE _table_id = v_ModuleId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_messages', v_TableId, 'modules_id', v_old_ModuleId,
                    v_ModuleId, 'Module', v_old_ModuleLookupLabel, v_ModuleLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'system_messages', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ModifyModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ModifyModule`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_ModuleName VARCHAR(100) CHARSET utf8,
    IN i_Magic VARCHAR(70) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;

    DECLARE v_old_ModuleName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Magic VARCHAR(70) CHARSET utf8;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM system_modules
        WHERE magic = i_Magic AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            module_name, magic, is_active, description
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_ModuleName,
            v_old_Magic, v_old_IsActive, v_old_Description
        FROM system_modules
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_ModuleName, '') != COALESCE(v_old_ModuleName, '')
            OR COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT system_modules (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                module_name, magic, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_ModuleName, i_Magic, i_IsActive
            FROM system_messages
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE system_messages SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_modules', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_ModuleName, '') != COALESCE(v_old_ModuleName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_modules', v_TableId, 'module_name', v_old_ModuleName,
                    i_ModuleName, 'Module Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Magic, '') != COALESCE(v_old_Magic, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_modules', v_TableId, 'magic', v_old_Magic,
                    i_Magic, 'Magic', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_modules', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'system_modules', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ModifyPartition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ModifyPartition`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_PartitionName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;

    DECLARE v_old_PartitionName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM system_partitions
        WHERE partition_name = i_PartitionName AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            partition_name, is_active, description
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_PartitionName,
            v_old_IsActive, v_old_Description
        FROM system_partitions
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_PartitionName, '') != COALESCE(v_old_PartitionName, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT system_partitions (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                partition_name, is_active, description)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_PartitionName, i_IsActive, i_Description
            FROM system_partitions
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE system_partitions SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_partitions', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_PartitionName, '') != COALESCE(v_old_PartitionName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_partitions', v_TableId, 'partition_name', v_old_PartitionName,
                    i_PartitionName, 'Partition Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_partitions', v_TableId, 'description', v_old_Description,
                    i_Description, 'Description', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'system_partitions', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ModifyStringTranslation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ModifyStringTranslation`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_Source VARCHAR(255) CHARSET utf8,
    IN i_Translation TEXT CHARSET utf8,
    IN i_GlobalLanguageUuid CHAR(36) CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;

    DECLARE v_old_Source VARCHAR(255) CHARSET utf8;
    DECLARE v_old_Translation TEXT CHARSET utf8;
    DECLARE v_old_GlobalLanguageId BIGINT;
    DECLARE v_GlobalLanguageId BIGINT;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_GlobalLanguageLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_GlobalLanguageLookupLabel VARCHAR(100) CHARSET utf8;

    SELECT _table_id
    INTO v_GlobalLanguageId
    FROM configuration_lookup_global_languages
    WHERE _table_uuid = f_UuidToBin(i_GlobalLanguageUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM system_string_translations
        WHERE source = i_Source AND global_languages_id = v_GlobalLanguageId
            AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            source, translation, global_languages_id, is_active
        INTO v_TableUuid, v_TableId, v_SystemPreviousId,
            v_old_Source, v_old_Translation, v_old_GlobalLanguageId, v_old_IsActive
        FROM system_string_translations
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_Source, '') != COALESCE(v_old_Source, '')
            OR COALESCE(i_Translation, '') != COALESCE(v_old_Translation, '')
            OR COALESCE(i_GlobalLanguageId, 0) != COALESCE(v_old_GlobalLanguageId, 0)
            OR COALESCE(v_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT system_string_translations (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                source, translation, global_languages_id, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_Source, i_Translation, v_GlobalLanguageId, i_IsActive
            FROM system_string_translations
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE system_string_translations SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_string_translations', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_Source, '') != COALESCE(v_old_Source, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_string_translations', v_TableId, 'source', v_old_Source,
                    i_Source, 'Source', v_HumanReadable);
            END IF;

            IF COALESCE(i_Translation, '') != COALESCE(v_old_Translation, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_string_translations', v_TableId, 'translation', v_old_Translation,
                    i_Translation, 'Translation', v_HumanReadable);
            END IF;

            IF COALESCE(i_GlobalLanguageId, 0) != COALESCE(v_old_GlobalLanguageId, 0) THEN
                SELECT name_label
                INTO v_old_GlobalLanguageLookupLabel
                FROM configuration_lookup_global_languages
                WHERE _table_id = v_old_GlobalLanguageId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_GlobalLanguageLookupLabel
                FROM configuration_lookup_global_languages
                WHERE _table_id = v_GlobalLanguageId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'system_string_translations', v_TableId, 'global_languages_id', v_old_GlobalLanguageId,
                    v_GlobalLanguageId, 'Language', v_old_GlobalLanguageLookupLabel,
                    v_GlobalLanguageLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'system_string_translations', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_ModifyTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_ModifyTable`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_TableName VARCHAR(100) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;

    DECLARE v_old_TableName VARCHAR(100) CHARSET utf8;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM system_tables
        WHERE table_name = i_TableName AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid));

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id,
            partition_name
        INTO v_TableUuid, v_TableId, v_old_TableName
        FROM system_partitions
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_TableName, '') != COALESCE(v_old_TableName, '') THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            UPDATE system_tables SET table_name = i_TableName WHERE _table_id = v_TableId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_tables', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_TableName, '') != COALESCE(v_old_TableName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'system_tables', v_TableId, 'table_name', v_old_TableName,
                    i_TableName, 'Partition Name', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_QuickTranslateString` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_QuickTranslateString`(IN i_Source TEXT CHARSET utf8,
    OUT o_Translation TEXT CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_GlobalLanguageId BIGINT;
 
    SET o_Translation := i_Source;

    IF NOT ISNULL(i_Source) AND i_Source != '' THEN
        SELECT l._table_id
        INTO v_GlobalLanguageId
        FROM configuration_lookup_global_languages AS l
            INNER JOIN configuration_globals AS g ON g.text_setting = l.language_code
        WHERE l.language_family = g.text_setting
            AND l._system_is_valid = 1 AND l._system_is_deleted = 0
            AND g._system_is_valid = 1 AND g._system_is_deleted = 0
            AND g.magic = 'default_language';

        IF NOT ISNULL(v_GlobalLanguageId) THEN
            SELECT translation
            INTO o_Translation
            FROM system_string_translations
            WHERE source = i_Source
                AND global_languages_id = v_GlobalLanguageId
                AND _system_is_valid = 1
                AND is_active = 1
                AND _system_is_deleted = 0
            LIMIT 1;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_RemoveDock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_RemoveDock`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM system_docks
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM system_dock_items
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND docks_id = v_TableId;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT system_docks (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            dock_name, display_name, description, weighting, picture_path, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, dock_name, display_name, description, weighting, picture_path, is_active
        FROM system_docks
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE system_docks SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        -- might need to do this. think about the dock permissions
        -- DELETE FROM security_effective_permissions WHERE docks_id = v_TableId;

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_docks', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_RemoveDockItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_RemoveDockItem`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM system_dock_items
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM system_dock_subitems
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND dock_items_id = v_TableId;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT system_dock_items (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            item_name, display_name, description, weighting, picture_path, is_active,
            docks_id, system_dock_types_id, action)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, dock_name, display_name, description, weighting, picture_path, is_active,
            docks_id, system_dock_types_id, action
        FROM system_dock_items
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE system_dock_items SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        -- might need to do this. think about the dock permissions
        -- DELETE FROM security_effective_permissions WHERE docks_id = v_TableId;

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_dock_items', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_RemoveDockSubitem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_RemoveDockSubitem`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM system_dock_subitems
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT system_dock_subitems (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            item_name, display_name, description, weighting, picture_path, is_active,
            dock_items_id, system_dock_types_id, action)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, dock_name, display_name, description, weighting, picture_path, is_active,
            dock_items_id, system_dock_types_id, action
        FROM system_dock_subitems
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE system_dock_subitems SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        -- might need to do this. think about the dock permissions
        -- DELETE FROM security_effective_permissions WHERE docks_id = v_TableId;

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_dock_subitems', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_RemoveDockTab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_RemoveDockTab`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM system_dock_tabs
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT system_dock_tabs (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            tab_name, display_name, description, weighting, picture_path, is_active,
            dock_items_id, dock_subitems_id, action, system_dock_types_id)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, tab_name, display_name, description, weighting, picture_path, is_active,
            dock_items_id, dock_subitems_id, action, system_dock_types_id
        FROM system_dock_tabs
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE system_dock_tabs SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        -- might need to do this. think about the dock permissions
        -- DELETE FROM security_effective_permissions WHERE docks_id = v_TableId;

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_dock_tabs', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_RemoveFieldTranslation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_RemoveFieldTranslation`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM system_field_translations
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT system_field_translations (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            tables_id, field_name, translation, global_languages_id, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, tables_id, field_name, translation, global_languages_id, is_active
        FROM system_field_translations
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE system_field_translations SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_field_translations', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_RemoveMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_RemoveMessage`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM system_messages
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM security_messages_permissions
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND messages_id = v_TableId;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT system_messages (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            message_name, modules_id, magic, description, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, message_name, modules_id, magic, description, is_active
        FROM system_messages
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE system_messages SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_messages', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_RemoveModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_RemoveModule`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM system_modules
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM security_permissions
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND modules_id = v_TableId;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM security_log_transactions
        WHERE modules_id = v_TableId;
    END IF;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM system_messages
        WHERE _system_is_valid = 1 AND _system_is_deleted = 0
            AND modules_id = v_TableId;
    END IF;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT system_modules (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            module_name, magic, is_active, description)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, module_name, magic, is_active, description
        FROM system_modules
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE system_modules SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_modules', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_RemovePartition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_RemovePartition`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM system_partitions
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM security_roles
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND partitions_id = v_TableId;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM security_users_permissions
        WHERE _system_is_valid = 1 AND _system_is_deleted = 0
            AND partitions_id = v_TableId;
    END IF;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT system_partitions (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            partition_name, is_active, description)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, partition_name, is_active, description
        FROM system_partitions
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE system_partitions SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        DELETE FROM security_effective_permissions WHERE partitions_id = v_TableId;

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_partitions', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_RemoveStringTranslation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_RemoveStringTranslation`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM system_string_translations
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT system_string_translations (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            source, translation, global_languages_id, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, source, translation, global_languages_id, is_active
        FROM system_string_translations
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE system_string_translations SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_string_translations', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_RemoveTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_RemoveTable`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_UsedCount BIGINT;

    SELECT _table_id
    INTO v_TableId
    FROM system_tables
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM system_log_transactions
    WHERE tables_id = v_TableId;

    IF v_UsedCount = 0 THEN
         SELECT COUNT(*)
        INTO v_UsedCount
        FROM system_log_transaction_details
        WHERE tables_id = v_TableId;
    END IF;

    IF v_UsedCount = 0 THEN
         SELECT COUNT(*)
        INTO v_UsedCount
        FROM system_translations
        WHERE table_id = v_TableId
            AND _system_is_valid = 1 AND _system_is_deleted = 0;
    END IF;

    IF NOT ISNULL(v_TableId) AND v_UsedCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        UPDATE system_tables SET _system_is_valid = 0 WHERE _table_id = v_TableId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'system', 0, 'system_tables', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_TranslateString` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_TranslateString`(IN i_Source TEXT CHARSET utf8,
    IN i_LanguageCode VARCHAR(20) CHARSET utf8,
    OUT o_Translation TEXT CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_LanguageCode VARCHAR(20) CHARSET utf8;
    DECLARE v_GlobalLanguageId BIGINT;
 
    SET o_Translation := i_Source;

    IF NOT ISNULL(i_Source) AND i_Source != '' THEN

        -- TODO: come up with a better algorithm for finding the
        --       language id.

        IF ISNULL(i_LanguageCode) OR i_LanguageCode = '' THEN
            SELECT text_setting
            INTO v_LanguageCode
            FROM configuration_globals
            WHERE _system_is_valid = 1 AND _system_is_deleted = 0
                AND magic = 'default_language'
            LIMIT 1;
        ELSE
            SET v_LanguageCode := i_LanguageCode;
        END IF;

        SELECT _table_id
        INTO v_GlobalLanguageId
        FROM configuration_lookup_global_languages
        WHERE language_code = v_LanguageCode
            AND _system_is_valid = 1 AND _system_is_deleted = 0
        LIMIT 1;

        IF ISNULL(v_GlobalLanguageId) THEN
            SELECT _table_id
            INTO v_GlobalLanguageId
            FROM configuration_lookup_global_languages
            WHERE language_family = v_LanguageCode
                AND _system_is_valid = 1 AND _system_is_deleted = 0
            LIMIT 1;
        END IF;

        IF ISNULL(v_GlobalLanguageId) THEN
            SELECT l._table_id
            INTO v_GlobalLanguageId
            FROM configuration_lookup_global_languages AS l
                INNER JOIN configuration_globals AS g ON g.text_setting = l.language_code
            WHERE l.language_family = v_LanguageCode
                AND l._system_is_valid = 1 AND l._system_is_deleted = 0
                AND g._system_is_valid = 1 AND g._system_is_deleted = 0
                AND g.magic = 'default_language';
        END IF;

        IF NOT ISNULL(v_GlobalLanguageId) THEN
            SELECT translation
            INTO o_Translation
            FROM system_string_translations
            WHERE source = i_Source
                AND global_languages_id = v_GlobalLanguageId
                AND _system_is_valid = 1 AND _system_is_deleted = 0
                AND is_active = 1
            LIMIT 1;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_system_UnlockTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_system_UnlockTable`(IN i_TableName VARCHAR(255) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    UPDATE system_tables SET mutex = 0 WHERE table_name = i_TableName AND mutex = 1 AND _system_is_valid = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_AddGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_AddGroup`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_GroupName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount INT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;

    SET v_RowCount := (SELECT COUNT(*) FROM user_groups
        WHERE group_name = i_GroupName AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('user_groups', v_TableId);

        INSERT user_groups (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, group_name, display_name,
            description, is_active)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, i_GroupName,
            i_DisplayName, i_Description, i_IsActive);

        CALL p_system_UnlockTable('user_groups');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'user', 0, 'user_groups', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_AddUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_AddUser`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_GlobalTitleUuid CHAR(36) CHARSET utf8,
    IN i_FirstName VARCHAR(100) CHARSET utf8,
    IN i_LastName VARCHAR(100) CHARSET utf8,
    IN i_Username VARCHAR(50) CHARSET utf8,
    IN i_PreferredGlobalLanguageUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount INT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_GlobalTitleId BIGINT;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_PreferredGlobalLanguageId BIGINT;

    SELECT _table_id INTO v_GlobalTitleId
    FROM configuration_lookup_global_titles
    WHERE _table_uuid = f_UuidToBin(i_GlobalTitleUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_PreferredGlobalLanguageId
    FROM configuration_lookup_global_languages
    WHERE _table_uuid = f_UuidToBin(i_PreferredGlobalLanguageUuid)
        AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SET v_RowCount := (SELECT COUNT(*) FROM user_users
        WHERE username = i_Username AND _system_is_valid = 1 AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('user_users', v_TableId);

        INSERT user_users (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, global_titles_id,
            first_name, last_name, username, preferred_global_languages_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_GlobalTitleId,
            i_FirstName, i_LastName, i_Username, v_PreferredGlobalLanguageId);

        CALL p_system_UnlockTable('user_users');

        -- Human readable transaction log
        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'user', v_TableId, 'user_users', v_TableId,
            'record_added', '', v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_AddUserGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_AddUserGroup`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_UserUuid CHAR(36) CHARSET utf8,
    IN i_GroupUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_UserId BIGINT;
    DECLARE v_GroupId BIGINT;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT;
    
    SET v_RowCount := 0;

    SELECT _table_id INTO v_UserId
    FROM user_users
    WHERE _table_uuid = f_UuidToBin(i_UserUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT _table_id INTO v_GroupId
    FROM user_groups
    WHERE _table_uuid = f_UuidToBin(i_GroupUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0;

    IF v_UserId > 0 AND v_RoleId > 0 THEN
        SET v_RowCount := (SELECT COUNT(*)
            FROM security_users_roles
            WHERE _system_is_valid = 1 AND users_id = v_UserId
                AND roles_id = v_RoleId AND _system_is_deleted = 0);
    END IF;

    IF v_RowCount = 0 THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_TableUuid := UUID();

        CALL p_system_LockTable('user_users_groups', v_TableId);

        INSERT user_users_groups (_table_id, _table_uuid, _system_valid_from,
            _system_valid_to, _system_is_deleted, _system_is_valid, _system_transaction_uuid,
            _system_previous_id, _system_next_id, users_id, groups_id)
        VALUES (v_TableId, f_UuidToBin(v_TableUuid), UTC_TIMESTAMP(), NULL, 0, 1,
            f_UuidToBin(v_TransactionUuid), NULL, NULL, v_UserId, v_GroupId);

        CALL p_system_UnlockTable('user_users_groups');

        -- Human readable transaction log
        CALL p_system_QuickTranslateString('User assigned to group.', v_TranslatedLogMessage);

        CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
            'user', 'user_users_groups', v_TableId,
            'record_added', v_TranslatedLogMessage, v_TransactionId);

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_FetchGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_FetchGroup`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(_table_uuid) AS '_table_uuid',
        group_name, display_name, description,
        f_BitToOutput(is_active) AS 'is_active'
    FROM user_groups
    WHERE _table_uuid = v_TableUuid AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_FetchUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_FetchUser`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TableUuid BINARY(16);

    IF i_TableUuid = '' OR ISNULL(i_TableUuid) THEN
        SET v_TableUuid := NULL;
    ELSE
        SET v_TableUuid := f_UuidToBin(i_TableUuid);
    END IF;

    SELECT f_BinToUuid(u._table_uuid) AS '_table_uuid',
        f_BinToUuid(t._table_uuid) AS 'global_title_uuid',
        t.name_label AS 'global_title_name_label',
        t.display_label AS 'global_title_display_label',
        u.first_name AS 'first_name',
        u.last_name AS 'last_name',
        u.username AS 'username',
        f_BinToUuid(l._table_uuid) AS 'preferred_global_language_uuid',
        l.name_label AS 'global_preferred_language_name_label',
        l.display_label AS 'preferred_global_language_display_label',
        l.language_code AS 'preferred_global_language_code'
    FROM user_users AS u
        LEFT OUTER JOIN configuration_lookup_global_titles AS t ON t._table_id=u.global_titles_id
            AND t._system_is_valid = 1 AND t._system_is_deleted = 0
        LEFT OUTER JOIN configuration_lookup_global_languages AS l on l._table_id=u.preferred_global_languages_id
            AND l._system_is_valid = 1 AND l._system_is_deleted = 0
    WHERE u._table_uuid = v_TableUuid AND u._system_is_valid = 1 AND u._system_is_deleted = 0
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_ListGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_ListGroup`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM user_groups
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT group_name, display_name, f_BinToUuid(_table_uuid) AS '_table_uuid',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM user_groups
    WHERE _system_is_valid = 1
        AND _system_is_deleted = 0
    ORDER BY group_name;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_ListUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_ListUser`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_TotalCount BIGINT;

    SELECT Count(*) INTO v_TotalCount
    FROM user_users
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0;

    SELECT f_BinToUuid(u._table_uuid) AS '_table_uuid',
        t.name_label AS 'title_label',
        t.display_label AS 'title_display_label',
        f_BinToUuid(t._table_uuid) AS 'title_uuid',
        u.first_name AS 'first_name',
        u.last_name AS 'last_name',
        COALESCE(v_TotalCount, 0) AS '_total_count'
    FROM user_users AS u
        LEFT OUTER JOIN configuration_lookup_global_titles AS t ON t._table_id=u.global_titles_id
            AND t._system_is_valid = 1 AND t._system_is_deleted = 0 AND t.is_active = 1
    WHERE u._system_is_valid = 1 AND u._system_is_deleted = 0
    ORDER BY u.last_name, u.first_name, COALESCE(t.name_label, '');

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_ModifyGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_ModifyGroup`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_GroupName VARCHAR(100) CHARSET utf8,
    IN i_DisplayName VARCHAR(100) CHARSET utf8,
    IN i_Description TEXT CHARSET utf8,
    IN i_IsActive BIT(1))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;

    DECLARE v_old_GroupName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Description TEXT CHARSET utf8;
    DECLARE v_old_IsActive BIT(1);
    DECLARE v_old_DisplayName VARCHAR(100) CHARSET utf8;
    
    SET v_RowCount := (SELECT COUNT(*) FROM user_groups
        WHERE group_name = i_GroupName AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id,
            group_name, display_name, description, is_active
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_GroupName,
            v_old_DisplayName, v_old_Description, v_old_IsActive
        FROM user_groups
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        IF COALESCE(i_GroupName, '') != COALESCE(v_old_GroupName, '')
            OR COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '')
            OR COALESCE(i_Description, '') != COALESCE(v_old_Description, '')
            OR COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT user_groups (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                group_name, display_name, description, is_active)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, i_GroupName, i_DisplayName, i_Description, i_IsActive
            FROM user_groups
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE user_groups SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'user', 0, 'user_groups', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_GroupName, '') != COALESCE(v_old_GroupName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'user_groups', v_TableId, 'group_name', v_old_GroupName,
                    i_GroupName, 'Group Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_DisplayName, '') != COALESCE(v_old_DisplayName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'user_groups', v_TableId, 'display_name', v_old_DisplayName,
                    i_DisplayName, 'Display Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Description, '') != COALESCE(v_old_Description, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'user_groups', v_TableId, 'description', v_old_Description,
                    i_Description, 'Descrption', v_HumanReadable);
            END IF;

            IF COALESCE(i_IsActive, 0) != COALESCE(v_old_IsActive, 0) THEN
                CALL p_system_LogTransactionDetailInteger(v_TransactionId,
                    'user_groups', v_TableId, 'is_active', v_old_IsActive,
                    i_IsActive, 'Is Active', v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_ModifyUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_ModifyUser`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8,
    IN i_GlobalTitleUuid CHAR(36) CHARSET utf8,
    IN i_FirstName VARCHAR(100) CHARSET utf8,
    IN i_LastName VARCHAR(100) CHARSET utf8,
    IN i_Username VARCHAR(50) CHARSET utf8,
    IN i_PreferredGlobalLanguageUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TableId BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_HumanReadable TEXT CHARSET utf8;

    DECLARE v_GlobalTitleId BIGINT;
    DECLARE v_old_GlobalTitleId BIGINT;
    DECLARE v_old_FirstName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_LastName VARCHAR(100) CHARSET utf8;
    DECLARE v_old_Username VARCHAR(50) CHARSET utf8;
    DECLARE v_PreferredGlobalLanguageId BIGINT;
    DECLARE v_old_PreferredGlobalLanguageId BIGINT;
    DECLARE v_PreferredGlobalLanguageLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_PreferredGlobalLanguageLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_GlobalTitleLookupLabel VARCHAR(100) CHARSET utf8;
    DECLARE v_old_GlobalTitleLookupLabel VARCHAR(100) CHARSET utf8;

    SET v_RowCount := (SELECT COUNT(*) FROM user_users
        WHERE username = i_Username AND _system_is_valid = 1 AND _table_uuid != f_UuidToBin(i_TableUuid)
            AND _system_is_deleted = 0);

    IF v_RowCount = 0 THEN
        SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, 
            global_titles_id, first_name, last_name, username,
            preferred_global_languages_id
        INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_old_GlobalTitleId,
            v_old_FirstName, v_old_LastName, v_old_Username,
            v_old_PreferredGlobalLanguageId
        FROM user_users
        WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1
            AND _system_is_deleted = 0
        LIMIT 1;

        SELECT _table_id
        INTO v_GlobalTitleId
        FROM configuration_lookup_global_titles
        WHERE _table_uuid = f_UuidToBin(i_GlobalTitleUuid)
            AND _system_is_valid = 1 AND _system_is_deleted = 0
            AND is_active = 1;

        SELECT _table_id
        INTO v_PreferredGlobalLanguageId
        FROM configuration_lookup_global_languages
        WHERE _table_uuid = f_UuidToBin(i_PreferredGlobalLanguageUuid)
            AND _system_is_valid = 1 AND _system_is_deleted = 0
            AND is_active = 1;

        IF COALESCE(i_FirstName, '') != COALESCE(v_old_FirstName, '')
            OR COALESCE(i_LastName, '') != COALESCE(v_old_LastName, '')
            OR COALESCE(i_Username, '') != COALESCE(v_old_Username, '')
            OR COALESCE(v_GlobalTitleId, 0) != COALESCE(v_old_GlobalTitleId, 0)
            OR COALESCE(v_PreferredGlobalLanguageId, 0) != COALESCE(v_old_PreferredGlobalLanguageId, 0) THEN

            -- There is something to modify.

            IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
                SET v_TransactionUuid := UUID();
            ELSE
                SET v_TransactionUuid := i_TransactionUuid;
            END IF;

            SET v_Timestamp = UTC_TIMESTAMP();

            INSERT user_users (_table_id, _table_uuid,
                _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
                _system_transaction_uuid, _system_previous_id, _system_next_id,
                global_titles_id, first_name, last_name, username,
                preferred_global_languages_id)
            SELECT _table_id, _table_uuid, v_Timestamp, NULL,
                0, 1, v_TransactionUuid, v_SystemPreviousId,
                NULL, v_GlobalTitleId, i_FirstName, i_LastName, i_Username,
                v_PreferredGlobalLanguageId
            FROM user_users
            WHERE _system_auto_id = v_SystemPreviousId;

            SET v_SystemNextId := LAST_INSERT_ID();

            UPDATE user_users SET _system_is_valid = 0,
                _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
            WHERE _system_auto_id = v_SystemPreviousId;

            -- Human readable transaction log
            SET v_HumanReadable := '';        

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'user', 0, 'user_users', v_TableId,
                'record_modified', '', v_TransactionId);

            IF COALESCE(i_FirstName, '') != COALESCE(v_old_FirstName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'user_users', v_TableId, 'first_name', v_old_FirstName,
                    i_FirstName, 'First Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_LastName, '') != COALESCE(v_old_LastName, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'user_users', v_TableId, 'last_name', v_old_LastName,
                    i_LastName, 'Last Name', v_HumanReadable);
            END IF;

            IF COALESCE(i_Username, '') != COALESCE(v_old_Username, '') THEN
                CALL p_system_LogTransactionDetailText(v_TransactionId,
                    'user_users', v_TableId, 'username', v_old_Username,
                    i_Username, 'Username', v_HumanReadable);
            END IF;

            IF COALESCE(v_GlobalTitleId, 0) != COALESCE(v_old_GlobalTitleId, 0) THEN
                SELECT name_label
                INTO v_old_GlobalTitleLookupLabel
                FROM configuration_lookup_global_titles
                WHERE _table_id = v_old_GlobalTitleId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_GlobalTitleLookupLabel
                FROM configuration_lookup_global_titles
                WHERE _table_id = v_GlobalTitleId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'user_users', v_TableId, 'global_titles_id', v_old_GlobalTitleId,
                    v_GlobalTitleId, 'Title', v_old_GlobalTitleLookupLabel,
                    v_GlobalTitleLookupLabel, v_HumanReadable);
            END IF;

            IF COALESCE(v_PreferredGlobalLanguageId, 0) != COALESCE(v_old_PreferredGlobalLanguageId, 0) THEN
                SELECT name_label
                INTO v_old_PreferredGlobalLanguageLookupLabel
                FROM configuration_lookup_global_languages
                WHERE _table_id = v_old_PreferredGlobalLanguageId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                SELECT name_label
                INTO v_PreferredGlobalLanguageLookupLabel
                FROM configuration_lookup_global_languages
                WHERE _table_id = v_PreferredGlobalLanguageId AND _system_is_valid = 1 AND _system_is_deleted = 0
                LIMIT 1;

                CALL p_system_LogTransactionDetailLookup(v_TransactionId,
                    'user_users', v_TableId, 'preferred_global_languages_id', v_old_PreferredGlobalLanguageId,
                    v_PreferredGlobalLanguageId, 'Title', v_old_PreferredGlobalLanguageLookupLabel,
                    v_PreferredGlobalLanguageLookupLabel, v_HumanReadable);
            END IF;

            CALL p_system_LogTransactionHumanHeadable(v_TransactionId, v_HumanReadable);
 
        END IF;

        SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_RemoveGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_RemoveGroup`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM user_groups
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM user_users_groups
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND groups_id = v_TableId;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT user_groups (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            group_name, display_name, description, is_active)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, group_name, display_name, description, is_active
        FROM user_groups
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE user_groups SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'user', 0, 'user_groups', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_RemoveUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_RemoveUser`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UsedCount BIGINT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId
    FROM user_users
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    SELECT COUNT(*)
    INTO v_UsedCount
    FROM user_users_groups
    WHERE _system_is_valid = 1 AND _system_is_deleted = 0
        AND users_id = v_TableId;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM user_users_credentials
        WHERE _system_is_valid = 1 AND _system_is_deleted = 0
            AND users_id = v_TableId;
    END IF;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM user_users_permissions
        WHERE _system_is_valid = 1 AND _system_is_deleted = 0
            AND users_id = v_TableId;
    END IF;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM user_users_roles
        WHERE _system_is_valid = 1 AND _system_is_deleted = 0
            AND users_id = v_TableId;
    END IF;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM system_log_messages
        WHERE users_id = v_TableId;
    END IF;

    IF v_UsedCount = 0 THEN
        SELECT COUNT(*)
        INTO v_UsedCount
        FROM system_log_transactions
        WHERE users_id = v_TableId;
    END IF;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '' AND v_UsedCount = 0) THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT user_users (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            global_titles_id, first_name, last_name, username, preferred_global_languages_id)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, global_titles_id, first_name, last_name, username, preferred_global_languages_id
        FROM user_users
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE user_users SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'user', v_Table_Id, 'user_users', v_TableId,
                'record_removed', '', v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_user_RemoveUserGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_user_RemoveUserGroup`(IN i_SessionUuid CHAR(36) CHARSET utf8,
    IN i_TransactionUuid CHAR(36) CHARSET utf8,
    IN i_TableUuid CHAR(36) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
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

    DECLARE v_RowCount BIGINT;
    DECLARE v_TransactionUuid CHAR(36) CHARSET utf8;
    DECLARE v_TransactionId BIGINT;
    DECLARE v_TableUuid CHAR(36) CHARSET utf8;
    DECLARE v_TableId BIGINT;
    DECLARE v_SystemPreviousId BIGINT;
    DECLARE v_SystemNextId BIGINT;
    DECLARE v_Timestamp DATETIME;
    DECLARE v_UserId BIGINT;
    DECLARE v_TranslatedLogMessage TEXT;

    SELECT f_BinToUuid(_table_uuid), _table_id, _system_auto_id, users_id
    INTO v_TableUuid, v_TableId, v_SystemPreviousId, v_UserId
    FROM user_users_groups
    WHERE _table_uuid = f_UuidToBin(i_TableUuid) AND _system_is_valid = 1 AND _system_is_deleted = 0
    LIMIT 1;

    IF NOT (ISNULL(v_TableUuid) AND v_TableUuid = '') THEN
        IF i_TransactionUuid = '' OR ISNULL(i_TransactionUuid) THEN
            SET v_TransactionUuid := UUID();
        ELSE
            SET v_TransactionUuid := i_TransactionUuid;
        END IF;

        SET v_Timestamp = UTC_TIMESTAMP();
 
        INSERT user_users_groups (_table_id, _table_uuid,
            _system_valid_from, _system_valid_to, _system_is_deleted, _system_is_valid,
            _system_transaction_uuid, _system_previous_id, _system_next_id,
            groups_id, users_id)
        SELECT _table_id, _table_uuid, v_Timestamp, NULL,
            1, 1, v_TransactionUuid, v_SystemPreviousId,
            NULL, groups_id, users_id
        FROM user_users_groups
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_SystemNextId := LAST_INSERT_ID();

        UPDATE user_users_groups SET _system_is_valid = 0,
            _system_valid_to = v_Timestamp, _system_next_id = v_SystemNextId
        WHERE _system_auto_id = v_SystemPreviousId;

        SET v_RowCount := ROW_COUNT();

        IF v_RowCount > 0 THEN
            -- Human readable transaction log
            CALL p_system_QuickTranslateString('User removed from group.', v_TranslatedLogMessage);

            CALL p_system_LogTransaction(i_SessionUuid, v_TransactionUuid,
                'user', v_UserId, 'user_users_groups', v_TableId,
                'record_removed', v_TranslatedLogMessage, v_TransactionId);

            SELECT v_TableId AS '_table_id', v_TableUuid AS '_table_uuid';
        ELSE
            SELECT 0 AS '_table_id', NULL AS '_table_uuid';
        END IF;
    ELSE
        SELECT 0 AS '_table_id', NULL AS '_table_uuid';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-29  8:54:04
