create database if not exists tienda_Online;
USE tienda_Online;

-- Create table for Clients
CREATE TABLE producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (100) NOT NULL,
    precio DECIMAL (10,2) NOT NULL,
    stock INT NOT NULL
)

-- Create table for Clientes;

CREATE TABLE clientes(
    id_cliente INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) unique not null,
    primary key (id_cliente)
);
-- Create table for pedido;
CREATE TABLE pedidos(
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
	fecha DATE NOT NULL,
    foreign key (id_cliente) references clientes(id_cliente)
)
CREATE TABLE detalle_pedidos(
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_producto INT,
    cantidad int not null,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);




use tienda_Online;
drop database if exists tienda_Online;


-- INSET INTO Productos--

INSERT INTO Productos (nombre,precio,stock) VALUES ('martillo', 5.95, 20);
INSERT INTO Productos (nombre,precio,stock) VALUES ('sierra', '10.85',10);
INSERT INTO Productos (nombre,precio,stock) VALUES ('clavos', '0.50', 200);
INSERT INTO Productos (nombre,precio,stock) VALUES ('tuercas', '0.50',300);
-- INSET INTO Clientes--

INSERT INTO cliente (nombre, email) VALUES ('Pepe Virieruela', 'viruela@gmail.com');
INSERT INTO cliente (nombre, email) VALUES ('Maria de la Oh', 'maria@gmail.com');
INSERT INTO cliente (nombre, email) VALUES ('Manuel Fernandez', 'manuel.man@gmail.com');



















CREATE TABLE pedidos(     id_pedido INT PRIMARY KEY AUTO_INCREMENT,     id_cliente INT,  fecha DATE NOT NULL,     foreign key (id_cliente) references clientes(id_cliente) ) CREATE TABLE detalle_pedidos(     id_detalle INT PRIMARY KEY AUTO_INCREMENT,     id_pedido INT,     id_producto INT,     cantidad int not null,     FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),  FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ) use tienda_Online
