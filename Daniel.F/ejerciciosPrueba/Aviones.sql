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
DROP TABLE IF EXISTS `Aviones`.`Avion` ;

CREATE TABLE IF NOT EXISTS `Aviones`.`Avion` (
  `Matricula` VARCHAR(45) NOT NULL,
  `tipoAvion` VARCHAR(45) NULL,
  `NumAvion` VARCHAR(45) NULL,
  PRIMARY KEY (`Matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aviones`.`Vuelos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aviones`.`Vuelos` ;

CREATE TABLE IF NOT EXISTS `Aviones`.`Vuelos` (
  `idVuelo` INT NOT NULL AUTO_INCREMENT,
  `Fecha_salida` DATE NULL,
  `Hora_embarque` DATETIME NULL,
  `Hora_salida` VARCHAR(45) NULL,
  `Hora_destino` VARCHAR(45) NULL,
  `Avion_Matricula` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVuelo`, `Avion_Matricula`),
  INDEX `fk_Vuelos_Avion_idx` (`Avion_Matricula` ASC) ,
  CONSTRAINT `fk_Vuelos_Avion`
    FOREIGN KEY (`Avion_Matricula`)
    REFERENCES `Aviones`.`Avion` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
