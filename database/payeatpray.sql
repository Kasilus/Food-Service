-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Schema payeatpray
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema payeatpray
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `payeatpray` DEFAULT CHARACTER SET utf8 ;
USE `payeatpray` ;

-- -----------------------------------------------------
-- Table `payeatpray`.`actiontype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`actiontype` (
  `id` INT(11) NOT NULL,
  `name` CHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`order` (
  `id` INT(11) NOT NULL,
  `creationdate` DATE NULL DEFAULT NULL,
  `deliverytime` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`orderstate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`orderstate` (
  `id` INT(11) NOT NULL,
  `name` CHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `registertime` TIMESTAMP NULL DEFAULT NULL,
  `sex` ENUM('M', 'F') NULL DEFAULT NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`actions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`actions` (
  `id` INT(11) NOT NULL,
  `actiondate` DATE NULL DEFAULT NULL,
  `Actionscol` VARCHAR(45) NULL DEFAULT NULL,
  `Profiles_id` INT(11) NOT NULL,
  `Order_id` INT(11) NOT NULL,
  `ActionType_id` INT(11) NOT NULL,
  `OrderState_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Actions_Profiles1_idx` (`Profiles_id` ASC),
  INDEX `fk_Actions_Order1_idx` (`Order_id` ASC),
  INDEX `fk_Actions_ActionType1_idx` (`ActionType_id` ASC),
  INDEX `fk_Actions_OrderState1_idx` (`OrderState_id` ASC),
  CONSTRAINT `fk_Actions_ActionType1`
    FOREIGN KEY (`ActionType_id`)
    REFERENCES `payeatpray`.`actiontype` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actions_Order1`
    FOREIGN KEY (`Order_id`)
    REFERENCES `payeatpray`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actions_OrderState1`
    FOREIGN KEY (`OrderState_id`)
    REFERENCES `payeatpray`.`orderstate` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actions_Profiles1`
    FOREIGN KEY (`Profiles_id`)
    REFERENCES `payeatpray`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`category` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`characteristictype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`characteristictype` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`feedbacktypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`feedbacktypes` (
  `id` INT(11) NOT NULL,
  `name` CHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`feedbacks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`feedbacks` (
  `id` INT(11) NOT NULL,
  `text` MEDIUMTEXT NULL DEFAULT NULL,
  `mark` INT(11) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL,
  `acceptor` INT(11) NOT NULL,
  `FeedbackTypes_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_feedbacks_Profiles1_idx` (`creator` ASC),
  INDEX `fk_feedbacks_Profiles2_idx` (`acceptor` ASC),
  INDEX `fk_Feedbacks_FeedbackTypes1_idx` (`FeedbackTypes_id` ASC),
  CONSTRAINT `fk_Feedbacks_FeedbackTypes1`
    FOREIGN KEY (`FeedbackTypes_id`)
    REFERENCES `payeatpray`.`feedbacktypes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_feedbacks_Profiles1`
    FOREIGN KEY (`creator`)
    REFERENCES `payeatpray`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_feedbacks_Profiles2`
    FOREIGN KEY (`acceptor`)
    REFERENCES `payeatpray`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`goods` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`meal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`meal` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `weight` INT(11) NULL DEFAULT NULL,
  `cost` INT(11) NOT NULL,
  `category_id` INT(11) NOT NULL,
  `restaurant_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`offers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`offers` (
  `id` INT(11) NOT NULL,
  `price` INT(11) NULL DEFAULT NULL,
  `creationDate` DATE NULL DEFAULT NULL,
  `Profiles_id` INT(11) NOT NULL,
  `goods_name` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `Profiles_id`, `goods_name`),
  INDEX `fk_Offers_Profiles2_idx` (`Profiles_id` ASC),
  INDEX `fk_Offers_goods1_idx` (`goods_name` ASC),
  CONSTRAINT `fk_Offers_Profiles2`
    FOREIGN KEY (`Profiles_id`)
    REFERENCES `payeatpray`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Offers_goods1`
    FOREIGN KEY (`goods_name`)
    REFERENCES `payeatpray`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`positions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`positions` (
  `id` INT(11) NOT NULL,
  `count` INT(11) NULL DEFAULT NULL,
  `goods_name` INT(11) NOT NULL,
  `Order_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `goods_name`, `Order_id`),
  INDEX `fk_Positions_goods1_idx` (`goods_name` ASC),
  INDEX `fk_Positions_Order1_idx` (`Order_id` ASC),
  CONSTRAINT `fk_Positions_Order1`
    FOREIGN KEY (`Order_id`)
    REFERENCES `payeatpray`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Positions_goods1`
    FOREIGN KEY (`goods_name`)
    REFERENCES `payeatpray`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`restaurant_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`restaurant_type` (
  `type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`restaurant` (
  `user_id` INT(11) NOT NULL,
  `type_id` INT(11) NOT NULL,
  `description` VARCHAR(5000) NULL DEFAULT NULL,
  `image` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `type_idx` (`type_id` ASC),
  CONSTRAINT `type_fk`
    FOREIGN KEY (`type_id`)
    REFERENCES `payeatpray`.`restaurant_type` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`role` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`specifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`specifications` (
  `id` INT(11) NOT NULL,
  `value` INT(11) NULL DEFAULT NULL,
  `goods_name` INT(11) NOT NULL,
  `CharacteristicType_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Specifications_goods1_idx` (`goods_name` ASC),
  INDEX `fk_Specifications_CharacteristicType1_idx` (`CharacteristicType_id` ASC),
  CONSTRAINT `fk_Specifications_CharacteristicType1`
    FOREIGN KEY (`CharacteristicType_id`)
    REFERENCES `payeatpray`.`characteristictype` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Specifications_goods1`
    FOREIGN KEY (`goods_name`)
    REFERENCES `payeatpray`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payeatpray`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payeatpray`.`user_role` (
  `user_id` INT(11) NOT NULL,
  `role_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  INDEX `role_id_idx` (`role_id` ASC),
  CONSTRAINT `role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `payeatpray`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `payeatpray`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
