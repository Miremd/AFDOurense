DROP DATABASE IF EXISTS EMPRESA;
CREATE DATABASE IF NOT EXISTS EMPRESA;
USE EMPRESA;

CREATE TABLE Empleados (
			id_producto int auto_increment,
            nombre varchar(50) not null,
            cargo varchar (15) not null,
            salario decimal(8,2) not null,
		PRIMARY KEY(id_productO));
CREATE TABLE Departamentos (
			id_departamento int auto_increment,
            nombre_dep varchar(15) not null,
		PRIMARY KEY (id_departamento));
        
INSERT INTO Empleados (nombre,cargo,salario)
VALUES ('tito','empleado',1500.50);
INSERT INTO Empleados (nombre,cargo,salario)
VALUES ('Colio','empleado',1800.50);
INSERT INTO Empleados (nombre,cargo,salario)
VALUES ('Churruscos','Jefecillo',1500.50);

INSERT INTO Departamentos (nombre_dep)
VALUES ('RRHH'); 
INSERT INTO Departamentos (nombre_dep)
VALUES ('Contabilidad');
 
Select * from Empleados;     
Select * from Departamentos;         
	