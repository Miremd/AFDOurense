-- eliminar base de datos si estoy en pruebas
-- descomentar la siguiente linea siempre que no haya datos
drop  database if exists  tiendajuegos;

-- crear y poner en uso base de datos
create database if not exists tiendajuegos;
use tiendajuegos;

-- creacion de tablas
-- crear de tabla juegos
create table if not exists juegos (
	idJuego int,
	nombreJuego varchar(50)
);

 -- Creamos tabla Pedidos            
CREATE TABLE if not exists Pedidos (
	idPedido INT
);

-- Crear tabla Clientes
create table if not exists Clientes (
	idCliente int, 
    nombre varchar(50)
);

-- Aqui empieza la tabla detalle_pedidos
CREATE TABLE if not exists detalle_pedidos (
    id_detalle int primary key auto_increment
);

-- modificaciones de tablas
-- Modificamos la tabla Juegos, Nombres de campos
alter table juegos
change column idJuego ID int;
alter table juegos
change column nombreJuego nombre varchar(50);

-- Añadimos 3 columnas nuevas
alter table juegos
add column categoria enum('puzzle', 'lucha','estrategia','roguelike');
alter table juegos
add column precio double(5,2);
alter table juegos
add column stock int;

-- Ponemos Clave primaria y autoincrement
Alter table  juegos modify ID INT auto_increment primary key;

-- Usamos el ALTER TABLE  en tabla Pedidos, a ver que pasa...
ALTER TABLE Pedidos 
CHANGE COLUMN IdPedido ID INT;
ALTER TABLE Pedidos
MODIFY COLUMN ID INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Pedidos 
ADD COLUMN ID_cliente INT;
ALTER TABLE Pedidos
ADD COLUMN fecha_pedido DATE;

--  Modificaciones de la tabla Clientes
alter table Clientes 
change column idCliente ID int;
alter table Clientes
modify column ID int primary key auto_increment;
alter table Clientes
add column email varchar(50);
alter table Clientes
add column fechaRegistro date;

-- Modificaciones en detalle pedidos para añadir columnas
ALTER TABLE detalle_pedidos change COLUMN id_detalle ID int;
ALTER TABLE detalle_pedidos ADD ID_pedido INT;
ALTER TABLE detalle_pedidos ADD cantidad INT;
ALTER TABLE detalle_pedidos ADD ID_juego INT;

-- Modificaciones para añadir claves foraneas 
--  FK   detalle_pedidos
alter table detalle_pedidos add constraint fk_pedido foreign key(ID_pedido) references pedidos(ID) on delete cascade;
alter table detalle_pedidos add constraint fk_juegos foreign key (ID_juego) references juegos(ID);

-- FK  pedidos
ALTER TABLE Pedidos 
ADD CONSTRAINT fk_cliente
FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID);

-- Añadir datos a la tabla Juego, a ver que pasa...:/

INSERT INTO Juegos (nombre, categoria, precio, stock) values ( "Satisfyer", "lucha", 50.60, 5);
INSERT INTO Juegos (nombre, categoria, precio, stock) values ("Columpio Infernal","lucha", 150.70,4);
INSERT INTO Juegos( nombre, categoria, precio, stock) values ("Esposas","lucha",20.05,5);
INSERT INTO Juegos (nombre, categoria,precio,stock) values ("Juegos del hambre","estrategia",30.80,5);
Insert into juegos (nombre,categoria,precio,stock)
values ('The binding of Isaac','roguelike',20,100),('Baba is you','puzzle',30.78,200);
INSERT INTO juegos (nombre, categoria, precio, stock) VALUES
('la loca pajareria de transilvania', 'lucha', '200','30'), 
('la loca pajareria de transilvania', 'estrategia', '200','30'),
('la loca pajareria de transilvania', 'estrategia', '300','30'),
('la loca pajareria de transilvania', 'lucha', '400','30'),
('la loca pajareria de transilvania', 'lucha', '200','30'), 
('la loca pajareria de transilvania', 'estrategia', '200','30'),
('la loca pajareria de transilvania', 'estrategia', '300','30'),
('la loca pajareria de transilvania', 'lucha', '400','30');

-- Añadir datos clientes

	INSERT INTO clientes (nombre, email,fechaRegistro) values ('Macarena', 'daleatucuerpoalegria@gmail.com','20240808');
	INSERT INTO clientes (nombre, email,fechaRegistro) values ('Dani','daninolalies@gmail.com','20240707');
    INSERT INTO clientes (nombre,email,fechaRegistro) values ('ManuelBaltar','atodamecha@gmail.com', '20250102' );
    Insert into clientes (nombre,email,fechaRegistro)
values ('Pepe','lala@hotmail.com','2024-12-11'),('Juana','juju@hotmail.com','2025-01-02');
INSERT INTO clientes (Nombre, email, fechaRegistro) VALUES 
('John Doe', 'jdoe@email.com', '20000125'),
('Jane Smith', 'jsmith@email.com', '20000125'), 
('Alex Johnson', 'ajohnson@email.com', '20000125'),
('Mary Brown', 'mbrown@email.com', '20000125'),
('John Manuel', 'jdoe@email.com', '20000125'),
('Jane Smith', 'jsmith@email.com', '20000125'), 
('Alex Johnson', 'ajohnson@email.com', '20000125'),
('Mary Brown', 'mbrown@email.com', '20000125');
    
-- Añadir datos a tabla Juegos
insert into juegos (nombre, categoria, precio, stock) values ('Dixit', 'estrategia', 25.95, 3),('Catan', 'estrategia', 44.95, 11);
insert into juegos (nombre, categoria, precio, stock) values ("Virus", "estrategia", 19.95, 6);

-- Añadir datos a tabla Clientes 
insert into Clientes (nombre, email, fechaRegistro) 
values 
('Manuela Lopez', 'manoli@gmail.com', '20230417'), 
('Juan Perez', 'juanillo@gmail.com', '20250104'), 
('Pepa Antunez', 'pepita@hotmail.com', '20241123');
