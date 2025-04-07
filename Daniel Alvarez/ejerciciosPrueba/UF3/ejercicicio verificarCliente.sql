CREATE DEFINER=`root`@`localhost` PROCEDURE `VerificarCliente`(IdCliente int)
BEGIN  
declare existe int;
Select count(ID) into existe from clientes where IdCliente = clientes.ID;
if existe = 1 then
   select 'El cliente existe';
else
   select 'El cliente no existe';
end if;
END