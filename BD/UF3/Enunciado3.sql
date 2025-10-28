CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularTotalPedido`(pedido  int) RETURNS float
    DETERMINISTIC
BEGIN
DECLARE total  float;
SELECT  sum(cantidad*precio) INTO total
From  detalle_pedidos, juegos 
WHERE detalle_pedidos.id_juego=juegos.id  
and  detalle_pedidos.id_pedido=pedido;
RETURN total;
END