DROP DATABASE IF EXISTS BIBLIOTECA;
CREATE DATABASE IF NOT EXISTS BIBLIOTECA;
USE BIBLIOTECA;

CREATE TABLE Libros (
			id_libro int auto_increment,
            titulo varchar(30),
            autor varchar (50),
            Ano_pub int(4),
     PRIMARY KEY(id_libro));
CREATE TABLE Usuarios(
			id_usuario int auto_increment,
            nombre varchar(30),
            correo varchar(50),
	 PRIMARY KEY(id_usuario));
CREATE TABLE Prestamos (
			id_prestamo int auto_increment,
            id_usuario int,
            id_libro int,
            Fecha_prest date,
	 PRIMARY KEY(id_prestamo),
     FOREIGN KEY(id_usuario)
         REFERENCES Usuarios(id_usuario),
	 FOREIGN KEY (id_libro)
         REFERENCES Libros(id_libro));
         
INSERT INTO Libros (titulo,autor,Ano_pub)
VALUES ('Manolito Gafotas','Elvira Lindo',2001);
INSERT INTO Libros (titulo,autor,Ano_pub)
VALUES ('El agujero','Rodolfo rucuatos das nalgas pretas',2012);
INSERT INTO Libros (titulo,autor,Ano_pub)
VALUES ('EL ARBOL','Pringao gomez',2001);
INSERT INTO Libros (titulo,autor,Ano_pub)
VALUES ('El estuche','Torcuato dominguez',2002);
INSERT INTO Libros (titulo,autor,Ano_pub)
VALUES ('El sol','Solinio perez',1990);


INSERT INTO Usuarios (nombre,correo)
VALUES ('Kaka','pipi@hotmail.com');
INSERT INTO Usuarios (nombre,correo)
VALUES ('Ronaldo','ronaldo@hotmail.com');
INSERT INTO Usuarios (nombre,correo)
VALUES ('Roberto Carlos','roberto@hotmail.com');


INSERT INTO Prestamos (id_usuario,id_libro,Fecha_prest)
VALUES (1,3,21210312);

Select * from Libros;
Select * FROM Usuarios;
Select * from Prestamos;