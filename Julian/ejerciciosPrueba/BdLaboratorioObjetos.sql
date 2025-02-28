-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BDlaboratoriObjetos
-- -----------------------------------------------------
-- Se desea diseñar una base de datos para almacenar información sobre objetos que se encuentran en un
-- laboratorio. De cada objeto nos interesa saber: el código de objeto, el precio del objeto, el nivel de importancia
-- del objeto, el ancho y el alto de cada uno.
-- Se considera que cada objeto es único, varios objetos del mismo tipo (matraces de 250 ml, por ejemplo),
-- tendrán cada uno un identificador diferente.
-- Cada objeto está en un único laboratorio. De cada laboratorio nos interesa saber, el número de laboratorio (que
-- es único), los metros cuadrados que tiene y el número de mesas que hay en el mismo.
DROP SCHEMA IF EXISTS `BDlaboratoriObjetos` ;

-- -----------------------------------------------------
-- Schema BDlaboratoriObjetos
--
-- Se desea diseñar una base de datos para almacenar información sobre objetos que se encuentran en un
-- laboratorio. De cada objeto nos interesa saber: el código de objeto, el precio del objeto, el nivel de importancia
-- del objeto, el ancho y el alto de cada uno.
-- Se considera que cada objeto es único, varios objetos del mismo tipo (matraces de 250 ml, por ejemplo),
-- tendrán cada uno un identificador diferente.
-- Cada objeto está en un único laboratorio. De cada laboratorio nos interesa saber, el número de laboratorio (que
-- es único), los metros cuadrados que tiene y el número de mesas que hay en el mismo.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDlaboratoriObjetos` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `BDlaboratoriObjetos` ;

-- -----------------------------------------------------
-- Table `BDlaboratoriObjetos`.`centros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDlaboratoriObjetos`.`centros` (
  `idcentros` INT NOT NULL AUTO_INCREMENT,
  `nombreCentro` VARCHAR(45) NULL,
  `calleCentro` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `codPostal` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  PRIMARY KEY (`idcentros`),
  UNIQUE INDEX `idcentros_UNIQUE` (`idcentros` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDlaboratoriObjetos`.`laboratorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDlaboratoriObjetos`.`laboratorios` (
  `numLaboratorio` INT NOT NULL AUTO_INCREMENT,
  `metrosCuadrados` VARCHAR(45) NULL,
  `numMesas` VARCHAR(45) NULL,
  `centros_idcentros` INT NOT NULL,
  PRIMARY KEY (`numLaboratorio`, `centros_idcentros`),
  UNIQUE INDEX `numLaboratorio_UNIQUE` (`numLaboratorio` ASC) VISIBLE,
  INDEX `fk_laboratorios_centros1_idx` (`centros_idcentros` ASC) VISIBLE,
  CONSTRAINT `fk_laboratorios_centros1`
    FOREIGN KEY (`centros_idcentros`)
    REFERENCES `BDlaboratoriObjetos`.`centros` (`idcentros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDlaboratoriObjetos`.`TipoObjeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDlaboratoriObjetos`.`TipoObjeto` (
  `idTipoObjeto` INT NOT NULL AUTO_INCREMENT,
  `Cantidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoObjeto`),
  UNIQUE INDEX `idTipoObjeto_UNIQUE` (`idTipoObjeto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDlaboratoriObjetos`.`objetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDlaboratoriObjetos`.`objetos` (
  `codObjeto` INT NOT NULL AUTO_INCREMENT,
  `precioObjeto` FLOAT NULL,
  `nivelImportancia` VARCHAR(45) NULL,
  `alto` VARCHAR(45) NULL,
  `ancho` VARCHAR(45) NULL,
  `laboratorios_numLaboratorio` INT NOT NULL,
  `TipoObjeto_idTipoObjeto` INT NOT NULL,
  PRIMARY KEY (`codObjeto`, `laboratorios_numLaboratorio`, `TipoObjeto_idTipoObjeto`),
  UNIQUE INDEX `codObjeto_UNIQUE` (`codObjeto` ASC) VISIBLE,
  INDEX `fk_objetos_laboratorios_idx` (`laboratorios_numLaboratorio` ASC) VISIBLE,
  INDEX `fk_objetos_TipoObjeto1_idx` (`TipoObjeto_idTipoObjeto` ASC) VISIBLE,
  CONSTRAINT `fk_objetos_laboratorios`
    FOREIGN KEY (`laboratorios_numLaboratorio`)
    REFERENCES `BDlaboratoriObjetos`.`laboratorios` (`numLaboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_objetos_TipoObjeto1`
    FOREIGN KEY (`TipoObjeto_idTipoObjeto`)
    REFERENCES `BDlaboratoriObjetos`.`TipoObjeto` (`idTipoObjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
