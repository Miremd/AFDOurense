-- Enunciado: Crea una función llamada ContarJuegosPorCategoria que reciba el
-- nombre de una categoría y devuelva el número total de juegos en esa categoría dentro de la
-- tabla Juegos.

CREATE FUNCTION `ContarJuegosPorCategoria` (nomCat varchar (30))
RETURNS INTEGER DETERMINISTIC
BEGIN
DECLARE numJuegos int;
SELECT COUNT(*) INTO numJuegos FROM juegos WHERE categoria LIKE nomCat;
RETURN numJuegos;
END
