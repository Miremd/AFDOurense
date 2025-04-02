CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularTotalPedido`(pedido int) RETURNS float
    DETERMINISTIC
BEGIN
DECLARE total FLOAT; 
SELECT sum(cantidad*precio) INTO total
FROM detalle_pedidos,juegos 
WHERE detalle_pedidos.id_juego=juegos.id
AND detalle_pedidos.id_pedido=pedido;
RETURN total;
END