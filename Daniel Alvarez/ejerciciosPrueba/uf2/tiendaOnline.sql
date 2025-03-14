DROP DATABASE TiendaOnline;
CREATE DATABASE if not exists TiendaOnline;
 USE TiendaOnline;
 CREATE table Productos (id_producto int auto_increment,
						 nombre varchar(100) not null,
						 precio decimal(10,2) not null,
                         stock int not null,
				PRIMARY KEY (id_producto));
CREATE table Clientes (id_cliente int auto_increment,
						 nombre varchar(100) not null,
						 email varchar(100) not null,
				PRIMARY KEY (id_cliente));
CREATE table Pedidos (id_pedido int auto_increment,
						 id_cliente int,
                         fecha_pedido date not null,
				PRIMARY KEY (id_pedido),
                FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente));
CREATE table DetallePedidos (id_detalle int auto_increment,
						 id_pedido int,
						 id_producto int,
                         cantidad int not null,
				PRIMARY KEY (id_detalle),
                FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
                FOREIGN KEY (id_producto) REFERENCES Productos(id_producto));
                
-- INSERTAR EN PRODUCTOS
INSERT INTO Productos (nombre,precio,stock)
VALUES                ('Estante',20,5);
INSERT INTO Productos (nombre,precio,stock)
VALUES                ('clavos',0.50,100);
INSERT INTO Productos (nombre,precio,stock)
VALUES                ('cuchara',1,45);
-- INSERTAR EN CLIENTES
INSERT INTO Clientes (nombre,email)
VALUES	             ('Pepe','tutu@hotmail.com');
INSERT INTO Clientes (nombre,email)
VALUES	             ('Juan','toto@hotmail.com');
INSERT INTO Clientes (nombre,email)
VALUES	             ('Luis','titi@hotmail.com');

SELECT * FROM Productos;
SELECT * FROM Clientes;