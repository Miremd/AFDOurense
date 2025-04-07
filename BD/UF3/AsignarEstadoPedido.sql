CREATE PROCEDURE `AsignarEstadoPedido` (numPedido int)
BEGIN
DECLARE numDias  int;

SElect datediff(curdate(),fecha_pedido) into numDias
From  Pedidos
Where Id=numPedido;

IF numDias <  3 THEN
SELect concat('Pedido: ',numPedido,' su estado es Pendiente  porque se hizo hace ', numDias,' dias');
ELSEIF numDias<7 THEN
SELect concat('Pedido: ',numPedido,' su estado es En camino  porque se hizo hace ', numDias,' dias');
ELSE 
SELect concat('Pedido: ',numPedido,' su estado es Entregado  porque se hizo hace ', numDias,' dias');
END IF;

END
