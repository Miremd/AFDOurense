CREATE DATABASE if not exists Biblioteca;
USE BIBLIOTECA;

CREATE TABLE if not exists libros (
	id_libro INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	autor VARCHAR (50),
	año_publicacion DATE 
);

CREATE TABLE if not exists usuarios (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR (100),
	email VARCHAR (100)
 );
 
 Create TABLE if not exists prestamos (
	id_prestamos INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario int,
    id_libro int,
    fecha_prestamo date,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_libro) REFERENCES libros (id_libro)
);

-- Insertamos los datos

INSERT INTO libros (titulo,autor) values ("Merlín e familia", "Rafael Dieste");
INSERT INTO libros (titulo,autor) values ("Longa noite de pedra", "Castelao");
INSERT INTO libros (titulo,autor) values ("Trece anos de Branca", "Marilar Aleixandre");
INSERT INTO libros (titulo,autor) values ("Sempre en Galiza", "Castelao");
INSERT INTO libros (titulo,autor) values ("Los capullos no regalan flores","Moderna de Pueblo");


INSERT INTO usuarios (nombre,email) values ("Marcos","marcosgarrulo@gmail.com");
INSERT INTO usuarios (nombre,email) values ("Marta","martapasalagarrafa@gmail.com");
INSERT INTO usuarios (nombre,email) values ("Susan","susanasalagarrafa@gmail.com");
INSERT INTO usuarios (nombre,email) values ("Paquito","paquitochocolatero@gmail.com");

