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
-- Table `mydb`.`FACTURAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FACTURAS` (
  `idFacturas` INT NOT NULL AUTO_INCREMENT,
  `fechaEmision` VARCHAR(45) NULL,
  `importeTotal` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  PRIMARY KEY (`idFacturas`),
  UNIQUE INDEX `idFacturas_UNIQUE` (`idFacturas` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CLIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTES` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `nombreClientes` VARCHAR(45) NULL,
  `apellidosClientes` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `NIF` VARCHAR(45) NULL,
  `FACTURAS_idFacturas` INT NOT NULL,
  PRIMARY KEY (`idClientes`, `FACTURAS_idFacturas`),
  UNIQUE INDEX `idClientes_UNIQUE` (`idClientes` ASC) VISIBLE,
  INDEX `fk_CLIENTES_FACTURAS1_idx` (`FACTURAS_idFacturas` ASC) VISIBLE,
  CONSTRAINT `fk_CLIENTES_FACTURAS1`
    FOREIGN KEY (`FACTURAS_idFacturas`)
    REFERENCES `mydb`.`FACTURAS` (`idFacturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EMPLEADOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EMPLEADOS` (
  `idEmpleados` INT NOT NULL AUTO_INCREMENT,
  `nombrEmpleados` VARCHAR(45) NULL,
  `apellidosEmpleados` VARCHAR(45) NULL,
  `fechAlta SS` VARCHAR(45) NULL,
  `FACTURAS_idFacturas` INT NOT NULL,
  PRIMARY KEY (`idEmpleados`, `FACTURAS_idFacturas`),
  UNIQUE INDEX `idEmpleados_UNIQUE` (`idEmpleados` ASC) VISIBLE,
  INDEX `fk_EMPLEADOS_FACTURAS_idx` (`FACTURAS_idFacturas` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLEADOS_FACTURAS`
    FOREIGN KEY (`FACTURAS_idFacturas`)
    REFERENCES `mydb`.`FACTURAS` (`idFacturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
