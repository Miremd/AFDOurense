-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BDinstituto
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BDinstituto` ;

-- -----------------------------------------------------
-- Schema BDinstituto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDinstituto` DEFAULT CHARACTER SET utf8 ;
USE `BDinstituto` ;

-- -----------------------------------------------------
-- Table `BDinstituto`.`departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDinstituto`.`departamentos` (
  `nombre departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre departamento`),
  UNIQUE INDEX `nombre departamento_UNIQUE` (`nombre departamento` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `BDinstituto`.`profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDinstituto`.`profesores` (
  `dni` VARCHAR(9) NOT NULL,
  `nombre y apellidos` VARCHAR(150) NULL,
  `direccion` VARCHAR(150) NULL,
  `especialidad` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `año  inicio centro` DATE NULL,
  `departamentos_nombre departamento` VARCHAR(45) NOT NULL,
  `departamentos_nombre departamento jefe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE,
  INDEX `fk_profesores_departamentos1_idx` (`departamentos_nombre departamento` ASC) VISIBLE,
  INDEX `fk_profesores_departamentos2_idx` (`departamentos_nombre departamento jefe` ASC) VISIBLE,
  CONSTRAINT `fk_profesores_departamentos1`
    FOREIGN KEY (`departamentos_nombre departamento`)
    REFERENCES `BDinstituto`.`departamentos` (`nombre departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesores_departamentos2`
    FOREIGN KEY (`departamentos_nombre departamento jefe`)
    REFERENCES `BDinstituto`.`departamentos` (`nombre departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDinstituto`.`categoria laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDinstituto`.`categoria laboral` (
  `nombrecategoria laboral` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombrecategoria laboral`),
  UNIQUE INDEX `nombrecategoria laboral_UNIQUE` (`nombrecategoria laboral` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '		';


-- -----------------------------------------------------
-- Table `BDinstituto`.`actividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDinstituto`.`actividades` (
  `idactividades` INT NOT NULL AUTO_INCREMENT,
  `nomb reactividad` VARCHAR(45) NULL,
  `fecha celefracion` DATE NULL,
  `nparticipante` INT NULL,
  `departamentos_nombre departamento1` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idactividades`),
  UNIQUE INDEX `idactividades_UNIQUE` (`idactividades` ASC) VISIBLE,
  INDEX `fk_actividades_departamentos1_idx` (`departamentos_nombre departamento1` ASC) VISIBLE,
  CONSTRAINT `fk_actividades_departamentos1`
    FOREIGN KEY (`departamentos_nombre departamento1`)
    REFERENCES `BDinstituto`.`departamentos` (`nombre departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `BDinstituto`.`categoria laboral_has_profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDinstituto`.`categoria laboral_has_profesores` (
  `categoria laboral_nombrecategoria laboral` VARCHAR(45) NOT NULL,
  `profesores_dni` VARCHAR(9) NOT NULL,
  `fecha inicio categoria` DATE NULL,
  PRIMARY KEY (`categoria laboral_nombrecategoria laboral`, `profesores_dni`),
  INDEX `fk_categoria laboral_has_profesores_profesores1_idx` (`profesores_dni` ASC) VISIBLE,
  INDEX `fk_categoria laboral_has_profesores_categoria laboral_idx` (`categoria laboral_nombrecategoria laboral` ASC) VISIBLE,
  UNIQUE INDEX `profesores_dni_UNIQUE` (`profesores_dni` ASC) VISIBLE,
  CONSTRAINT `fk_categoria laboral_has_profesores_categoria laboral`
    FOREIGN KEY (`categoria laboral_nombrecategoria laboral`)
    REFERENCES `BDinstituto`.`categoria laboral` (`nombrecategoria laboral`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria laboral_has_profesores_profesores1`
    FOREIGN KEY (`profesores_dni`)
    REFERENCES `BDinstituto`.`profesores` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `BDinstituto`.`profesores_has_actividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDinstituto`.`profesores_has_actividades` (
  `profesores_dni` VARCHAR(9) NOT NULL,
  `actividades_idactividades` INT NOT NULL,
  PRIMARY KEY (`profesores_dni`, `actividades_idactividades`),
  INDEX `fk_profesores_has_actividades_actividades1_idx` (`actividades_idactividades` ASC) VISIBLE,
  INDEX `fk_profesores_has_actividades_profesores1_idx` (`profesores_dni` ASC) VISIBLE,
  CONSTRAINT `fk_profesores_has_actividades_profesores1`
    FOREIGN KEY (`profesores_dni`)
    REFERENCES `BDinstituto`.`profesores` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesores_has_actividades_actividades1`
    FOREIGN KEY (`actividades_idactividades`)
    REFERENCES `BDinstituto`.`actividades` (`idactividades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
