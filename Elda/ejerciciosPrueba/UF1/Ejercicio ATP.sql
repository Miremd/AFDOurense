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
-- Table `mydb`.`Tenistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tenistas` (
  `idTenistas` INT NOT NULL,
  `nombreTenista` VARCHAR(45) NULL,
  `fechaNacimientoTenista` VARCHAR(45) NULL,
  `sexoTenista` VARCHAR(45) NULL,
  `nacionalidadTenista` VARCHAR(45) NULL,
  PRIMARY KEY (`idTenistas`),
  UNIQUE INDEX `idTenistas_UNIQUE` (`idTenistas` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Torneos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Torneos` (
  `nombreTorneo` INT NOT NULL,
  `paisTorneo` VARCHAR(45) NULL,
  `númeroParticipantesTorneo` VARCHAR(45) NULL,
  PRIMARY KEY (`nombreTorneo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tenistas_has_Torneos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tenistas_has_Torneos` (
  `Tenistas_idTenistas` INT NOT NULL,
  `Torneos_nombreTorneo` INT NOT NULL,
  `puestoTorneoTenista` VARCHAR(45) NULL,
  PRIMARY KEY (`Tenistas_idTenistas`, `Torneos_nombreTorneo`),
  INDEX `fk_Tenistas_has_Torneos_Torneos1_idx` (`Torneos_nombreTorneo` ASC) VISIBLE,
  INDEX `fk_Tenistas_has_Torneos_Tenistas_idx` (`Tenistas_idTenistas` ASC) VISIBLE,
  CONSTRAINT `fk_Tenistas_has_Torneos_Tenistas`
    FOREIGN KEY (`Tenistas_idTenistas`)
    REFERENCES `mydb`.`Tenistas` (`idTenistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tenistas_has_Torneos_Torneos1`
    FOREIGN KEY (`Torneos_nombreTorneo`)
    REFERENCES `mydb`.`Torneos` (`nombreTorneo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
