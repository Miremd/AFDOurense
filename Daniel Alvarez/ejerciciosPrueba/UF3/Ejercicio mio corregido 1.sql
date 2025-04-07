CREATE DEFINER=`root`@`localhost` FUNCTION `DineroGastadoAno`(Identificador int) RETURNS double
    DETERMINISTIC
BEGIN
declare numped,numcanti,numjuego int;
declare total,dinero double;
		
-- Con esto se Que id de pedidos compraron en el año actual
select  pedidos.ID into numped
from pedidos
join clientes on clientes.ID = pedidos.ID_cliente 
where year(fecha_pedido)= year(curdate()) and pedidos.ID_cliente = Identificador order by fecha_pedido asc limit 1;

-- Con esto se que cantidad de juegos compraron de ese tipo
select detalle_pedidos.cantidad into numcanti
from pedidos 
join detalle_pedidos on pedidos.ID= detalle_pedidos.ID_pedido
where detalle_pedidos.ID_pedido = numped;

-- Con esto se que id de juego han comprado.
select detalle_pedidos.ID_juego into numjuego
from pedidos 
join detalle_pedidos on pedidos.ID= detalle_pedidos.ID_pedido
where detalle_pedidos.ID_pedido = numped;

-- Con esto se el precio de cada uno de los juegos 
select juegos.precio into dinero
from juegos
join detalle_pedidos on detalle_pedidos.ID_juego=juegos.ID
where juegos.ID = numjuego and detalle_pedidos.ID_pedido = numped;

-- multiplico variables para saber el dinero total
set total = numcanti*dinero;

return total;
END