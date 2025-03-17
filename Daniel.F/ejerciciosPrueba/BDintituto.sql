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
-- Table `mydb`.`departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`departamentos` (
  `nombre de departamento` INT NOT NULL,
  PRIMARY KEY (`nombre de departamento`),
  UNIQUE INDEX `nombre de departamento_UNIQUE` (`nombre de departamento` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesores` (
  `telefono` VARCHAR(45) NULL,
  `dni` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellidos` VARCHAR(45) NULL,
  `especilidad` VARCHAR(45) NULL,
  `año de inicio centro` DATE NULL,
  `departamentos_nombre de departamento1` INT NOT NULL,
  `Jefe_departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE,
  INDEX `fk_Profesores_departamentos1_idx` (`departamentos_nombre de departamento1` ASC) VISIBLE,
  INDEX `fk_Profesores_departamentos2_idx` (`Jefe_departamento` ASC) VISIBLE,
  CONSTRAINT `fk_Profesores_departamentos1`
    FOREIGN KEY (`departamentos_nombre de departamento1`)
    REFERENCES `mydb`.`departamentos` (`nombre de departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesores_departamentos2`
    FOREIGN KEY (`Jefe_departamento`)
    REFERENCES `mydb`.`departamentos` (`nombre de departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categoria laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria laboral` (
  `nombrecategoria laboral` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombrecategoria laboral`),
  UNIQUE INDEX `nombrecategoria laboral_UNIQUE` (`nombrecategoria laboral` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`actividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actividades` (
  `idactividades` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `fechadecelebracion` INT NULL,
  `departamentos_nombre de departamento1` INT NOT NULL,
  PRIMARY KEY (`idactividades`),
  UNIQUE INDEX `idactividades_UNIQUE` (`idactividades` ASC) VISIBLE,
  INDEX `fk_actividades_departamentos1_idx` (`departamentos_nombre de departamento1` ASC) VISIBLE,
  CONSTRAINT `fk_actividades_departamentos1`
    FOREIGN KEY (`departamentos_nombre de departamento1`)
    REFERENCES `mydb`.`departamentos` (`nombre de departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesores_has_categoria laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesores_has_categoria laboral` (
  `Profesores_dni` INT NOT NULL,
  `categoria laboral_nombrecategoria laboral` VARCHAR(45) NOT NULL,
  `fecha_antiguedad` DATE NULL,
  PRIMARY KEY (`Profesores_dni`, `categoria laboral_nombrecategoria laboral`),
  INDEX `fk_Profesores_has_categoria laboral_categoria laboral1_idx` (`categoria laboral_nombrecategoria laboral` ASC) VISIBLE,
  INDEX `fk_Profesores_has_categoria laboral_Profesores_idx` (`Profesores_dni` ASC) VISIBLE,
  CONSTRAINT `fk_Profesores_has_categoria laboral_Profesores`
    FOREIGN KEY (`Profesores_dni`)
    REFERENCES `mydb`.`Profesores` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesores_has_categoria laboral_categoria laboral1`
    FOREIGN KEY (`categoria laboral_nombrecategoria laboral`)
    REFERENCES `mydb`.`categoria laboral` (`nombrecategoria laboral`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesores_has_actividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesores_has_actividades` (
  `Profesores_dni` INT NOT NULL,
  `actividades_idactividades` INT NOT NULL,
  PRIMARY KEY (`Profesores_dni`, `actividades_idactividades`),
  INDEX `fk_Profesores_has_actividades_actividades1_idx` (`actividades_idactividades` ASC) VISIBLE,
  INDEX `fk_Profesores_has_actividades_Profesores1_idx` (`Profesores_dni` ASC) VISIBLE,
  CONSTRAINT `fk_Profesores_has_actividades_Profesores1`
    FOREIGN KEY (`Profesores_dni`)
    REFERENCES `mydb`.`Profesores` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesores_has_actividades_actividades1`
    FOREIGN KEY (`actividades_idactividades`)
    REFERENCES `mydb`.`actividades` (`idactividades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
