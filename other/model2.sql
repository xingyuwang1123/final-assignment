-- MySQL Script generated by MySQL Workbench
-- 06/13/18 11:13:07
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema site
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema site
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `site` DEFAULT CHARACTER SET utf8 ;
USE `site` ;

-- -----------------------------------------------------
-- Table `site`.`auth_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`auth_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`django_content_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`django_content_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label` ASC, `model` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`auth_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`auth_permission` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT(11) NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id` ASC, `codename` ASC),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `site`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 49
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`auth_group_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`auth_group_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `group_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id` ASC, `permission_id` ASC),
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id` ASC),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `site`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `site`.`auth_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`auth_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`auth_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME(6) NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`auth_user_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`auth_user_groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `group_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id` ASC, `group_id` ASC),
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id` ASC),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `site`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `site`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`auth_user_user_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`auth_user_user_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id` ASC, `permission_id` ASC),
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id` ASC),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `site`.`auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `site`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`goods` (
  `gid` CHAR(15) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(1500) NULL DEFAULT NULL,
  `type` VARCHAR(15) NULL DEFAULT NULL,
  `price` INT(11) NOT NULL,
  `pic_route` VARCHAR(50) NULL DEFAULT NULL,
  `included_date` DATE NULL DEFAULT NULL,
  `pic_route2` VARCHAR(50) NULL DEFAULT NULL,
  `store` INT(11) NULL DEFAULT NULL,
  `detail_pic` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`gid`),
  UNIQUE INDEX `gid` (`gid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`user` (
  `uid` CHAR(15) NOT NULL,
  `password` VARCHAR(18) NOT NULL,
  `included_date` DATETIME NULL DEFAULT NULL,
  `email_address` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE INDEX `uid` (`uid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`cart` (
  `uid` CHAR(15) NOT NULL,
  `gid` CHAR(15) NOT NULL,
  `amount` INT(11) NOT NULL,
  `id` CHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uid` (`uid` ASC, `gid` ASC),
  INDEX `gid` (`gid` ASC),
  CONSTRAINT `cart_ibfk_1`
    FOREIGN KEY (`gid`)
    REFERENCES `site`.`goods` (`gid`),
  CONSTRAINT `cart_ibfk_2`
    FOREIGN KEY (`uid`)
    REFERENCES `site`.`user` (`uid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`collection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`collection` (
  `uid` CHAR(15) NOT NULL,
  `gid` CHAR(15) NOT NULL,
  `amount` INT(11) NOT NULL,
  `id` CHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uid` (`uid` ASC, `gid` ASC),
  INDEX `gid` (`gid` ASC),
  CONSTRAINT `collection_ibfk_1`
    FOREIGN KEY (`uid`)
    REFERENCES `site`.`user` (`uid`),
  CONSTRAINT `collection_ibfk_2`
    FOREIGN KEY (`gid`)
    REFERENCES `site`.`goods` (`gid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`commit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`commit` (
  `uid` CHAR(15) NOT NULL,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  `email` VARCHAR(20) NULL DEFAULT NULL,
  `text` CHAR(100) NULL DEFAULT NULL,
  `id` CHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`django_admin_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`django_admin_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME(6) NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT(5) UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id` ASC),
  INDEX `django_admin_log_user_id_c564eba6_fk` (`user_id` ASC),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `site`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `site`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`django_migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`django_migrations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`django_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_expire_date_a5c62663` (`expire_date` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`gorder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`gorder` (
  `oid` CHAR(15) NOT NULL,
  `gid` CHAR(15) NOT NULL,
  `uid` CHAR(15) NOT NULL,
  `included_date` DATE NULL DEFAULT NULL,
  `amount` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE INDEX `oid` (`oid` ASC),
  INDEX `gid` (`gid` ASC),
  INDEX `uid` (`uid` ASC),
  CONSTRAINT `gorder_ibfk_1`
    FOREIGN KEY (`gid`)
    REFERENCES `site`.`goods` (`gid`),
  CONSTRAINT `gorder_ibfk_2`
    FOREIGN KEY (`uid`)
    REFERENCES `site`.`user` (`uid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `site`.`super_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site`.`super_user` (
  `username` VARCHAR(18) NOT NULL,
  `password` VARCHAR(18) NOT NULL,
  UNIQUE INDEX `username` (`username` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;