-- Crea una función llamada ContarJuegosPorCategoria que reciba el
-- nombre de una categoría y devuelva el número total de juegos en esa categoría dentro de la
-- tabla Juegos.
CREATE FUNCTION `ContarJuegosPorCategoria` (nomCat varchar(30))
RETURNS INTEGER deterministic
BEGIN
declare numJuegos int; 
select count(*) into numJuegos from juegos where categoria like nomCat;
RETURN numJuegos;
END