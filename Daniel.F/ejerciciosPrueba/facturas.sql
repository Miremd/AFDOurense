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
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `idEmpleado` INT NOT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `fecha alta` DATE NULL,
  `otros` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleado`, `NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Facturas` (
  `idFacturas` INT NOT NULL AUTO_INCREMENT,
  `Fecha_emision` VARCHAR(45) NULL,
  `Importe total` INT NULL,
  `Iva` VARCHAR(45) NULL,
  `Total iva` VARCHAR(45) NULL,
  `Clientes_idClientes` INT NOT NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  `Empleado_NIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFacturas`),
  INDEX `fk_Facturas_Clientes_idx` (`Clientes_idClientes` ASC) VISIBLE,
  INDEX `fk_Facturas_Empleado1_idx` (`Empleado_idEmpleado` ASC, `Empleado_NIF` ASC) VISIBLE,
  CONSTRAINT `fk_Facturas_Clientes`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `mydb`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Facturas_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado` , `Empleado_NIF`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado` , `NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
