CREATE VIEW `clientes-pedidos` AS
select clientes.ID as Id_cliente, nombre, email, fechaRegistro, pedidos.ID as Id_pedido, fecha_pedido
from clientes, pedidos 
where clientes.ID = pedidos.ID_cliente 
order by clientes.id