CREATE PROCEDURE `registrarPedido` (cliente  int)
BEGIN
DECLARE numpedido int;
Insert into pedidos  (Id_cliente, fecha_pedido) values (cliente,curdate());
SELECT  ID  INTO  numpedido  FROM pedidos order by fecha_pedido DESC  LIMIT  1;
SELECT  CONCAT ('Nuevo pedido insertado  para el cliente ', cliente, ' con referencia de pedido: ',numpedido);
END
