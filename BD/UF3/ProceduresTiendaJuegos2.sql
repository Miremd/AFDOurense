CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStockJuego`(numJuego int,consumo int)
BEGIN
DECLARE stockActual int;
SELECT stock INTO stockActual FROM juegos WHERE ID = numJuego;

IF consumo > stockActual THEN 
SELECT('No quedan suficientes articulos de ese juego');
ELSE
UPDATE juegos SET stock = stock- consumo WHERE ID = numJuego;
SELECT CONCAT('Descontados', consumo, 'unidades del juego: ', numJuego);
END IF; 

END