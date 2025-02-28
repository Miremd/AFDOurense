-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bdAVIONES-VUELOS
-- -----------------------------------------------------
--  Una compañía aérea quiere almacenar información referente a sus vuelos. Un vuelo se identifica por una clave de 
-- vuelo que es única. Además tiene su fecha de salida, la hora de salida, la hora de embarque y la ciudad origen y 
-- destino a la que vuela. También se quiere saber qué avión realiza el vuelo. Del avión se tiene su código 
-- identificativo único (matrícula), el tipo de avión y el número de pasajeros. Cada vuelo será realizado 
-- exclusivamente por un avión
DROP SCHEMA IF EXISTS `bdAVIONES-VUELOS` ;

-- -----------------------------------------------------
-- Schema bdAVIONES-VUELOS
--
--  Una compañía aérea quiere almacenar información referente a sus vuelos. Un vuelo se identifica por una clave de 
-- vuelo que es única. Además tiene su fecha de salida, la hora de salida, la hora de embarque y la ciudad origen y 
-- destino a la que vuela. También se quiere saber qué avión realiza el vuelo. Del avión se tiene su código 
-- identificativo único (matrícula), el tipo de avión y el número de pasajeros. Cada vuelo será realizado 
-- exclusivamente por un avión
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdAVIONES-VUELOS` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `bdAVIONES-VUELOS` ;

-- -----------------------------------------------------
-- Table `bdAVIONES-VUELOS`.`VUELOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdAVIONES-VUELOS`.`VUELOS` (
  `idVuelo` INT NOT NULL AUTO_INCREMENT,
  `Fecha ida` VARCHAR(45) NULL,
  `Fecha vuelta` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Ciudad Origen` VARCHAR(45) NULL,
  `Ciudad Destino` VARCHAR(45) NULL,
  PRIMARY KEY (`idVuelo`),
  UNIQUE INDEX `idVuelo_UNIQUE` (`idVuelo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdAVIONES-VUELOS`.`Avión`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdAVIONES-VUELOS`.`Avión` (
  `idAvión` INT NOT NULL AUTO_INCREMENT,
  `tipoAvión` VARCHAR(45) NULL,
  `nªpasajeros` VARCHAR(45) NULL,
  `VUELOS_idVuelo` INT NOT NULL,
  PRIMARY KEY (`idAvión`, `VUELOS_idVuelo`),
  UNIQUE INDEX `idAvión_UNIQUE` (`idAvión` ASC) VISIBLE,
  INDEX `fk_Avión_VUELOS_idx` (`VUELOS_idVuelo` ASC) VISIBLE,
  CONSTRAINT `fk_Avión_VUELOS`
    FOREIGN KEY (`VUELOS_idVuelo`)
    REFERENCES `bdAVIONES-VUELOS`.`VUELOS` (`idVuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdAVIONES-VUELOS`.`PASAJEROS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdAVIONES-VUELOS`.`PASAJEROS` (
  `dniPasajeros` INT NOT NULL,
  `nombrePasajeros` VARCHAR(45) NULL,
  `apellidosPasajeros` VARCHAR(45) NULL,
  `dirección` VARCHAR(45) NULL,
  `tfnoPasajeros` VARCHAR(45) NULL,
  PRIMARY KEY (`dniPasajeros`),
  UNIQUE INDEX `dniPasajeros_UNIQUE` (`dniPasajeros` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdAVIONES-VUELOS`.`PASAJEROS_has_VUELOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdAVIONES-VUELOS`.`PASAJEROS_has_VUELOS` (
  `PASAJEROS_dniPasajeros` INT NOT NULL,
  `VUELOS_idVuelo` INT NOT NULL,
  PRIMARY KEY (`PASAJEROS_dniPasajeros`, `VUELOS_idVuelo`),
  INDEX `fk_PASAJEROS_has_VUELOS_VUELOS1_idx` (`VUELOS_idVuelo` ASC) VISIBLE,
  INDEX `fk_PASAJEROS_has_VUELOS_PASAJEROS1_idx` (`PASAJEROS_dniPasajeros` ASC) VISIBLE,
  CONSTRAINT `fk_PASAJEROS_has_VUELOS_PASAJEROS1`
    FOREIGN KEY (`PASAJEROS_dniPasajeros`)
    REFERENCES `bdAVIONES-VUELOS`.`PASAJEROS` (`dniPasajeros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PASAJEROS_has_VUELOS_VUELOS1`
    FOREIGN KEY (`VUELOS_idVuelo`)
    REFERENCES `bdAVIONES-VUELOS`.`VUELOS` (`idVuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdAVIONES-VUELOS`.`PILOTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdAVIONES-VUELOS`.`PILOTOS` (
  `idPILOTOS` INT NOT NULL,
  `nombrePiloto` VARCHAR(45) NULL,
  `apellidosPiloto` VARCHAR(45) NULL,
  `direccionPilotos` VARCHAR(45) NULL,
  PRIMARY KEY (`idPILOTOS`),
  UNIQUE INDEX `idPILOTOS_UNIQUE` (`idPILOTOS` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdAVIONES-VUELOS`.`Avión_has_PILOTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdAVIONES-VUELOS`.`Avión_has_PILOTOS` (
  `Avión_idAvión` INT NOT NULL,
  `Avión_VUELOS_idVuelo` INT NOT NULL,
  `PILOTOS_idPILOTOS` INT NOT NULL,
  PRIMARY KEY (`Avión_idAvión`, `Avión_VUELOS_idVuelo`, `PILOTOS_idPILOTOS`),
  INDEX `fk_Avión_has_PILOTOS_PILOTOS1_idx` (`PILOTOS_idPILOTOS` ASC) VISIBLE,
  INDEX `fk_Avión_has_PILOTOS_Avión1_idx` (`Avión_idAvión` ASC, `Avión_VUELOS_idVuelo` ASC) VISIBLE,
  CONSTRAINT `fk_Avión_has_PILOTOS_Avión1`
    FOREIGN KEY (`Avión_idAvión` , `Avión_VUELOS_idVuelo`)
    REFERENCES `bdAVIONES-VUELOS`.`Avión` (`idAvión` , `VUELOS_idVuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avión_has_PILOTOS_PILOTOS1`
    FOREIGN KEY (`PILOTOS_idPILOTOS`)
    REFERENCES `bdAVIONES-VUELOS`.`PILOTOS` (`idPILOTOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
