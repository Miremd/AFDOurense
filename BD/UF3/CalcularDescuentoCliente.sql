CREATE FUNCTION `CalcularDescuentoCliente` (cliente int)
RETURNS INTEGER DETERMINISTIC
BEGIN
-- declaracion de variables
DECLARE antig int; -- variable para almacenar la antigüedad del cliente
DECLARE porcen int;

SELECT  (year(curdate()) - year(fechaRegistro))  INTO  antig
From clientes
WHERE ID  =  cliente;

IF (antig > 3)  THEN
SET porcen = 15;
ELSEIF (antig > 1) THEN
SET porcen = 10;
ELSE
SET porcen = 5;
END IF;

RETURN porcen;
END
