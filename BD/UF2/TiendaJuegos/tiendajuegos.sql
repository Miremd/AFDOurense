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
