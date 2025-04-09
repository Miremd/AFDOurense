CREATE PROCEDURE `GestionarPedidoConInforme` (codCliente int, codJue int, cantJueg int)
BEGIN
if (Verificar_cliente(codCliente)) = 0 THEN
SELECT ('Error, el cliente no existe');
else 
if (verificar_juego(codJue)) = 0 THEN
SELECT ('Error, el juego no existe');
else
select ('El cliente y el juego existen' );
   
end if;
end if;



END