DROP DATABASE IF EXISTS `onmart`;

CREATE DATABASE `onmart`;

CREATE TABLE IF NOT EXISTS `onmart`.`product`(
	`id`  INT(11) PRIMARY KEY AUTO_INCREMENT, -- ProductID (*)
	`img_url` VARCHAR(256) NULL, -- Image
	`provider_id` INT(11), -- ProviderName 
	`amount` DECIMAL(20,5) NOT NULL, -- Amount
	`price` INT(11) NOT NULL, -- Price
	`description` VARCHAR(1024) NULL, -- Description
	`status` TINYINT(1) DEFAULT 0, -- Status
    `imported_date` TIMESTAMP(6) NOT NULL, -- ImportedDate
	`expired_date` TIMESTAMP(6) NULL, -- ExpiredDate
	`created_timestamp` TIMESTAMP(6) NULL,
	`last_updated_timestamp` TIMESTAMP(6) NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `onmart`.`user`(
	`id`  INT(11) PRIMARY KEY AUTO_INCREMENT, -- UsserID (*)
	`user_name` VARCHAR(256) NOT NULL, -- UserName
	`email` VARCHAR(256) NOT NULL, -- Email
	`mobile_number` VARCHAR(20) NOT NULL, -- MobileNumber
	`status` TINYINT(1) DEFAULT 0, -- Status
	`user_type` TINYINT(1), -- UserType
	`created_timestamp` TIMESTAMP(6) NULL,
	`last_updated_timestamp` TIMESTAMP(6) NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `onmart`.`wallet`(
	`id`  INT(11) PRIMARY KEY AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL, -- UserID
	`mobile_number` VARCHAR(20) NOT NULL, -- MobileNumber
	`email` VARCHAR(256) NULL, -- Email
	`thai_id` VARCHAR(20) NULL, -- ThaiID
	`password` VARCHAR(30) NULL, -- Password
	`first_name` VARCHAR(20) NULL, -- Firstname
	`last_name` VARCHAR(20) NULL, -- LastName
	`address` VARCHAR(256) NULL, -- Address
	`postal_code` VARCHAR(20) NULL, -- PostalCode
	`occupation` VARCHAR(30) NULL, -- Occupation
	`channel_id` VARCHAR(20) NULL, -- ChannelID
	`error_message` VARCHAR(256), -- ErrorMessage
	`created_timestamp` TIMESTAMP(6) NULL,
	`last_updated_timestamp` TIMESTAMP(6) NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `onmart`.`order`(
	`id`  INT(11) PRIMARY KEY AUTO_INCREMENT, -- OrerID
	`status` TINYINT(1) NOT NULL, -- Status
	`total_amount` DECIMAL(25,5), -- Total Amount
	`state` TINYINT(1), -- State
	`user_id` INT(11) NOT NULL, -- UserID
	`created_timestamp` TIMESTAMP(6) NULL,
	`last_updated_timestamp` TIMESTAMP(6) NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `onmart`.`order_item`(
	`id`  INT(11) PRIMARY KEY AUTO_INCREMENT, -- OrderItemID
	`order_id` INT(11) NOT NULL, -- OrderID
	`product_id` INT(11) NOT NULL, -- ProductID
	`quantity` DECIMAL(15,5) NOT NULL, -- Quantity
	`created_timestamp` TIMESTAMP(6) NULL,
	`last_updated_timestamp` TIMESTAMP(6) NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `onmart`.`payment_history`(
	`id`  INT(11) PRIMARY KEY AUTO_INCREMENT, -- PaymentHistoryID
	`user_id` INT(11) NOT NULL, -- UserID
	`wallet_id` INT(11) NOT NULL, -- WalletID
	`total_amount` DECIMAL(25,5) NOT NULL, -- Total Amount
	`status` TINYINT(1) NOT NULL, -- Status
	`created_timestamp` TIMESTAMP(6) NULL,
	`last_updated_timestamp` TIMESTAMP(6) NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `onmart`.`delivery_order`(
	`id`  INT(11) PRIMARY KEY AUTO_INCREMENT, -- Deliver ID
	`order_id` INT(11) NOT NULL, -- OrderID
	`user_id` INT(11) NOT NULL, -- UserID
	`created_timestamp` TIMESTAMP(6) NULL,
	`last_updated_timestamp` TIMESTAMP(6) NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------------------------------------------------------
-- CREATE INITIAL USERS, PRODUCTS...
-- --------------------------------------------------------------------------------------------------------
SET @USER_ADMIN=1;
SET @USER_CUSTOMER=2;
SET @USER_PROVIDER:=3;
SET @USER_TRANSPORTER:=4;
INSERT INTO `onmart`.`user` (`user_name`, `email`, `mobile_number`, `user_type`, `created_timestamp`, `last_updated_timestamp`) VALUES ('admin', 'admin@onmart.com', '19008686', @USER_ADMIN, now(), now());
INSERT INTO `onmart`.`user` (`user_name`, `email`, `mobile_number`, `user_type`, `created_timestamp`, `last_updated_timestamp`) VALUES ('customer', 'customer@onmart.com', '0987654321', @USER_CUSTOMER, now(), now());
INSERT INTO `onmart`.`user` (`user_name`, `email`, `mobile_number`, `user_type`, `created_timestamp`, `last_updated_timestamp`) VALUES ('provider', 'provider@onmart.com', '0987651234', @USER_PROVIDER, now(), now());
INSERT INTO `onmart`.`user` (`user_name`, `email`, `mobile_number`, `user_type`, `created_timestamp`, `last_updated_timestamp`) VALUES ('transporter', 'transporter@onmart.com', '0987658686', @USER_TRANSPORTER, now(), now());


