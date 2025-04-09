CREATE DEFINER=`root`@`localhost` PROCEDURE `ReporteStockBajo`()
BEGIN


DECLARE idJuego int;
DECLARE nombreJuego varchar (50);
DECLARE catJuego varchar (30);
DECLARE precioJuego double;
DECLARE stockJuego int;
DECLARE fin int default 0;
-- declara el cursor para recorrer el resultado de la consulta
DECLARE recorre cursor for
SELECT ID, nombre, categoria, precio, stock 
FROM juegos
WHERE stock < 5;
Declare continue handler for not found set fin = 1;
open recorre;
fetch recorre into idJuego, nombreJuego, catJuego, precioJuego, stockJuego;
while (fin = 0) do 
	select concat(idJuego,',', nombreJuego,', ' ,catJuego,',' ,precioJuego,',' ,stockJuego);
    fetch recorre into idJuego, nombreJuego, catJuego, precioJuego, stockJuego;
end while;
close recorre;
END