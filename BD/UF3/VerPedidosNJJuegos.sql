CREATE DEFINER=`root`@`localhost` PROCEDURE `VerPedidosNJuegos`(nJuegos int)
BEGIN
Declare  numPedido int;
Declare  fechaPedido  date;
Declare numJuegosDistintos  int;
Declare cantTotal int;
Declare importe double;
Declare  fin  int default 0;

Declare recorrer cursor  for 
Select  id_pedido, fecha_pedido, count(*), sum(cantidad), sum(cantidad*precio)
From  pedidos, juegos, detalle_pedidos
Where pedidos.id =detalle_pedidos.id_pedido 
and detalle_pedidos.id_juego = juegos.id
group by  id_pedido, fecha_pedido
having count(*) > nJuegos;

Declare continue handler for not found set fin  =  1;

if fin  =  1 then
	select concat('Error, ningun pedido tiene más de :',nJuegos,' distintos');
else
	open recorrer;
    fetch recorrer into numPedido, fechaPedido, numJuegosDistintos, cantTotal, importe;
    while fin = 0 Do
		select concat('Pedido:  ',numPedido,' Fecha Pedido: ',fechaPedido,' Juegos Distintos: ',numJuegosDistintos,'  cantidad total: ',cantTotal,'  importe total:  ',importe) "Detalle pedido";
		fetch recorrer into numPedido, fechaPedido, numJuegosDistintos, cantTotal, importe;
	end while;
    close recorrer;
end if;
END