create database if not exists tiendajuegos;
use tiendajuegos;

-- datos de tabla juegos
create table if not exists juegos (
	idJuego int,
	nombreJuego varchar(50)
);

-- Modificamos Nombres de campos
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
                    
CREATE TABLE if not exists Pedidos (
	idPedido INT

);

-- Crear tabla Clientes
create table if not exists Clientes (
	idCliente int, 
    nombre varchar(50)
);

-- Aqui empieza la tabla detalle_pedidos
CREATE TABLE detalle_pedidos (

CREATE TABLE if not exists detalle_pedidos (
    id_detalle int primary key auto_increment
);

-- Modificaciones oara añadir columnas
ALTER TABLE detalle_pedidos change COLUMN id_pedidos ID int primary key auto_increment;
ALTER TABLE detalle_pedidos ADD cantidad INT;


