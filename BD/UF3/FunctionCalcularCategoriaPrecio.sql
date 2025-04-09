-- Enunciado: Crea una función llamada ClasificarJuegoPorPrecio que reciba el
-- precio de un juego y devuelva una categoría:
-- "Económico" si es menor a 20€.
-- "Intermedio" si está entre 20€ y 50€.
-- "Premium" si es mayor a 50€.

CREATE FUNCTION `ClasificarJuegoPorPrecio` (precio float)
RETURNS varchar(40) deterministic
BEGIN
DECLARE clasificacion varchar (40);
if (precio < 20) THEN 
SET clasificacion = 'economico';
elseif (precio < 50) THEN 
SET clasificacion = 'intermedio';
else
SET clasificacion = 'premium';
END IF;
RETURN clasificacion;
END
