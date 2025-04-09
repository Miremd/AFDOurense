CREATE DEFINER=`root`@`localhost` PROCEDURE `VerJuegosCaros`()
BEGIN
--  Declaracion  de variables
Declare  numJuego  int;
Declare  nombreJuego varchar(50);
Declare precioJuego double (5,2);
Declare numPedidos  int;

Declare cont  int default 0;
Declare fin int default  0;
-- Declaracion del cursor
Declare c cursor for 
	Select  juegos.ID, nombre, precio, count(*)
	from juegos, detalle_pedidos
	where  juegos.id =detalle_pedidos.id_juego
	group  by  Id,  nombre, precio
	order by juegos.precio desc;
--  Procesado de la consulta
DECLARE continue  handler for not found set  fin  =  1;

IF fin =1  then
	Select concat('Error, nada en la select');
else
	Open c;
	Fetch c INTO  numJuego, nombreJuego, precioJuego, numPedidos;
	WHILE (cont < 3) DO
	  select  concat('ID: ',numJuego,' nombre Juego: ',nombreJuego,' precio:  ',precioJuego,' numero de pedidos: ', numPedidos)  "Datos  Juego";
	  Fetch c INTO  numJuego, nombreJuego, precioJuego, numPedidos;
	  set cont =cont +1;
	End While;
	close c;
End if;
END