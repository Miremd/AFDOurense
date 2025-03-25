create database if not exists empresa;
use empresa;

CREATE TABLE empleados (
	id_empleado INT PRIMARY KEY auto_increment, 
    nombre varchar(50), 
    cargo VARCHAR(50),
    salario decimal(4.2) 
);
CREATE TABLE departamentos (
	id_empleado INT  PRIMARY KEY auto_increment,
    nombre_dep varchar(50)
);

INSERT INTO empleados (nombre, cargo, salario) VALUES ('Manuel', 'Tecnico', 12.45),
 ('Manuel', 'Manager', 12.13), 
 ( 'Hernando', 'Tecnico', 24.34);
 INSERT INTO departamentos (nombre_dep) VALUES ( 'Tecnico'),
( 'Mantenimiento'), 
 ( 'Tecnico');
select * from empleados;
select * from departamentos;

describe empleados;
describe departamentos;