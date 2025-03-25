create database if not exists biblioteca;

USE biblioteca;


CREATE TABLE libros (
    id_libros int primary key auto_increment,
    titulo VARCHAR(100),
    autor varchar (30),
    año datetime
);
CREATE TABLE usuario (
    id_usuario int primary key auto_increment,
    nombre VARCHAR(30),
    correo_electronico varchar (30)
);
CREATE TABLE prestamos (
	id_prestamo int,
	id_usuario int,
    id_libros int, 
	fecha_prestamo date,
    FOREIGN KEY (id_usuario) REFERENCES libros(id_libros),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);


-- INSET INTO LIbros--

INSERT INTO libros (titulo,autor,año) VALUES ('Criptomoticon', 'anomimo', 20210115),('Prueba', 'Prueba', 20210115),('Criptomoticon', 'anomimo', 20210115),('Criptomoticon', 'anomimo', 20210115),('Criptomoticon', 'anomimo', 2021115);
-- INSET INTO LIbros--

INSERT INTO usuario (nombre,correo_electronico) VALUES ('daniel','viruela@gmail.com'),('Manuel','viruela@gmail.com'),('Manolo','viruela@gmail.com'),('FErnando','viruela@gmail.com'),('Amando','viruela@gmail.com');

select * from usuario;
select * from libros;
describe usuario;
describe libros;
select año, autor from libros where año > '20000114' order by '20000114' ;


SHOW VARIABLES LIKE 'character_set_server';
show warnings;



