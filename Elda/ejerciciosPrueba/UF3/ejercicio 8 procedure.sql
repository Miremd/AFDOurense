CREATE DEFINER=`root`@`localhost` PROCEDURE `VerificarCliente`(cliente int)
BEGIN 
declare existe int;
select count(ID) into existe from clientes where ID = cliente; 
if existe =1 then 
select concat('El cliente ',cliente,' ya existe'); 
else select concat('El cliente ',cliente,' no existe');
end if;  
END