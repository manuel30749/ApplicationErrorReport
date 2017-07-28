/*
 * 
 * Application Error Log
 * 
 * */

DROP TABLE IF EXISTS `test`.`error_catalog`; 
CREATE TABLE `test`.`error_catalog` (
	`idError` INT(11) NOT NULL AUTO_INCREMENT,
	`description` VARCHAR(250) NOT NULL,
	PRIMARY KEY (`idError`)
);

DROP TABLE IF EXISTS `test`.`app_catalog`; 
CREATE TABLE `test`.`app_catalog` (
	`idApp` INT(11) NOT NULL AUTO_INCREMENT,
	`app` VARCHAR(100) NOT NULL,
	`status` BOOLEAN NOT NULL,
	PRIMARY KEY (`idApp`)
);

DROP TABLE IF EXISTS `test`.`log`;
CREATE TABLE `test`.`log` (
	`idLog` INT(11) NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(50) NOT NULL,
	`idApp` INT(11) NOT NULL,
	`idError` INT(11) NOT NULL,
	`timestamp` TIMESTAMP(100) NOT NULL,
	PRIMARY KEY (`idLog`)
);

ALTER TABLE `log` ADD CONSTRAINT `log_fk0` FOREIGN KEY (`idApp`) REFERENCES `app_catalog`(`idApp`);

ALTER TABLE `log` ADD CONSTRAINT `log_fk1` FOREIGN KEY (`idError`) REFERENCES `error_catalog`(`idError`);


INSERT INTO error_catalog (description) VALUES ("No internet connection.");
INSERT INTO error_catalog (description) VALUES ("Page not found.");
INSERT INTO error_catalog (description) VALUES ("Proxy error.");

INSERT INTO app_catalog (app) VALUES ("Mozilla Firefox.");
INSERT INTO app_catalog (app) VALUES ("Internet Explorer.");
INSERT INTO app_catalog (app) VALUES ("Google Chrome.");

