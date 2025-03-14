
create database if not exists tienda_Online;
use tienda_Online;


CREATE TABLE productos ( 
	id_producto INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR (100) NOT NULL,
	precio DECIMAL(10,2) NOT NULL,
	stock INT NOT NULL
);

CREATE TABLE clientes (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR (100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE pedidos (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT,
	fecha_pedido date not null,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
  
);

CREATE TABLE detalle_pedidos(
	id_detalle INT PRIMARY KEY AUTO_INCREMENT,
	id_pedido INT, 
    id_producto INT,
    cantidad INT NOT NULL,
	FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido),
	FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
	
);

-- Insertar datos en las tabla producto
INSERT INTO productos( nombre,precio,stock )values ("martillo", 5.95 ,20);
INSERT INTO productos( nombre,precio,stock )values ("sierra", 10.85 ,10);
INSERT INTO productos( nombre,precio,stock )values ("clavos", 50.50 ,200);

-- insertar datos en tabla clientes
INSERT INTO clientes (nombre, email)values ("Pepe Viruela","viruelilla@gmail.com");
INSERT INTO clientes (nombre, email)values ("María Cantaora ","comocantalamaria@gmail.com");

-- hacemos un Select pá fuchicar y ver las tablitas
SELECT* FROM productos;
select*from clientes;
	
