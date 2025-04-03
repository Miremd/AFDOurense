CREATE FUNCTION `CalcularDescuentoCliente` (cliente int)
RETURNS INTEGER
Deterministic
BEGIN
-- Declaracion de variables
Declare antig int; -- Variable para almacenar la antigüedad
Declare porcen int;
Select (year(curdate()) - year(fechaRegistro)) into antig
from clientes
WHERE ID = cliente;

if (antig > 3) then 
SET porcen = 15;
elseif(antig > 1) then
SET porcen = 10;
else
SET porcen = 5;
end if;

RETURN porcen;
END;
