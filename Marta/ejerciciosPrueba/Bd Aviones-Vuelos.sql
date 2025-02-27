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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
