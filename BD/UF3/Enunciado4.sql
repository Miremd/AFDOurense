CREATE FUNCTION `ContarJuegosPorCategoria` (nomCat varchar(30))
RETURNS INTEGER DETERMINISTIC
BEGIN
DECLARE  numJuegos  int;

SELECT Count(*) INTO numJuegos  From  Juegos  Where categoria  like nomCat;

RETURN numJuegos;
END