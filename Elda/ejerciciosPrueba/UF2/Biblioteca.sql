-- Crear base de datos Biblioteca

create database if not exists Biblioteca;
use Biblioteca;

-- crear tablas
create table if not exists Libros (
	id_libro int primary key auto_increment, 
    titulo varchar(100),
    autor varchar(100), 
    año_publicacion datetime
);

create table if not exists Usuarios (
	id_usuario int primary key auto_increment,
	nombre varchar(100), 
    email varchar(100)
);

create table if not exists Préstamos (
	id_prestamo int primary key auto_increment,
    id_usuario int,
    id_libro int, 
    fecha_prestamo datetime, 
    foreign key (id_usuario) references Usuarios (id_usuario),
    foreign key (id_libro) references Libros (id_libro)
);    

-- Insetar datos
insert into Libros (titulo, autor) values ("Longa noite de pedra", "Celso Emilio Ferreiro");
insert into Libros (titulo, autor) values ("Merlin e familia", "Rafael Dieste");
insert into Libros (titulo, autor) values ("Sempre en Galiza", "Alfonso Rodriguez Castelao");
insert into Libros (titulo, autor) values ("Un ollo de vidro", "Alfonso Rodriguez Castelao");
insert into Libros (titulo, autor) values ("Onde o mundo se chama Celanova", "Celso Emilio Ferreiro"); 

insert into Usuarios (nombre, email) values ("Pepe Botella", "botelli@gmail.com");
insert into Usuarios (nombre, email) values ("Otilio", "otili@gmail.com");
insert into Usuarios (nombre, email) values ("Carpanta", "carpanta@gmail.com");
select * from Usuarios