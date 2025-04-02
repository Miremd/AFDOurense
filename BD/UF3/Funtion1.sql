CREATE DEFINER=`root`@`localhost` FUNCTION `new_function`(pedido int) RETURNS int
    DETERMINISTIC
BEGIN
	declare total float;
	select sum(cantidad * precio) into total from detalle_pedido, Juegos where Detalle_Pedidos.id_juegos= Id_juegos = ID  and Detalle_Pedido.Id_pedido=pedido;

RETURN total;
END