CREATE DEFINER=`root`@`localhost` PROCEDURE `ReporteStockBajo`()
BEGIN
declare idJuego int; 
declare nombreJuego varchar(50); 
declare categoriaJuego varchar(30); 
declare precioJuego double; 
declare stockJuego int; 
declare fin int default 0; 
declare recorre cursor for
select ID, nombre, categoria, precio, stock from juegos where stock < 5; 
declare continue handler for not found set fin = 1; 
open recorre; 
fetch recorre into idJuego, nombreJuego, categoriaJuego, precioJuego, stockJuego;
while (fin = 0) do 
select concat(idJuego,', ' ,nombreJuego,',' ,categoriaJuego,', ' ,precioJuego,', ' ,stockJuego);
fetch recorre into idJuego, nombreJuego, categoriaJuego, precioJuego, stockJuego;
end while; 
close recorre;  
END