-- Primeras pruebas 
-- Crear base de datos

CREATE DATABASE IF NOT EXISTS test;
-- poner en uso una base de datos
USE test;
-- crear una tabla con dos atributos
create table if not exists nometable (
c1 integer not null, 
c2 varchar (3),
primary key (c1) 
) engine=innodb , charset= UTF8;