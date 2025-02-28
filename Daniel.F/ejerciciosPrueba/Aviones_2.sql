-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Aviones
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Aviones
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Aviones` DEFAULT CHARACTER SET utf8 ;
USE `Aviones` ;

-- -----------------------------------------------------
-- Table `Aviones`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aviones`.`Avion` (
  `Matricula` VARCHAR(45) NOT NULL,
  `tipoAvion` VARCHAR(45) NULL,
  `NumAvion` VARCHAR(45) NULL,
  PRIMARY KEY (`Matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aviones`.`Vuelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aviones`.`Vuelos` (
  `idVuelo` INT NOT NULL AUTO_INCREMENT,
  `Fecha_salida` DATE NULL,
  `Hora_embarque` DATETIME NULL,
  `Hora_salida` VARCHAR(45) NULL,
  `Hora_destino` VARCHAR(45) NULL,
  `Avion_Matricula` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVuelo`, `Avion_Matricula`),
  INDEX `fk_Vuelos_Avion_idx` (`Avion_Matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelos_Avion`
    FOREIGN KEY (`Avion_Matricula`)
    REFERENCES `Aviones`.`Avion` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aviones`.`pasajeros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aviones`.`pasajeros` (
  `idpasajeros` INT NOT NULL,
  PRIMARY KEY (`idpasajeros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aviones`.`Pasajeros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aviones`.`Pasajeros` (
  `idPasajeros` INT UNSIGNED NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idPasajeros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aviones`.`Pilotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aviones`.`Pilotos` (
  `Nun_piloto` INT NOT NULL AUTO_INCREMENT,
  `Pilotos_Nun_piloto` INT NOT NULL,
  PRIMARY KEY (`Nun_piloto`, `Pilotos_Nun_piloto`),
  UNIQUE INDEX `Nun_piloto_UNIQUE` (`Nun_piloto` ASC) VISIBLE,
  INDEX `fk_Pilotos_Pilotos1_idx` (`Pilotos_Nun_piloto` ASC) VISIBLE,
  CONSTRAINT `fk_Pilotos_Pilotos1`
    FOREIGN KEY (`Pilotos_Nun_piloto`)
    REFERENCES `Aviones`.`Pilotos` (`Nun_piloto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aviones`.`Vuelos_has_Pasajeros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aviones`.`Vuelos_has_Pasajeros` (
  `Vuelos_idVuelo` INT NOT NULL,
  `Vuelos_Avion_Matricula` VARCHAR(45) NOT NULL,
  `Pasajeros_idPasajeros` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Vuelos_idVuelo`, `Vuelos_Avion_Matricula`, `Pasajeros_idPasajeros`),
  INDEX `fk_Vuelos_has_Pasajeros_Pasajeros1_idx` (`Pasajeros_idPasajeros` ASC) VISIBLE,
  INDEX `fk_Vuelos_has_Pasajeros_Vuelos1_idx` (`Vuelos_idVuelo` ASC, `Vuelos_Avion_Matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelos_has_Pasajeros_Vuelos1`
    FOREIGN KEY (`Vuelos_idVuelo` , `Vuelos_Avion_Matricula`)
    REFERENCES `Aviones`.`Vuelos` (`idVuelo` , `Avion_Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vuelos_has_Pasajeros_Pasajeros1`
    FOREIGN KEY (`Pasajeros_idPasajeros`)
    REFERENCES `Aviones`.`Pasajeros` (`idPasajeros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aviones`.`Pilotos_has_Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aviones`.`Pilotos_has_Avion` (
  `Pilotos_Nun_piloto` INT NOT NULL,
  `Pilotos_Pilotos_Nun_piloto` INT NOT NULL,
  `Avion_Matricula` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Pilotos_Nun_piloto`, `Pilotos_Pilotos_Nun_piloto`, `Avion_Matricula`),
  INDEX `fk_Pilotos_has_Avion_Avion1_idx` (`Avion_Matricula` ASC) VISIBLE,
  INDEX `fk_Pilotos_has_Avion_Pilotos1_idx` (`Pilotos_Nun_piloto` ASC, `Pilotos_Pilotos_Nun_piloto` ASC) VISIBLE,
  CONSTRAINT `fk_Pilotos_has_Avion_Pilotos1`
    FOREIGN KEY (`Pilotos_Nun_piloto` , `Pilotos_Pilotos_Nun_piloto`)
    REFERENCES `Aviones`.`Pilotos` (`Nun_piloto` , `Pilotos_Nun_piloto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pilotos_has_Avion_Avion1`
    FOREIGN KEY (`Avion_Matricula`)
    REFERENCES `Aviones`.`Avion` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Aviones` ;

-- -----------------------------------------------------
-- Placeholder table for view `Aviones`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aviones`.`view1` (`id` INT);

-- -----------------------------------------------------
--  routine1
-- -----------------------------------------------------

DELIMITER $$
USE `Aviones`$$
$$

DELIMITER ;

-- -----------------------------------------------------
-- View `Aviones`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aviones`.`view1`;
USE `Aviones`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
