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
-- Table `mydb`.`TENISTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TENISTAS` (
  `idTENISTAS` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `fecha` VARCHAR(45) NULL,
  `sexo` VARCHAR(45) NULL,
  `nacionalidad` VARCHAR(45) NULL,
  `diestro/zurdo` VARCHAR(45) NULL,
  PRIMARY KEY (`idTENISTAS`),
  UNIQUE INDEX `idTENISTAS_UNIQUE` (`idTENISTAS` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TORNEOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TORNEOS` (
  `nombreTorneo` INT NOT NULL,
  `paisTorneo` VARCHAR(45) NULL,
  `nªparticipantes` VARCHAR(45) NULL,
  `recaudacionEstimada` VARCHAR(45) NULL,
  PRIMARY KEY (`nombreTorneo`),
  UNIQUE INDEX `nombreTorneo_UNIQUE` (`nombreTorneo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TENISTAS_has_TORNEOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TENISTAS_has_TORNEOS` (
  `TENISTAS_idTENISTAS` INT NOT NULL,
  `TORNEOS_nombreTorneo` INT NOT NULL,
  `PuestoTorneo` VARCHAR(45) NULL,
  `TENISTAS_has_TORNEOScol` VARCHAR(45) NULL,
  PRIMARY KEY (`TENISTAS_idTENISTAS`, `TORNEOS_nombreTorneo`),
  INDEX `fk_TENISTAS_has_TORNEOS_TORNEOS1_idx` (`TORNEOS_nombreTorneo` ASC) VISIBLE,
  INDEX `fk_TENISTAS_has_TORNEOS_TENISTAS_idx` (`TENISTAS_idTENISTAS` ASC) VISIBLE,
  CONSTRAINT `fk_TENISTAS_has_TORNEOS_TENISTAS`
    FOREIGN KEY (`TENISTAS_idTENISTAS`)
    REFERENCES `mydb`.`TENISTAS` (`idTENISTAS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TENISTAS_has_TORNEOS_TORNEOS1`
    FOREIGN KEY (`TORNEOS_nombreTorneo`)
    REFERENCES `mydb`.`TORNEOS` (`nombreTorneo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
