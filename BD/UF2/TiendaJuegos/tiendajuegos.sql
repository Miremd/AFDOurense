create database if not exists tiendajuegos;
use tiendajuegos;

create table juegos (
	idJuego int,
	nombreJuego varchar(50)
);
      
      -- Creamos tabla Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
	idPedido INT 
    

);
-- Usamos el ALTER TABLE, a ver que pasa...

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


CREATE TABLE detalle_pedidos (
    id_detalle int primary key auto_increment
    
);


