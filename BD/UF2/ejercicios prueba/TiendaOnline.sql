--  primero creo la base de datos y la pongo en uso antes de crearle sus tablas
CREATE DATABASE TiendaOnline;
USE TiendaOnline;

-- Empiezo a crear las tablas
CREATE TABLE Productos (
	id_producto  INT primary key  auto_increment,
	nombre  VARCHAR (100)  Not  Null,
	precio DECIMAL(10,2) Not Null,
	stock  INT  not  null
);

Create table    Clientes (
	id_cliente INT  auto_increment,
    nombre  varchar(100) not null,
    email varchar (100)  unique  not null,
    Primary  key (id_cliente)
);

Create table Pedidos  (
	id_pedido INT  Primary  key auto_increment,
    id_cliente  int,
    fecha_pedido  date  not  null,
    foreign key (id_cliente)  references  Clientes(id_cliente)
);

create table DetallePedidos  (
	id_detalle INT Primary key auto_increment,
    id_pedido  INT ,
    id_producto INT,
    cantidad  INT NOT NULL,
    foreign key (id_pedido) references Pedidos(id_pedido),
    foreign  key (id_producto) references Productos(id_producto)
);

--  insertar datos en tabla producto
INsert into Productos (nombre,precio,stock) values  ('martillo',5.95, 20);
INsert into Productos (nombre,precio,stock) values  ('sierra',10.85, 10);
INsert into Productos (nombre,precio,stock) values  ('clavos',0.50, 200);

-- insertare datos en tabla clientes,
  insert into  Clientes (nombre, email)  values ('pepe  viruela','viruelilla@gmail.com');
  insert into  Clientes (nombre, email)  values ('maria de la oh','mariadelaoh@gmail.com');
  
  select * from Productos;
  select  * from Clientes;