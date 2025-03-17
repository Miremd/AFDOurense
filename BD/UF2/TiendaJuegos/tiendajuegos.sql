create database if not exists tiendajuegos;
use tiendajuegos;

create table juegos (
	idJuego int,
	nombreJuego varchar(50)
);
                    
CREATE TABLE Pedidos (
	idPedido INT

);

-- Crear tabla Clientes
create table if not exists Clientes (
	idCliente int, 
    nombre varchar(50)
);

-- Aqui empieza la tabla detalle_pedidos
CREATE TABLE detalle_pedidos (
    id_detalle int primary key auto_increment
);

-- Modificaciones oara añadir columnas
ALTER TABLE detalle_pedidos change COLUMN id_pedidos ID int primary key auto_increment;
ALTER TABLE detalle_pedidos ADD cantidad INT;


