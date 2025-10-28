CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularDescuentoCliente3`( cliente int) RETURNS int
    DETERMINISTIC
BEGIN
-- declaracion de variables
DECLARE antig int; -- variable para almacenar la antigüedad del cliente
DECLARE porcen int;

SELECT  (year(curdate()) - year(fechaRegistro))  INTO  antig
From clientes
WHERE ID  =  cliente;

case  antig
when 0 then
set  porcen=5;
when 1 then
set  porcen=5;
when 2 then
set porcen =10;
when 3 then
set porcen =10;
Else
set porcen =15;
End  case;

RETURN porcen;
END