CREATE DEFINER=`root`@`localhost` PROCEDURE `ReporteStockBajo`()
BEGIN
-- Declara variables
Declare idJuego,stock int;
Declare nombreJuego, categoria varchar (50);
Declare precio double;
Declare fin int default 0;
-- declara el cursor para recorrer resultado de la consulta
Declare recorre cursor for
Select ID, nombre,categoria,precio,stock
from juegos
where stock < 5;
Declare continue handler for not found set fin = 1;
open recorre;
fetch recorre into idJuego,nombreJuego,categoria,precio,stock;
while (fin = 0) do
select concat( idJuego,', ',nombreJuego,', ',categoria,', ',precio,', ',stock);
fetch recorre into idJuego,nombreJuego,categoria,precio,stock;
end while;
close recorre;
END