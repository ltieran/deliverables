-- MySQL Script generated by MySQL Workbench
-- Wed Sep  4 15:23:27 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(20) NOT NULL,
  `prenom` VARCHAR(20) NOT NULL,
  `date_de_naissance` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `num_tel` INT UNSIGNED NOT NULL,
  `adresse` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_client`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`livres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`livres` (
  `id_livre` INT NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(45) NOT NULL,
  `auteur` VARCHAR(20) NOT NULL,
  `genre` VARCHAR(20) NOT NULL,
  `nombre_page` INT UNSIGNED NOT NULL,
  `editeur` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_livre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`emprunts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`emprunts` (
  `id_emprunt` INT NOT NULL AUTO_INCREMENT,
  `id_livre` INT NOT NULL,
  `id_client` INT NOT NULL,
  `date_emprunt` DATE NOT NULL,
  `date_retour` DATE NOT NULL,
  PRIMARY KEY (`id_emprunt`),
  INDEX `id_client_idx` (`id_client` ASC),
  INDEX `id_livre_idx` (`id_livre` ASC),
  CONSTRAINT `id_client`
    FOREIGN KEY (`id_client`)
    REFERENCES `mydb`.`clients` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_livre`
    FOREIGN KEY (`id_livre`)
    REFERENCES `mydb`.`livres` (`id_livre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;