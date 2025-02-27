-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Compañia_Aerea
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Compañia_Aerea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Compañia_Aerea` DEFAULT CHARACTER SET utf8 ;
USE `Compañia_Aerea` ;

-- -----------------------------------------------------
-- Table `Compañia_Aerea`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Compañia_Aerea`.`Avion` (
  `id_Avion` INT NOT NULL AUTO_INCREMENT,
  `tipo_avion` VARCHAR(45) NULL,
  `Num_pas` INT(4) NULL,
  PRIMARY KEY (`id_Avion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Compañia_Aerea`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Compañia_Aerea`.`Vuelo` (
  `idVuelo` INT NOT NULL AUTO_INCREMENT,
  `Fecha salida` DATE NULL,
  `hora_salida` VARCHAR(45) NULL,
  `hora_embarque` VARCHAR(45) NULL,
  `ciudad_origen` VARCHAR(45) NULL,
  `destino` VARCHAR(45) NULL,
  `Avion_id_Avion` INT NOT NULL,
  PRIMARY KEY (`idVuelo`, `Avion_id_Avion`),
  UNIQUE INDEX `idVuelo_UNIQUE` (`idVuelo` ASC) VISIBLE,
  INDEX `fk_Vuelo_Avion_idx` (`Avion_id_Avion` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelo_Avion`
    FOREIGN KEY (`Avion_id_Avion`)
    REFERENCES `Compañia_Aerea`.`Avion` (`id_Avion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Compañia_Aerea`.`Pasajeros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Compañia_Aerea`.`Pasajeros` (
  `DNI` INT(8) NOT NULL,
  `Nombre y Apellidos` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Tlfno` INT(9) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Compañia_Aerea`.`Vuelo_has_Pasajeros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Compañia_Aerea`.`Vuelo_has_Pasajeros` (
  `Vuelo_idVuelo` INT NOT NULL,
  `Vuelo_Avion_id_Avion` INT NOT NULL,
  `Pasajeros_DNI` INT(8) NOT NULL,
  PRIMARY KEY (`Vuelo_idVuelo`, `Vuelo_Avion_id_Avion`, `Pasajeros_DNI`),
  INDEX `fk_Vuelo_has_Pasajeros_Pasajeros1_idx` (`Pasajeros_DNI` ASC) VISIBLE,
  INDEX `fk_Vuelo_has_Pasajeros_Vuelo1_idx` (`Vuelo_idVuelo` ASC, `Vuelo_Avion_id_Avion` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelo_has_Pasajeros_Vuelo1`
    FOREIGN KEY (`Vuelo_idVuelo` , `Vuelo_Avion_id_Avion`)
    REFERENCES `Compañia_Aerea`.`Vuelo` (`idVuelo` , `Avion_id_Avion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vuelo_has_Pasajeros_Pasajeros1`
    FOREIGN KEY (`Pasajeros_DNI`)
    REFERENCES `Compañia_Aerea`.`Pasajeros` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
