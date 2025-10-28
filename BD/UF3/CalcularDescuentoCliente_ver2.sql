CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularDescuentoCliente2`(ID int) RETURNS int
    DETERMINISTIC
BEGIN
-- declaracion de variables
DECLARE antig int; -- variable para almacenar la antigüedad del cliente
DECLARE porcen int;
SET  porcen = 5;

SELECT  (year(curdate()) - year(fechaRegistro))  INTO  antig
From clientes
WHERE ID  =  ID;

IF (antig > 3)  THEN
SET porcen = 15;
ELSEIF (antig > 1) THEN
SET porcen = 10;
END IF;

RETURN porcen;
END