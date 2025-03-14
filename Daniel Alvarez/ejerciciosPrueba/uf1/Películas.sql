-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Distribuidoras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Distribuidoras` (
  `códigoDistribuidora` INT NOT NULL,
  `CIF` VARCHAR(45) NULL,
  `nombreDistribuidora` VARCHAR(45) NULL,
  `dirección` VARCHAR(45) NULL,
  `teléfono` VARCHAR(45) NULL,
  PRIMARY KEY (`códigoDistribuidora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Películas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Películas` (
  `códigoPelícula` INT NOT NULL,
  `título` VARCHAR(45) NULL,
  `tema` VARCHAR(45) NULL,
  `nombrePelícula` VARCHAR(45) NULL,
  `director` VARCHAR(45) NULL,
  `Distribuidoras_códigoDistribuidora` INT NOT NULL,
  PRIMARY KEY (`códigoPelícula`),
  INDEX `fk_Películas_Distribuidoras_idx` (`Distribuidoras_códigoDistribuidora` ASC) VISIBLE,
  CONSTRAINT `fk_Películas_Distribuidoras`
    FOREIGN KEY (`Distribuidoras_códigoDistribuidora`)
    REFERENCES `mydb`.`Distribuidoras` (`códigoDistribuidora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Actores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Actores` (
  `nombreArtístico` INT NOT NULL,
  `nacionalidad` VARCHAR(45) NULL,
  `premios` VARCHAR(45) NULL,
  PRIMARY KEY (`nombreArtístico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Películas_has_Actores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Películas_has_Actores` (
  `Películas_códigoPelícula` INT NOT NULL,
  `Actores_nombreArtístico` INT NOT NULL,
  PRIMARY KEY (`Películas_códigoPelícula`, `Actores_nombreArtístico`),
  INDEX `fk_Películas_has_Actores_Actores1_idx` (`Actores_nombreArtístico` ASC) VISIBLE,
  INDEX `fk_Películas_has_Actores_Películas1_idx` (`Películas_códigoPelícula` ASC) VISIBLE,
  CONSTRAINT `fk_Películas_has_Actores_Películas1`
    FOREIGN KEY (`Películas_códigoPelícula`)
    REFERENCES `mydb`.`Películas` (`códigoPelícula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Películas_has_Actores_Actores1`
    FOREIGN KEY (`Actores_nombreArtístico`)
    REFERENCES `mydb`.`Actores` (`nombreArtístico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
