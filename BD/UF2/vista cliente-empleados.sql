CREATE VIEW `cliente-pedidos` AS 
select clientes.id as  ID_cliente,nombre, email, fechaRegistro,pedidos.id as ID_pedido, fecha_pedido
from clientes,pedidos
where clientes.id = pedidos.id_cliente
order by clientes.id;