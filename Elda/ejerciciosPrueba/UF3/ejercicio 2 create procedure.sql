CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStockJuego`(numJuego int, consumo int)
BEGIN
declare stockActual int;
select stock into stockActual from juegos where ID = numJuego; 
if consumo >stockActual then 
select ('No quedan suficientes articulos de ese juego'); 
else 
update juegos set stock = stock - consumo where ID = numJuego;
select concat('Descontados ',consumo,' unidades del juego ',numJuego);
end if;
END