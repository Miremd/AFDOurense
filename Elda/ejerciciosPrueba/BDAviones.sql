-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BDAviones
-- -----------------------------------------------------
-- Una compañía aérea quiere almacenar información referente a sus vuelos. Un vuelo se identifica por una clave de
-- vuelo que es única. Además tiene su fecha de salida, la hora de salida, la hora de embarque y la ciudad origen y
-- destino a la que vuela. También se quiere saber qué avión realiza el vuelo. Del avión se tiene su código
-- identificativo único (matrícula), el tipo de avión y el número de pasajeros. Cada vuelo será realizado
-- exclusivamente por un avión.
DROP SCHEMA IF EXISTS `BDAviones` ;

-- -----------------------------------------------------
-- Schema BDAviones
--
-- Una compañía aérea quiere almacenar información referente a sus vuelos. Un vuelo se identifica por una clave de
-- vuelo que es única. Además tiene su fecha de salida, la hora de salida, la hora de embarque y la ciudad origen y
-- destino a la que vuela. También se quiere saber qué avión realiza el vuelo. Del avión se tiene su código
-- identificativo único (matrícula), el tipo de avión y el número de pasajeros. Cada vuelo será realizado
-- exclusivamente por un avión.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDAviones` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `BDAviones` ;

-- -----------------------------------------------------
-- Table `BDAviones`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDAviones`.`Avion` (
  `matricula` INT NOT NULL,
  `tipoAvion` VARCHAR(45) NULL,
  `numeroPasajeros` VARCHAR(45) NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDAviones`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDAviones`.`Vuelo` (
  `idVuelo` INT NOT NULL,
  `fecha salida` DATE NULL,
  `horaSalida` VARCHAR(45) NULL,
  `horaEmbarque` VARCHAR(45) NULL,
  `ciudad origen` VARCHAR(45) NULL,
  `ciudadDestino` VARCHAR(45) NULL,
  `Avion_matricula` INT NOT NULL,
  PRIMARY KEY (`idVuelo`, `Avion_matricula`),
  UNIQUE INDEX `idVuelo_UNIQUE` (`idVuelo` ASC) VISIBLE,
  INDEX `fk_Vuelo_Avion_idx` (`Avion_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelo_Avion`
    FOREIGN KEY (`Avion_matricula`)
    REFERENCES `BDAviones`.`Avion` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDAviones`.`Pasajeros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDAviones`.`Pasajeros` (
  `Dni` INT NOT NULL,
  `nombrePasajero` VARCHAR(45) NOT NULL,
  `ApellidosPasajero` VARCHAR(45) NOT NULL,
  `direcciónPasajero` VARCHAR(45) NULL,
  `teléfonoPasajero` VARCHAR(45) NULL,
  PRIMARY KEY (`Dni`),
  UNIQUE INDEX `Dni_UNIQUE` (`Dni` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDAviones`.`Vuelo_has_Pasajeros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDAviones`.`Vuelo_has_Pasajeros` (
  `Vuelo_idVuelo` INT NOT NULL,
  `Vuelo_Avion_matricula` INT NOT NULL,
  `Pasajeros_Dni` INT NOT NULL,
  PRIMARY KEY (`Vuelo_idVuelo`, `Vuelo_Avion_matricula`, `Pasajeros_Dni`),
  INDEX `fk_Vuelo_has_Pasajeros_Pasajeros1_idx` (`Pasajeros_Dni` ASC) VISIBLE,
  INDEX `fk_Vuelo_has_Pasajeros_Vuelo1_idx` (`Vuelo_idVuelo` ASC, `Vuelo_Avion_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelo_has_Pasajeros_Vuelo1`
    FOREIGN KEY (`Vuelo_idVuelo` , `Vuelo_Avion_matricula`)
    REFERENCES `BDAviones`.`Vuelo` (`idVuelo` , `Avion_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vuelo_has_Pasajeros_Pasajeros1`
    FOREIGN KEY (`Pasajeros_Dni`)
    REFERENCES `BDAviones`.`Pasajeros` (`Dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDAviones`.`Pilotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDAviones`.`Pilotos` (
  `númeroPiloto` INT NOT NULL,
  `nombrePiloto` VARCHAR(45) NULL,
  `apellidosPiloto` VARCHAR(45) NULL,
  `direcciónPiloto` VARCHAR(45) NULL,
  `teléfonoPiloto` VARCHAR(45) NULL,
  `Pilotos_númeroPiloto` INT NOT NULL,
  PRIMARY KEY (`númeroPiloto`, `Pilotos_númeroPiloto`),
  UNIQUE INDEX `númeroPiloto_UNIQUE` (`númeroPiloto` ASC) VISIBLE,
  INDEX `fk_Pilotos_Pilotos1_idx` (`Pilotos_númeroPiloto` ASC) VISIBLE,
  CONSTRAINT `fk_Pilotos_Pilotos1`
    FOREIGN KEY (`Pilotos_númeroPiloto`)
    REFERENCES `BDAviones`.`Pilotos` (`númeroPiloto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDAviones`.`Pilotos_has_Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDAviones`.`Pilotos_has_Avion` (
  `Pilotos_númeroPiloto` INT NOT NULL,
  `Avion_matricula` INT NOT NULL,
  PRIMARY KEY (`Pilotos_númeroPiloto`, `Avion_matricula`),
  INDEX `fk_Pilotos_has_Avion_Avion1_idx` (`Avion_matricula` ASC) VISIBLE,
  INDEX `fk_Pilotos_has_Avion_Pilotos1_idx` (`Pilotos_númeroPiloto` ASC) VISIBLE,
  CONSTRAINT `fk_Pilotos_has_Avion_Pilotos1`
    FOREIGN KEY (`Pilotos_númeroPiloto`)
    REFERENCES `BDAviones`.`Pilotos` (`númeroPiloto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pilotos_has_Avion_Avion1`
    FOREIGN KEY (`Avion_matricula`)
    REFERENCES `BDAviones`.`Avion` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
