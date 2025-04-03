-- Enunciado: Crea una función llamada CalcularDescuentoCliente que reciba el ID
-- de un cliente y devuelva un descuento según su antigüedad en la tienda:
--  Más de 3 años → 15%
-- Entre 1 y 3 años → 10%
-- Menos de 1 año → 5%

CREATE FUNCTION `CalcularDescuentoCliente` (cliente int)
RETURNS INTEGER deterministic
BEGIN
-- declaracion de variables 
DECLARE antig int; -- variable para almacenar la antigüedad del cliente
DECLARE porcen int;
SELECT (year(curdate()) - year(fechaRegistro)) INTO antig FROM clientes WHERE ID = cliente;
IF (antig > 3) THEN SET 
porcen = 15;
ELSEIF (antig > 1) THEN SET
porcen = 10;
ELSE SET porcen = 5;
END IF;
RETURN porcen;
END
