-- Crear base de datos de tienda Online
CREATE DATABASE IF NOT EXISTS TiendaOnline;
USE TiendaOnline;

-- crear tablas
create table if not exists Productos (
	id_producto INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
    );
    
create table if not exists Clientes (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL
    );
    
create table if not exists Pedidos ( 
	id_pedido INT PRIMARY KEY AUTO_INCREMENT, 
	id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    fecha_pedido DATE NOT NULL
    );
    
create table if not exists DetallePedidos (
	id_detalle INT PRIMARY KEY AUTO_INCREMENT,
	id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    id_producto INT, 
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    cantidad INT NOT NULL
    );
    
-- Insetar valores en la tabla Productos
INSERT INTO Productos (nombre, precio, stock) values ("martillo", 5.95, 20);  
INSERT INTO Productos (nombre, precio, stock) values ("sierra", 10.90, 10); 
INSERT INTO Productos (nombre, precio, stock) values ("clavos", 0.45, 200); 
INSERT INTO Productos (nombre, precio,stock) values ("tuercas", 0.45, 350);
-- Insertar datos en tabla Clientes 
insert into Clientes (nombre, email) values ("Pepe Viruela", "viruelilla@gmail.com");
insert into Clientes (nombre, email) values ("Maria Viruela", "viruelilla2@gmail.com");

-- Hacer select 
SELECT * FROM Clientes;