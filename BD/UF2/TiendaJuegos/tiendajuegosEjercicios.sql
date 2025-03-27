use tiendajuegos;

-- muestra los pedidos donde la cantidad de juegos comprados sea un numero par (dos maneras de hacerlo)
	SELECT *
	FROM detalle_pedidos
	WHERE MOD(cantidad, 2) = 0;
    
    SELECT Id_pedido, sum(cantidad), (sum(cantidad)% 2) AS 'mecagoenlaostia'
    FROM detalle_pedidos
    GROUP BY id_pedido
    HAVING(sum(cantidad)% 2) = 0
    
-- Encuentra los pedidos realizados los ultimos 30 dias
	SELECT * 
	FROM Pedidos 
	WHERE fecha_pedido >= CURDATE() - INTERVAL 30 DAY;
-- encuentra el numero total de juegos vendidos
	SELECT SUM(cantidad) AS total_juegos_vendidos
	FROM detalle_pedidos;
-- seleccionar los nombres de juegos que tienen un precio mayor al precio promedio de todos los juegos
	SELECT nombre
	FROM juegos
	WHERE precio > (SELECT AVG(precio) FROM juegos);
-- Seleccionar los nombres de los juegos que tienen un precio mayor al precio promedio de todos los juegos.
	SELECT *
	FROM juegos
	WHERE precio > (SELECT AVG(precio) FROM juegos);
-- Seleccionar los clientes que han realizado más de dos pedidos
	SELECT ID_cliente, COUNT(*) AS num_pedidos
	FROM Pedidos
	GROUP BY ID_cliente
	HAVING COUNT(*) > 2;
-- otra forma de hacerlo
	SELECT c.ID, c.nombre, COUNT(p.ID) AS num_pedidos
	FROM Clientes c
	JOIN Pedidos p ON c.ID = p.ID
	GROUP BY ID_cliente
	HAVING COUNT(p.ID) > 2;

