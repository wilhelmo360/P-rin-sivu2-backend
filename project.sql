-- MySQL Script generated by MySQL Workbench
-- Tue May 14 22:40:56 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 ;
USE `project` ;

-- -----------------------------------------------------
-- Table `project`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`users` (
  `user_id` INT(11) NOT NULL,
  `nick_name` VARCHAR(45) NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `passwrd` VARCHAR(45) NOT NULL,
  `admin_value` INT(11) NOT NULL,
  `TS` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `project`.`pictures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`pictures` (
  `pic_id` INT(11) NOT NULL,
  `post_id` INT(11) NOT NULL,
  `filename+picture` BLOB NOT NULL,
  `TS` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`pic_id`),
  INDEX `fk_userspics` (`post_id` ASC),
  CONSTRAINT `fk_userspics`
    FOREIGN KEY (`post_id`)
    REFERENCES `project`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `project`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`posts` (
  `post_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `pic_id` INT(11) NOT NULL,
  `likes` INT(11) NOT NULL,
  `text` VARCHAR(45) NULL DEFAULT NULL,
  `comments` VARCHAR(45) NULL DEFAULT NULL,
  `nick_name` VARCHAR(45) NOT NULL,
  `TS` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`post_id`),
  INDEX `fk_USERPOSTS` (`user_id` ASC),
  INDEX `fk_likesposts` (`likes` ASC),
  INDEX `fk_picsposts` (`pic_id` ASC),
  CONSTRAINT `fk_USERPOSTS`
    FOREIGN KEY (`user_id`)
    REFERENCES `project`.`users` (`user_id`),
  CONSTRAINT `fk_likesposts`
    FOREIGN KEY (`likes`)
    REFERENCES `project`.`likes` (`amount`),
  CONSTRAINT `fk_picsposts`
    FOREIGN KEY (`pic_id`)
    REFERENCES `project`.`pictures` (`pic_id`),
  CONSTRAINT `posts_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `project`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `project`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`likes` (
  `post_id` INT(11) NOT NULL,
  `amount` INT(11) NOT NULL,
  PRIMARY KEY (`amount`),
  INDEX `fk_userslikes` (`post_id` ASC),
  CONSTRAINT `fk_userslikes`
    FOREIGN KEY (`post_id`)
    REFERENCES `project`.`posts` (`post_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
