CREATE DEFINER=`root`@`localhost` PROCEDURE `VerificarCliente`(cliente int)
BEGIN
DECLARE existe int;
SELECT COUNT(ID) INTO existe FROM Clientes WHERE ID= cliente;
IF existe = 1 THEN 
SELECT CONCAT('El cliente ', cliente, 'ya existe ');
ELSE SELECT CONCAT('El cliente ', cliente, 'no existe');
END IF;
END