CREATE DEFINER=`root`@`localhost` PROCEDURE `AplicarDescuentoJuegos`(cat  varchar(30))
BEGIN
Declare codJuego int;
Declare precioAnt double;
Declare precioNuevo double;
Declare fin int default 0;

Declare miCursor cursor  for
Select Id, precio 
from juegos where categoria like  cat;

Declare continue handler for not found set fin =1;

open miCursor;
fetch miCursor  into codJuego, precioAnt;

while (fin =  0)  do
	SET precioNuevo =  precioAnt  - (precioAnt *10/100);
	Update juegos set precio = precioNuevo where id = codJuego;
    fetch miCursor  into codJuego, precioAnt;
end while;
close miCursor;
END