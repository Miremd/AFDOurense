CREATE PROCEDURE `ActualizarStockJuego` (numJuego int , Cantidad int)
BEGIN
	declare stockactual int;
    select stock into stockactual from juegos where ID = numJuego;
		if consumo > stockactual then 
				select concat('No Quedan suficentes articulos de ese juego para ese juego');
            else
				UPDATE juegos set stock  = stock - consumo;
END IF ;
 END 