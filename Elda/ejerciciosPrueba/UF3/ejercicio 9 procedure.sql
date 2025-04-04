CREATE DEFINER=`root`@`localhost` PROCEDURE `AsignarEstadoPedido`(pedido int)
BEGIN 
declare dias int; 
select datediff(curdate(), fecha_pedido) into dias from pedidos where ID = pedido; 
if dias <3 then 
select ('Pedido pendiente'); 
elseif dias <7 then 
select ('Pedido en camino'); 
else 
select ('pedido entregado'); 
end if; 
END