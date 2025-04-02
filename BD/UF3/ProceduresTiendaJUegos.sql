CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarPedido`(cliente int)
BEGIN
DECLARE numpedido int;
Insert into pedidos (Id_cliente,fecha_pedido) values (cliente,curdate());
SELECT ID INTO numpedido FROM pedidos ORDER BY fecha_pedido DESC LIMIT 1;
SELECT CONCAT ('Nuevo pedido insertado para el cliente', cliente, 'con referencia de pedido:', numpedido);
END