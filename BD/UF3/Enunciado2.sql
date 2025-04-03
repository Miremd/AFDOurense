CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStockJuego`(numJuego  int, consumo  int)
BEGIN
DECLARE stockActual  int;
SELECT stock INTO  stockActual  FROM juegos  Where  ID = numJuego;

IF consumo > stockActual THEN
SELECT  ('No quedan suficientes articulos de ese juego');
ELSE
UPDATE juegos  SET stock  =  stock  - consumo where ID = numJuego;
SELECT  ('Decontados ', consumo,'  unidades del juego:  ',numJuego);
END IF;
END