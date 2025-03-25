CREATE DATABASE if not exists EMPRESA;
USE Empresa;

CREATE TABLE if not exists Empleados (
	id_empleados INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	cargo VARCHAR(50),
	salario decimal (8,2)
 );

CREATE TABLE if not exists Departamentos (
	id_departamento INT PRIMARY KEY AUTO_INCREMENT,
	nombre_departamento VARCHAR(50) 
);

-- Insertamos valores a las tablas-

INSERT INTO Empleados (nombre,cargo,salario) values ("Moncho Penelas","jefecillo", 1500.50);
INSERT INTO Empleados (nombre,cargo,salario) values ("Manoli Rodriguez","capataz", 1200.50);
INSERT INTO Empleados (nombre,cargo,salario) values ("Merche Lopez", "auxiliar", 1100.50);

INSERT INTO Departamentos (nombre_departamento) values ("Recursos Humanos");
INSERT INTO Departamentos (nombre_departamento) values ("Jefecillos");

-- Hacemos SELECT

SELECT* FROM Empleados;
SELECT*FROM Departamentos;