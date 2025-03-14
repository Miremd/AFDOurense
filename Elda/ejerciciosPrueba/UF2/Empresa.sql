-- crear base de datos de Gestión de empleados
create database Empresa;
use Empresa;

create table if not exists Empleados (
	id_empleado int primary key auto_increment,
    nombre varchar(100),
    cargo varchar(50),
    salario decimal(8,2)
);

create table if not exists Departamentos (
	id_departamento int primary key auto_increment,
	nombre varchar(50)
    );
    
-- insertar valores
insert into Empleados (nombre, cargo, salario) values ("Moncho Lopez", "jefecillo", 1450.87);
insert into Empleados (nombre, cargo, salario) values ("Manoli Manolez", "secretaria", 1250.95);
insert into Empleados (nombre, cargo, salario) values ("Juana Perez", "directora", 1800);

insert into Departamentos (nombre) values ("Recursos Humanos");
insert into Departamentos (nombre) values ("Purrela");

-- Hacer select 
select * from Empleados;
select* from Departamentos;