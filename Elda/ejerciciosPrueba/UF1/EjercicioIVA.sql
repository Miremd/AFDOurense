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
-- Table `mydb`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleados` (
  `idEmpleados` INT NOT NULL,
  `NifEmpleado` VARCHAR(45) NULL,
  `nombreEmpleado` VARCHAR(45) NULL,
  `fecha` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleados`),
  UNIQUE INDEX `idEmpleados_UNIQUE` (`idEmpleados` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `idClientes` INT NOT NULL,
  `nombreCliente` VARCHAR(45) NULL,
  `apellidosCliente` VARCHAR(45) NULL,
  `direcciónCliente` VARCHAR(45) NULL,
  `NifCliente` VARCHAR(45) NULL,
  PRIMARY KEY (`idClientes`),
  UNIQUE INDEX `idClientes_UNIQUE` (`idClientes` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Facturas` (
  `idFacturas` INT NOT NULL,
  `fechaFactura` VARCHAR(45) NULL,
  `importeFactura` VARCHAR(45) NULL,
  `IVAfactura` VARCHAR(45) NULL,
  `importeTotalIVA` VARCHAR(45) NULL,
  `Empleados_idEmpleados` INT NOT NULL,
  `Clientes_idClientes` INT NOT NULL,
  PRIMARY KEY (`idFacturas`, `Empleados_idEmpleados`, `Clientes_idClientes`),
  UNIQUE INDEX `idFacturas_UNIQUE` (`idFacturas` ASC) VISIBLE,
  INDEX `fk_Facturas_Empleados_idx` (`Empleados_idEmpleados` ASC) VISIBLE,
  INDEX `fk_Facturas_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Facturas_Empleados`
    FOREIGN KEY (`Empleados_idEmpleados`)
    REFERENCES `mydb`.`Empleados` (`idEmpleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Facturas_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `mydb`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
