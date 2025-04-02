CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularTotalPedido`(pedido int) RETURNS float
    DETERMINISTIC
BEGIN
declare total float;
select sum(cantidad*precio) into total from detalle_pedidos, juegos 
where detalle_pedidos.id_juego=juegos.ID 
and detalle_pedidos.id_pedido=pedido;
RETURN total;
END