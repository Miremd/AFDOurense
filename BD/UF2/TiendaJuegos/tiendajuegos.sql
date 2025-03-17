create database tiendajuegos;
use tiendajuegos;

-- Crear tabla Clientes
create table if not exists Clientes (
	idCliente int, 
    nombre varchar(50)
);