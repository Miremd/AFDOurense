-- Crea un procedimiento llamado AjustarPreciosInflacion que recorra 
-- todos los juegos y aumente su precio en un 5%, hasta que todos hayan sido actualizados.
CREATE PROCEDURE ` AjustarPreciosInflacion` ()
BEGIN
declare codJuego int; 
declare precioAnt double;
declare precioNuevo double; 
declare fin int default 0;
declare miCursor cursor for 
select ID, precio from juegos; 
declare continue handler for not found set fin =1; 
open miCursor; 
fetch miCursor into codJuego, precioAnt; 
while (fin =0) do 
set precioNuevo = precioAnt + (precioAnt * 5/100); 
update juegos set precio = precioNuevo where ID=codJuego; 
fetch miCursor into codJuego, precioAnt;
end while; 
close miCursor;
END
