CREATE VIEW `clientes-pedidos` AS
Select clientes.id as Id_cliente, nombre, email, fechaRegistro,  pedidos.ID  as  Id_pedido, fecha_pedido
from clientes, pedidos
where clientes.id  = pedidos.ID_cliente
order by clientes.id