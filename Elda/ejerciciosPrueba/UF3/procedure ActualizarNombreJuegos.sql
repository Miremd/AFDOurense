CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarNombreJuegos`()
BEGIN
declare codJuego int; 
declare nomJuego varchar(50);
declare cont int default 0; 
declare fin int default 0; 
declare miCursor cursor for 
select ID, nombre from juegos; 
declare continue handler for not found set fin =1; 
open miCursor; 
fetch miCursor into codJuego, nomJuego; 
	while (fin=0) do 
		if nomJuego = 'la loca pajareria de transilvania' then 
			set nomJuego = concat(nomJuego, ' version ', cont);
			update juegos set nombre = nomJuego 
			where ID= codJuego; 
			set cont= cont + 1; 
		end if; 
	fetch miCursor into codJuego, nomJuego; 
	end while; 
close miCursor; 
select ('Nombres de juegos repetidos actualizados');
END