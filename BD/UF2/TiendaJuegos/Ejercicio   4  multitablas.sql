-- EJERCICIO 4
--  Enunciado  26
Select  ID_Pedido, sum((cantidad  *  precio)) as total
From  detalle_pedidos, juegos
Where detalle_pedidos.ID_juego  = juegos.ID
group by id_pedido
having total > 100
order by id_pedido;

Select  ID_Pedido, sum((cantidad  *  precio)) as total
From  detalle_pedidos
inner JOIN juegos
ON detalle_pedidos.ID_juego  = juegos.ID
group by id_pedido
having total > 100
order by id_pedido;

-- Enunciado 29
Select sum(subtotal)  
FROM 
(Select juegos.ID, sum(cantidad)*precio as subtotal
From detalle_pedidos,juegos
Where detalle_pedidos.ID_juego  = juegos.ID
group by ID_juego)  as subconsulta;

Select sum(detalle_pedidos.cantidad*juegos.precio) as total_pedidos
From detalle_pedidos
Join juegos
on  detalle_pedidos.ID_juego  = juegos.ID;

select sum(cantidad*precio) as total 
from detalle_pedidos
join juegos
on detalle_pedidos.ID_juego  = juegos.ID;

-- Enunciado 32
Select max(precio) - min(precio)
From  juegos;

-- Enunciado  33
Insert into juegos (nombre) values ('ABCDEFGHIJ');

Select nombre 
From juegos
where nombre like 'A________J';

-- Enunciado  34
SELECT id, fecha_pedido
FROM pedidos
WHERE fecha_pedido >= CURDATE() - INTERVAL 3 DAY;

-- 40
select  Id_pedido as 'pedidos con cantidad par'  -- mod(cantidad, 2)   as resto
from detalle_pedidos
group by id_pedido
having(sum(cantidad) % 2)=0;

-- Enunciados con mayor dificultad
-- Enunciado 1

Select  *  
from juegos
where precio > (select avg(precio)  from juegos);

-- Enunciado 2
Select nombre, count(pedidos.ID)
from clientes,  pedidos
Where clientes.Id = pedidos.Id_cliente  
group by ID_cliente
having count(pedidos.ID) >  2;

Select nombre, count(pedidos.ID)
From clientes
Join  pedidos
On clientes.Id = pedidos.Id_cliente  
group by ID_cliente
having count(pedidos.ID) >  2

-- 

