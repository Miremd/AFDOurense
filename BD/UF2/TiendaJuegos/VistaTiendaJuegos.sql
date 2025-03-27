CREATE VIEW `clientes-pedidos` AS
SELECT  clientes.id AS Id_cliente, nombre, email,fechaRegistro, pedidos.ID AS Id_pedido, fecha_pedido
FROM clientes, pedidos
WHERE clientes.id = pedidos.ID_cliente
ORDER BY clientes.id
