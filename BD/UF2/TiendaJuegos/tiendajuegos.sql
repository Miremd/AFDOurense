-- eliminar base de datos si estoy en pruebas
-- descomentar la siguiente linea siempre que no haya datos
drop  database if exists  tiendajuegos;

-- crear y poner en uso base de datos
create database if not exists tiendajuegos;
use tiendajuegos;

-- datos de tabla juegos
create table if not exists juegos (
	idJuego int,
	nombreJuego varchar(50)
);

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

-- Ponemos Clave primaria
Alter table juegos
add constraint auto_increment primary key (ID);

 -- Creamos tabla Pedidos            
CREATE TABLE if not exists Pedidos (
	idPedido INT

);

-- Usamos el ALTER TABLE  en tabla Pedidos, a ver que pasa...

ALTER TABLE Pedidos 
CHANGE COLUMN IdPedido ID INT;
ALTER TABLE Pedidos
MODIFY COLUMN ID INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Pedidos 
ADD COLUMN ID_cliente INT;
ALTER TABLE Pedidos
ADD COLUMN fecha_pedido DATE;

-- Crear tabla Clientes
create table if not exists Clientes (
	idCliente int, 
    nombre varchar(50)
);
--  Modificaciones de la tabla Clientes
alter table Clientes 
change column idCliente ID int;
alter table Clientes
modify column ID int primary key auto_increment;
alter table Clientes
add column email varchar(50);
alter table Clientes
add column fechaRegistro date;

-- Aqui empieza la tabla detalle_pedidos

CREATE TABLE if not exists detalle_pedidos (
    id_detalle int primary key auto_increment
);

-- Modificaciones en detalle pedidos para añadir columnas
ALTER TABLE detalle_pedidos change COLUMN id_detalle ID int;
ALTER TABLE detalle_pedidos ADD ID_pedido INT;
ALTER TABLE detalle_pedidos ADD cantidad INT;
ALTER TABLE detalle_pedidos ADD ID_juego INT;

alter table detalle_pedidos add constraint fk_pedido foreign key(ID_pedido) references pedidos(ID) on delete cascade;
alter table detalle_pedidos add constraint fk_juegos foreign key (ID_juego) references juegos(ID);


