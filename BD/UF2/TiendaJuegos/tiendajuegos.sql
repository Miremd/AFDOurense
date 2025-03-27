-- eliminar base de datos si estoy en pruebas
-- descomentar la siguiente linea siempre que no haya datos
--  drop  database if exists  tiendajuegos;

-- crear y poner en uso base de datos
create database if not exists tiendajuegos;
use tiendajuegos;

-- creacion de tablas
-- crear de tabla juegos
create table if not exists juegos (
	idJuego int,
	nombreJuego varchar(50)
);

 -- Creamos tabla Pedidos            
CREATE TABLE if not exists Pedidos (
	idPedido INT
);

-- Crear tabla Clientes
create table if not exists Clientes (
	idCliente int, 
    nombre varchar(50)
);

-- Aqui empieza la tabla detalle_pedidos
CREATE TABLE if not exists detalle_pedidos (
    id_detalle int primary key auto_increment
);

-- modificaciones de tablas
-- Modificamos la tabla Juegos, Nombres de campos
alter table juegos
change column idJuego ID int;
alter table juegos
change column nombreJuego nombre varchar(50);

-- Añadimos 3 columnas nuevas
alter table juegos
add column categoria enum('puzzle', 'lucha','estrategia','roguelike');
alter table juegos
add column precio double(5,2);
alter table juegos
add column stock int;

-- Ponemos Clave primaria y autoincrement
Alter table  juegos modify ID INT auto_increment primary key;

-- Usamos el ALTER TABLE  en tabla Pedidos, a ver que pasa...
ALTER TABLE Pedidos 
CHANGE COLUMN IdPedido ID INT;
ALTER TABLE Pedidos
MODIFY COLUMN ID INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Pedidos 
ADD COLUMN ID_cliente INT;
ALTER TABLE Pedidos
ADD COLUMN fecha_pedido DATE;

--  Modificaciones de la tabla Clientes
alter table Clientes 
change column idCliente ID int;
alter table Clientes
modify column ID int primary key auto_increment;
alter table Clientes
add column email varchar(50);
alter table Clientes
add column fechaRegistro date;

-- Modificaciones en detalle pedidos para añadir columnas
ALTER TABLE detalle_pedidos change COLUMN id_detalle ID int auto_increment;
ALTER TABLE detalle_pedidos ADD ID_pedido INT;
ALTER TABLE detalle_pedidos ADD cantidad INT;
ALTER TABLE detalle_pedidos ADD ID_juego INT;

-- Modificaciones para añadir claves foraneas 
--  FK   detalle_pedidos
alter table detalle_pedidos add constraint fk_pedido foreign key(ID_pedido) references pedidos(ID) on delete cascade;
alter table detalle_pedidos add constraint fk_juegos foreign key (ID_juego) references juegos(ID);

-- FK  pedidos
ALTER TABLE Pedidos 
ADD CONSTRAINT fk_cliente
FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID);

-- Añadir datos a la tabla Juego, a ver que pasa...:/

INSERT INTO Juegos (nombre, categoria, precio, stock) values ( "Satisfyer", "lucha", 50.60, 5);
INSERT INTO Juegos (nombre, categoria, precio, stock) values ("Columpio Infernal","lucha", 150.70,4);
INSERT INTO Juegos( nombre, categoria, precio, stock) values ("Esposas","lucha",20.05,5);
INSERT INTO Juegos (nombre, categoria,precio,stock) values ("Juegos del hambre","estrategia",30.80,5);
Insert into juegos (nombre,categoria,precio,stock)
values ('The binding of Isaac','roguelike',20,100),('Baba is you','puzzle',30.78,200);
INSERT INTO juegos (nombre, categoria, precio, stock) VALUES
('la loca pajareria de transilvania', 'lucha', '200','30'), 
('la loca pajareria de transilvania', 'estrategia', '200','30'),
('la loca pajareria de transilvania', 'estrategia', '300','30'),
('la loca pajareria de transilvania', 'lucha', '400','30'),
('la loca pajareria de transilvania', 'lucha', '200','30'), 
('la loca pajareria de transilvania', 'estrategia', '200','30'),
('la loca pajareria de transilvania', 'estrategia', '300','30'),
('la loca pajareria de transilvania', 'lucha', '400','30');
insert into juegos (nombre, categoria, precio, stock) values ('Dixit', 'estrategia', 25.95, 3),('Catan', 'estrategia', 44.95, 11);
insert into juegos (nombre, categoria, precio, stock) values ("Virus", "estrategia", 19.95, 6);
insert into juegos (nombre, categoria, precio, stock) values ("Satisfier_2", "estrategia", 19.95, 6);
	-- Añadir datos clientes

INSERT INTO clientes (nombre, email,fechaRegistro) values ('Macarena', 'daleatucuerpoalegria@gmail.com','20240808');
INSERT INTO clientes (nombre, email,fechaRegistro) values ('Dani','daninolalies@gmail.com','20240707');
INSERT INTO clientes (nombre,email,fechaRegistro) values ('ManuelBaltar','atodamecha@gmail.com', '20250102' );
Insert into clientes (nombre,email,fechaRegistro)
values 
('Pepe','lala@hotmail.com','2024-12-11'),
('Juana','juju@hotmail.com','2025-01-02');
INSERT INTO clientes (Nombre, email, fechaRegistro) VALUES 
('John Doe', 'jdoe@email.com', '20000125'),
('Jane Smith', 'jsmith@email.com', '20000125'), 
('Alex Johnson', 'ajohnson@email.com', '20000125'),
('Mary Brown', 'mbrown@email.com', '20000125'),
('John Manuel', 'jdoe@email.com', '20000125'),
('Jane Smith', 'jsmith@email.com', '20000125'), 
('Alex Johnson', 'ajohnson@email.com', '20000125'),
('Mary Brown', 'mbrown@email.com', '20000125');
insert into Clientes (nombre, email, fechaRegistro) 
values 
('Manuela Lopez', 'manoli@gmail.com', '20230417'), 
('Juan Perez', 'juanillo@gmail.com', '20250104'), 
('Pepa Antunez', 'pepita@hotmail.com', '20241123');

-- Añadir datos a tabla pedidos

insert into pedidos (ID_cliente, fecha_pedido) 
values 
(14, '20240417'), 
(15, '20230104'), 
(16, '20221123');
insert into Pedidos (id_cliente,fecha_pedido)
values 
(1,'2024-03-31'),
(2,'2024-03-22'),
(1,'2025-01-12');
insert into pedidos (ID_cliente, fecha_pedido) 
values 
(3, '20241002'), 
(15, '20250215'), 
(8, '20241212'), 
(15, '20250302'), 
(1, '20231129'), 
(13, '20240823');
INSERT INTO pedidos (ID_cliente, fecha_pedido) VALUES (4,'20240708');
INSERT INTO pedidos (ID_cliente, fecha_pedido) VALUES (9,'20241111');
INSERT INTO pedidos (ID_cliente, fecha_pedido) VALUES (12,'20240508');


-- insert de detalles pedidos
INSERT INTO detalle_pedidos (ID_pedido, ID_juego, cantidad) VALUES (3,16,5);
INSERT INTO detalle_pedidos (ID_pedido, ID_juego, cantidad) VALUES (2,4,8);
INSERT INTO detalle_pedidos (ID_pedido, ID_juego, cantidad) VALUES (4,6,9);
INSERT INTO detalle_pedidos (ID_pedido, ID_juego, cantidad) VALUES (1,2,10);
insert into detalle_pedidos (ID_pedido, cantidad, ID_juego) 
values 
(8, 2, 4), 
(12, 1, 17), 
(14, 3, 9), 
(2, 2, 6), 
(6, 1, 15), 
(11, 5, 11);

INSERT INTO detalle_pedidos (ID_pedido,cantidad,ID_juego)
values
(3,2,5),
(3,5,1),
(5,10,6);


INSERT INTO detalle_pedidos (ID_pedido, cantidad, ID_juego) 
VALUES 
(1,35,1),
(1,34,2),
(1,45,3),
(2,27,4),
(3,28,5),
(3,28,6),
(1,28,7),
(1,35,1),
(1,34,2),
(1,45,3),
(2,27,4),
(3,28,5),
(3,28,6),
(1,28,7);
use tiendajuegos;
-- Select's
desc juegos;

select nombre from juegos where categoria like 'estrategia';
--
select * from juegos where precio > 40;

select * from clientes where fechaRegistro < '20240101';

select * from clientes where year(fechaRegistro) < 2024;

select * from clientes where email like '%@gmail.com' and like year(fechaRegistro) > 2024  ;
describe clientes;

select * from pedidos where ID_cliente = 15;

select * from pedidos where  fecha_pedido BETWEEN '20250301' AND '20250331';

select *  from detalle_pedidos;

select id_juego as juego  from detalle_pedidos where cantidad > 1;


select ID_juego, sum(cantidad) as Cantidad_de_Suma from detalle_pedidos group by (ID_juego);


select * from detalle_pedidos where 'ID_pedido' = 1; 
-- Contar los juegos de la tabla juegos;

select count(*) from juegos;

select count(*) from juegos where categoria  = "puzzle"; 
select sum(stock) as Suma_del_stock from juegos where nombre like '%pajarería_';

--
select * from pedidos;

-----------------------------------

select nombre as Nombre_de_juegos_pedidos from juegos where id 
	in
		( select distinct Id_juego  from detalle_pedidos );



select * from juegos;
select distinct Id_juego from detalle_pedidos;

------------------------------------
select nombre, precio  from juegos order by (precio) asc;
---------------------------------------------------------
select * from juegos where 'strock' < 5;

-------------------------------------------------------
select * from pedidos;
select count(ID) as Contablilidad_de_pedidos, id_cliente  from pedidos group by ID_cliente;

----------------------------------------------------------------------------------------
-- Consulta 18  

use tiendajuegos;
/* Listar los juegos mas caros de cada categoria.*/
 
SELECT j.ID, j.nombre, j.categoria, j.precio
FROM juegos j
JOIN ( SELECT categoria, MAX(precio) AS max_precio
    FROM juegos
    GROUP BY categoria
) max_juegos ON j.categoria = max_juegos.categoria AND j.precio = max_juegos.max_precio;

/**/


select *  from clientes where ID in ( select distinct id_cliente  from pedidos);

-- 16
/*contar cuaNtos pedidos ha realizado cada cliente, */


select distinct clientes.* from clientes join pedidos on clientes.id = pedidos.id_cliente;


/*Actualizar la fecha de registro de un cliente:*/
UPDATE clientes
SET fechaRegistro = '2025-03-19'
WHERE nombre = 'Macarena';
update clientes set nombre = 'Dani' where fecha_registro = "2025-03-19"; 
UPDATE juegos
SET nombre = 'Juego de Esposas'
WHERE nombre = '';
UPDATE juegos
SET stock = 50
WHERE nombre = 'Columpio Infernal';
select count(nombre) from juegos where stock = '%5';

select * from clientes;

/*Modificar el nombre de un juego (por ejemplo, cambiar de 'Esposas' a 'Juego de Esposas'):*/

UPDATE juegos
SET nombre = 'Juego de Esposas'
WHERE nombre = 'Esposas';

/*Modificar el nombre de un juego (por ejemplo, cambiar de 'Esposas' a 'Juego de Esposas')*/

select * from juegos where nombre = 'Juego de Esposas' or nombre = 'Esposas';


/*4. Buscar los juegos que no se han vendido en ningún pedido
Esta consulta te devuelve los juegos que no han sido comprados en ningún pedido. Es útil para ver qué juegos pueden estar en inventario pero no se están vendiendo.*/
SELECT j.nombre
FROM juegos j
LEFT JOIN detalle_pedidos dp ON j.ID = dp.ID_juego
WHERE dp.ID_juego IS NULL;

/*9. Ver el pedido más reciente de cada cliente
Esta consulta muestra el pedido más reciente realizado por cada cliente.*/

SELECT p.ID AS pedido_id, p.ID_cliente, c.nombre AS cliente, p.fecha_pedido
FROM pedidos p
JOIN clientes c ON p.ID_cliente = c.ID
WHERE p.fecha_pedido = (
    SELECT MAX(fecha_pedido)
    FROM pedidos
    WHERE ID_cliente = p.ID_cliente
)
ORDER BY p.ID_cliente;

/*10. Encontrar los juegos con el precio promedio más alto en cada categoría
Esta consulta obtiene el precio promedio de los juegos por categoría, ordenados de mayor a menor.*/
SELECT j.categoria, AVG(j.precio) AS precio_promedio
FROM juegos j
GROUP BY j.categoria
ORDER BY precio_promedio DESC;

/*6. Obtener los juegos que no han sido comprados por ningún cliente
Usamos LEFT JOIN para obtener todos los juegos, y luego filtramos aquellos que no han tenido compras (es decir, aquellos que no tienen registros en detalle_pedidos).*/
SELECT j.nombre
FROM juegos j
LEFT JOIN detalle_pedidos dp ON j.ID = dp.ID_juego
WHERE dp.ID_juego IS NULL;

/*7. Listar los juegos más vendidos (por cantidad) junto con el nombre del cliente que los compró
Esta consulta utiliza JOIN entre varias tablas para ver cuáles son los juegos más vendidos y los clientes que los han comprado, ordenados por la cantidad de cada juego comprado.*/
SELECT j.nombre AS juego, c.nombre AS cliente, SUM(dp.cantidad) AS total_vendido
FROM detalle_pedidos dp
JOIN juegos j ON dp.ID_juego = j.ID
JOIN pedidos p ON dp.ID_pedido = p.ID
JOIN clientes c ON p.ID_cliente = c.ID
GROUP BY j.nombre, c.nombre
ORDER BY total_vendido DESC;

/*8. Obtener los pedidos con más de 3 juegos diferentes, incluyendo los juegos y la cantidad
Esta consulta usa JOIN para combinar las tablas de pedidos y detalles de pedidos, mostrando solo aquellos pedidos que contienen más de tres juegos diferentes.*/

SELECT p.ID AS pedido_id, c.nombre AS cliente, COUNT(DISTINCT dp.ID_juego) AS juegos_distintos
FROM pedidos p
JOIN clientes c ON p.ID_cliente = c.ID
JOIN detalle_pedidos dp ON p.ID = dp.ID_pedido
GROUP BY p.ID, c.nombre
HAVING juegos_distintos > 3
ORDER BY juegos_distintos DESC;
/*10. Obtener la cantidad total de juegos vendidos por cada categoría de juego
Esta consulta muestra la cantidad total de juegos vendidos en cada categoría, utilizando JOIN para combinar las tablas detalle_pedidos y juegos.*/


SELECT j.categoria, SUM(dp.cantidad) AS total_vendido
FROM detalle_pedidos dp
JOIN juegos j ON dp.ID_juego = j.ID
GROUP BY j.categoria
ORDER BY total_vendido DESC;

/*11. Obtener los clientes que compraron un juego específico (por ejemplo, "Satisfyer")
Esta consulta busca todos los clientes que han comprado un juego específico, como "Satisfyer".*/
SELECT c.nombre AS cliente, c.email, p.fecha_pedido
FROM clientes c
JOIN pedidos p ON c.ID = p.ID_cliente
JOIN detalle_pedidos dp ON p.ID = dp.ID_pedido
JOIN juegos j ON dp.ID_juego = j.ID
WHERE j.nombre = 'Satisfyer'
ORDER BY p.fecha_pedido;

/*Eliminar todos los registros de todas las tablas (con orden correcto):
Si deseas truncar todas las tablas de la base de datos, necesitas seguir el orden correcto debido a las restricciones de claves foráneas (como las relaciones entre las tablas). Debes truncar primero las tablas dependientes y luego las tablas referenciadas. Aquí te muestro cómo hacerlo:*/


SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE detalle_pedidos;
TRUNCATE TABLE pedidos;
TRUNCATE TABLE clientes;
TRUNCATE TABLE juegos;
SET FOREIGN_KEY_CHECKS = 1;

select * from detalle_pedidos;
select * from pedidos;
select * from clientes;
select * from juegos;


SELECT CONVERT(DATE, '31-12-2019', 105) AS Fecha;

SELECT VERSION();
SELECT MD5('test');

drop database if exists tiendajuegos;

/*Subconsultas SQL*/


-- Seleccciona los nombres 
select nombre as nombre ,precio from juegos where precio > (select avg(precio) from juegos);

select nombre from juegos where stock < (select avg(stock) from juegos);


-- Seleccionar los clientes que no han relizado ningun pedido

select *  from  clientes where id not in (select id_cliente from pedidos where email like '____@gmail.com');


select * from juegos where precio > (select max(precio) from juegos where categoria like 'puzzle');


select year(fechaRegistro) as fecharegistro , nombre  from clientes where year(fechaRegistro) = (select year(fechaRegistro) from clientes where id = 1);



select * from juegos where stock > (select stock from juegos order by precio desc limit 1);

describe detalle_pedidos;



select id_pedido, sum(cantidad) from detalle_pedidos group by (id_pedido) having(cantidad) > 2*(select avg(cantidad) from detalle_pedidos);

select * from clientes where email ;



/*Mostrar los juegos más vendidos en el último mes:*/ 
SELECT j.nombre, SUM(dp.cantidad) AS total_vendido
FROM detalle_pedidos dp
JOIN juegos j ON dp.ID_juego = j.ID
JOIN pedidos p ON dp.ID_pedido = p.ID
WHERE p.fecha_pedido BETWEEN '2025-02-01' AND '2025-02-28'
GROUP BY j.nombre
ORDER BY total_vendido DESC;


/*Encontrar los clientes que no han realizado un pedido en el último año: */

SELECT c.nombre, c.email
FROM clientes c
LEFT JOIN pedidos p ON c.ID = p.ID_cliente
WHERE p.fecha_pedido < '2024-03-19' OR p.ID IS NULL;

/*29  muestra los pedidos que sean superior a 100€ */
desc pedidos;

desc detalle_pedidos;

SELECT 
    ID_pedido,
    c.nombre AS cliente,
    p.fecha_pedido,
    SUM(j.precio * dp.cantidad) AS total
FROM 
    Pedidos p
JOIN 
    Clientes c ON p.ID_cliente = c.ID
JOIN 
    detalle_pedidos dp ON p.idPedido = dp.ID_pedido
JOIN 
    juegos j ON dp.ID_juego = j.ID
GROUP BY 
    p.idPedido, c.nombre, p.fecha_pedido
HAVING 
    total_pedido > 100;

-- 32
select max(precio) - min(precio) as Diferencia_juego from juegos;


-- 33 
select  nombre from juegos where nombre like  'S__________';

-- 34 
use tiendajuegos;

select id, fecha_pedido from pedidos where fecha_pedido >= now() - interval 3 year;




    
    
    
