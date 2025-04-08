-- Crea una función llamada TotalPedidosPorRango que reciba dos 
-- fechas y devuelva la cantidad total de pedidos registrados en ese período. 
CREATE FUNCTION `TotalPedidosPorRango` (fecha1 date, fecha2 date)
RETURNS INT deterministic
BEGIN
declare total int; 
select count(*) into total from pedidos 
where fecha_pedido between fecha1 and fecha2; 
RETURN total;
END
