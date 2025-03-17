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
--  Modificaciones de la tabla Clientes

alter table Clientes 
change column idCliente ID int;
alter table Clientes
modify column ID int primary key auto_increment;
alter table Clientes
add column email varchar(50);
alter table Clientes
add column fechaRegistro date;

CREATE TABLE detalle_pedidos (
    id_detalle int primary key auto_increment
    
);


