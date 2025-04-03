CREATE FUNCTION `ContarJuegosPorCategoria` (NomCat varchar (30))
RETURNS INTEGER
Deterministic

BEGIN
Declare numJuegos int;

Select count(*) into numJuegos
from juegos
where categoria like nomcat;
RETURN numJuegos;
END