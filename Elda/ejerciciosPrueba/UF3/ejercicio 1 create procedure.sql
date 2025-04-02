CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarPedido`(cliente int)
BEGIN
declare numpedido int;
insert into pedidos (Id_cliente, fecha_pedido) values (cliente,curdate());
select ID into numpedido from pedidos order by fecha_pedido desc limit 1; 
select concat ('Nuevo pedido insetado para el cliente', cliente, 'con referenciade pedido: ', numpedido);
END