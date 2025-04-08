CREATE DEFINER=`root`@`localhost` PROCEDURE `ReporteStockBajo`()
BEGIN
-- Declara  variables
Declare idJuego int;
Declare nombreJuego varchar(50);
Declare catJuego varchar(30);
Declare  precioJuego  double;
Declare stockJuego int;
Declare fin int default 0;
-- declara el cursor para recorrer el resultado de la consulta
Declare recorre cursor for
Select ID, nombre, categoria, precio, stock 
from juegos 
where stock < 5;

Declare continue handler for not found set fin  =  1;

if fin  =  1 then
	select concat('Error');
else
	open recorre;
	fetch recorre into idJuego, nombreJuego, catJuego, precioJuego, stockJuego;
	while fin = 0 do
		select concat(idJuego,', ',nombreJuego,', ',catJuego,', ',precioJuego,', ',stockJuego);
		fetch recorre into idJuego, nombreJuego, catJuego, precioJuego, stockJuego;
	end while;
	close recorre;
end if;
END